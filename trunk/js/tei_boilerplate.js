function getPageBreaks(){
	return document.getElementsByTagName('pb');
}

function clearPageBreaks(){
	var pageBreaks = getPageBreaks();
	for(pageBreak in pageBreaks){
		pageBreaks[pageBreak].textContent = '';
	}
}

function addPageBreaks(){
	var pageBreaks = getPageBreaks();
	for(pageBreak in pageBreaks){
		if(null != pageBreaks[pageBreak].attributes.getNamedItem('n')
			&& undefined != pageBreaks[pageBreak].attributes.getNamedItem('n')){
			pageBreaks[pageBreak].textContent = "page: " 
				+ pageBreaks[pageBreak].attributes.getNamedItem('n').value
				+ "";
		}else{pageBreaks[pageBreak].textContent = "page"}
	}
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
