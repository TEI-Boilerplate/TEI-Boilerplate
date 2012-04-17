//  dw_event.js version date Oct 2009
//  basic event handling file from dyn-web.com

var dw_Event = {
  
    add: function(obj, etype, fp, cap) {
        cap = cap || false;
        if (obj.addEventListener) obj.addEventListener(etype, fp, cap);
        else if (obj.attachEvent) obj.attachEvent("on" + etype, fp);
    }, 

    remove: function(obj, etype, fp, cap) {
        cap = cap || false;
        if (obj.removeEventListener) obj.removeEventListener(etype, fp, cap);
        else if (obj.detachEvent) obj.detachEvent("on" + etype, fp);
    }, 
    
    DOMit: function(e) { 
        e = e? e: window.event; // e IS passed when using attachEvent though ...
        if (!e.target) e.target = e.srcElement;
        if (!e.preventDefault) e.preventDefault = function () { e.returnValue = false; return false; }
        if (!e.stopPropagation) e.stopPropagation = function () { e.cancelBubble = true; }
        return e;
    },
    
    getTarget: function(e) {
        e = dw_Event.DOMit(e); var tgt = e.target; 
        if (tgt.nodeType != 1) tgt = tgt.parentNode; // safari...
        return tgt;
    }
    
}
