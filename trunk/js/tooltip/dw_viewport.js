/*************************************************************************
  dw_viewport.js  
  free code from dyn-web.com
  version date: mar 2008
*************************************************************************/  
  
var dw_Viewport = {
    getWinWidth: function () {
        this.width = 0;
        if (window.innerWidth) 
            this.width = window.innerWidth - 18;
        else if (document.documentElement && document.documentElement.clientWidth) 
            this.width = document.documentElement.clientWidth;
        else if (document.body && document.body.clientWidth) 
            this.width = document.body.clientWidth;
        return this.width;
    },
  
    getWinHeight: function () {
        this.height = 0;
        if (window.innerHeight) 
            this.height = window.innerHeight - 18;
        else if (document.documentElement && document.documentElement.clientHeight) 
            this.height = document.documentElement.clientHeight;
        else if (document.body && document.body.clientHeight) 
            this.height = document.body.clientHeight;
        return this.height;
    },
  
    getScrollX: function () {
        this.scrollX = 0;
        if (typeof window.pageXOffset == "number") 
            this.scrollX = window.pageXOffset;
        else if (document.documentElement && document.documentElement.scrollLeft)
            this.scrollX = document.documentElement.scrollLeft;
        else if (document.body && document.body.scrollLeft) 
            this.scrollX = document.body.scrollLeft; 
        else if (window.scrollX) 
            this.scrollX = window.scrollX;
        return this.scrollX;
    },
    
    getScrollY: function () {
        this.scrollY = 0;    
        if (typeof window.pageYOffset == "number") 
            this.scrollY = window.pageYOffset;
        else if (document.documentElement && document.documentElement.scrollTop)
            this.scrollY = document.documentElement.scrollTop;
        else if (document.body && document.body.scrollTop) 
            this.scrollY = document.body.scrollTop; 
        else if (window.scrollY) 
            this.scrollY = window.scrollY;
        return this.scrollY;
    },
    
    getAll: function () {
        this.getWinWidth(); this.getWinHeight();
        this.getScrollX();  this.getScrollY();
    }
  
}
