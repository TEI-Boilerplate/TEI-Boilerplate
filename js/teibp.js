function clearPageBreaks(){
	$("pb").css("display","none");
}

function addPageBreaks(){
	$("pb").css("display","block");	
}

function init(){
	document.getElementById('pbToggle').onclick = function(){
		if(document.getElementById('pbToggle').checked){
			clearPageBreaks();
		}else{
			addPageBreaks();
		}
	};
	addPageBreaks();
	document.getElementById('pbToggle').checked = false;
}

//If W3C event model used, prefer that. Window events are fallbacks
if(document.addEventListener){
	//W3C event model used
	document.addEventListener("DOMContentLoaded", init, false);
	window.addEventListener("load", init, false);
} else if(document.attachEvent){
	//IE event model used
	document.attachEvent( "onreadystatechange", init);
	window.attachEvent( "onload", init);
}

function switchThemes(theme){
	document.getElementById('maincss').href=theme.options[theme.selectedIndex].value;
}
