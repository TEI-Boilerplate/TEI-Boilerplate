/*************************************************************************
    This code is from Dynamic Web Coding at dyn-web.com
    Copyright 2008-2010 by Sharon Paine 
    See Terms of Use at www.dyn-web.com/business/terms.php
    regarding conditions under which you may use this code.
    This notice must be retained in the code as is!
    
    for use with dw_tooltip.js
    Version date: July 2010
*************************************************************************/

// NOTE: means of adding tipContent style rule is available for xml (without document.write)
// Used when the tooltip content is in HTML elements with tipContent class attached 
dw_Tooltip.writeStyleRule = function() {
    if ( dw_Tooltip.hasSupport() ) {
        document.write('<style type="text/css" media="screen">.tipContent { display:none; }</style>');
    }
}

///////////////////////////////////////////////////////////////////////////////////
//  Initialization: init tooltip and set up event delegation

dw_Event.add( window, 'load', dw_Tooltip.init );
dw_Event.add( window, 'load', dw_Tooltip.initHandlers );

/////////////////////////////////////////////////////////////////////
//  Positioning algorithms 

dw_Tooltip.positionWindowCenter = function() {
    var x = Math.round( (dw_Viewport.width - dw_Tooltip.tip.offsetWidth)/2 ) + dw_Viewport.scrollX;
    var y = Math.round( (dw_Viewport.height - dw_Tooltip.tip.offsetHeight)/2 ) + dw_Viewport.scrollY;
    dw_Tooltip.setPosition(x,y);
}

// more later or TBA

/////////////////////////////////////////////////////////////////////
// formatting and display functions 

// for style sheet specs: table#stickyTable, tr.stickyBar, 
// div.stickyTitle, div.stickyContent (inside td's)
dw_Tooltip.wrapSticky = function(str, title) {
    title = title || '';
    var src = dw_Tooltip.defaultProps['closeBoxImage'];
    var msg = '<table id="stickyTable" border="0" cellpadding="0" cellspacing="0" width="100%"><tr class="stickyBar">' + 
        '<td><div class="stickyTitle">' + title + '</div></td>' + 
        '<td style="text-align:right"><a href="javascript: void dw_Tooltip.hide()">' + 
        '<img style="float:right" src="' + src + '" border="0" /></a></td></tr>' + 
        '<tr><td colspan="2"><div class="stickyContent">' + str + '</div></td></tr></table>';
    return msg;
}

// optional caption, optional width supported by all these wrapFn's

dw_Tooltip.wrapToWidth = function(obj) {
    if (!obj) return ''; var str = obj['str']; 
    var caption = obj['caption'] || '';
    if ( this.sticky && this.defaultProps['showCloseBox'] ) {
        str = dw_Tooltip.wrapSticky(str, caption );
    } else {
        if (caption) { str = '<div class="caption">' + obj['caption']  + '</div>' + str; }
    }
    if ( obj['w'] ) this.setTipWidth( obj['w'] );
    return str;
}

// w, h in obj are width and height of image
dw_Tooltip.wrapImageToWidth = function(obj) {
    if (!obj) return ''; dw_Util.getImage( obj['img'] );
    var caption = obj['caption'] || ''; var w = obj['w'];
    var str = '<img src="' + obj['img'] + '" width="' + w + '" height="' + obj['h'] + '" alt="">';
    if ( this.sticky && this.defaultProps['showCloseBox'] ) {
        str = dw_Tooltip.wrapSticky(str, caption );
        w += 8; // attempt to account for padding etc of inner wrapper
    } else {
        if (caption) { str = '<div class="caption">' + obj['caption']  + '</div>' + str; }
    }
    if (w) this.setTipWidth(w);
    return str;
}

// Image and text side by side
// w is width to set tipDiv
dw_Tooltip.wrapTextByImage = function(obj) {
    if (!obj) return ''; dw_Util.getImage( obj['img'] );
    var caption = obj['caption'] || '';
    var str = '<table cellpadding="0" cellspacing="0" border="0"><tr>' + 
        '<td><div class="txt">' + obj['txt'] + '</div></td>' + 
         '<td><div class="img"><img src="' + obj['img'] + '" /></div>' + 
         '</td></tr></table>';
    
    if ( this.sticky && this.defaultProps['showCloseBox'] ) {
        str = dw_Tooltip.wrapSticky(str, caption );
    } else {
        if (caption) { str = '<div class="caption">' + obj['caption']  + '</div>' + str; }
    }
    if ( obj['w'] ) this.setTipWidth( obj['w'] );
    return str;
}

dw_Tooltip.wrapImageOverText = function(obj) {
    if (!obj) return ''; dw_Util.getImage( obj['img'] );
    var caption = obj['caption'] || '';
    var str = '<div class="img"><img src="' + obj['img'] + '" /></div><div class="txt">' + obj['txt'] + '</div>';
    if ( this.sticky && this.defaultProps['showCloseBox'] ) {
        str = dw_Tooltip.wrapSticky(str, caption );
    } else {
        if (caption) { str = '<div class="caption">' + obj['caption']  + '</div>' + str; }
    }
    if ( obj['w'] ) this.setTipWidth( obj['w'] );
    return str;
}

dw_Tooltip.wrapTextOverImage = function(obj) {
    if (!obj) return ''; dw_Util.getImage( obj['img'] );
    var caption = obj['caption'] || '';
    var str = '<div class="txt">' + obj['txt'] + '</div><div class="img"><img src="' + obj['img'] + '" /></div>';
    if ( this.sticky && this.defaultProps['showCloseBox'] ) {
        str = dw_Tooltip.wrapSticky(str, caption );
    } else {
        if (caption) { str = '<div class="caption">' + obj['caption']  + '</div>' + str; }
    }
    if ( obj['w'] ) this.setTipWidth( obj['w'] );
    return str;
}

// several functions include option of setting width 
dw_Tooltip.setTipWidth = function(w) {
    w = parseInt(w) + dw_Util.forBackCompatWidth( this.tip ); // in case padding and border set on tipDiv
    this.tip.style.width = w + "px";
}

/////////////////////////////////////////////////////////////////////
//  a few  utility functions 

var dw_Util; if (!dw_Util) dw_Util = {};

dw_Util.getImage = function (src) {
    var img = new Image();
    img.src = src;
}

// To obtain padding and border for setting width on an element
dw_Util.forBackCompatWidth = function (el) {
    var val = 0;
    var getStyle = dw_Util.getCurrentStyle;
    if ( el.currentStyle && !window.opera && (document.compatMode == null || document.compatMode == "BackCompat") ) {
        var pl = parseInt( dw_Util.getCurrentStyle(el, 'paddingLeft') );
        var pr = parseInt( dw_Util.getCurrentStyle(el, 'paddingRight') );
        var bl = parseInt( dw_Util.getCurrentStyle(el, 'borderLeftWidth') );
        var br = parseInt( dw_Util.getCurrentStyle(el, 'borderRightWidth') );
        val = (!isNaN(pl)? pl: 0) + (!isNaN(pr)? pr: 0) + (!isNaN(bl)? bl: 0) + (!isNaN(br)? br: 0);
    }
    return val;
}

// prop must be camelCase (e.g., paddingLeft, borderLeftWidth)
dw_Util.getCurrentStyle = function (el, prop) {
    var val = '';
    if (document.defaultView && document.defaultView.getComputedStyle) {
        val = document.defaultView.getComputedStyle(el, null)[prop];
    } else if (el.currentStyle) {
        val = el.currentStyle[prop];
            // from jquery, dean edwards, see http://erik.eae.net/archives/2007/07/27/18.54.15/#comment-102291
            if ( !/^\d+(px)?$/i.test(val) && /^\d/.test(val) ) {
				var style = el.style.left;
				var runtimeStyle = el.runtimeStyle.left;
				el.runtimeStyle.left = el.currentStyle.left;
				el.style.left = val || 0;
				val = el.style.pixelLeft + "px";
				el.style.left = style;
				el.runtimeStyle.left = runtimeStyle;
			}
    }
    return val;
}
