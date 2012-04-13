/*
$(document).ready(function() {
	alert("hey");
	$("html > head > title").text($("TEI > teiHeader > fileDesc > titleStmt > title:first").text());
	$('pb').each(function(index) {
		$(this).text("[page: " + $(this).attr('n') + "]");
	});
	$.unblockUI();				
});
*/

function getPageBreaks(){
	return document.getElementsByTagName('pb');
}

function clearPageBreaks(){
	var pageBreaks = getPageBreaks();
	for(pageBreak in pageBreaks){
		pageBreak.textContent = '';
	}
}

function addPageBreaks(){
	var pageBreaks = getPageBreaks();
	alert(pageBreaks);
	var attrs;
	for(pageBreak in pageBreaks){
		//alert(pageBreak.attributes);
		if(null != pageBreaks[pageBreak].attributes.getNamedItem('n')){
			pageBreaks[pageBreak].textContent = pageBreaks[pageBreak].attributes.getNamedItem('n').value;
		}
	}
}

while(document.readyState != 'interactive' && document.readyState != 'complete'){
	//Do nothing. We're waiting for the document to be available.
}

document.getElementById('pbToggle').onclick = function(){
	if(document.getElementById('pbToggle').checked){
		addPageBreaks();
		//alert('checked');	
	}else{
		clearPageBreaks();
		//alert('cleared');
	}
};

addPageBreaks();



