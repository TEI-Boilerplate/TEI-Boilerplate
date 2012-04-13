What is TEI Boilerplate

TEI Boilerplate is a bundle of files including:

* TEI/XML template
* XSLT Stylesheet for copying the TEI document, with a very few modifications, into an HTML5 wrapper
* CSS for styling the output document (HTML5 & TEI/XML).

First off, I am a huge XSLT fan and fancy myself a reasonably talented and knowledgeable author of XSLT documents. But sometimes XSLT overkill, and it remains unfamiliar to many advanced TEI users and web designers/developers. The potential complexity of TEI documents necessitates correspondingly complex TEI to HTML XSLT stylesheets, especially if the stylesheets attempt a comprehensive handling of the TEI vocabulary and the very many possibilities and permutations.

The approach of TEI Boilerplate is simply to copy the TEI document into an HTML5 wrapper, which provides access to javascript and other features of the HTML environment. CSS is then used to style both the HTML wrapper and the embedded TEI/XML document. This has the advantage of simplicity, but on a conceptual and theoretical level it provides the advantage of linking the design to the crafted/authored/meaningful/semantic TEI/XML document rather than a potentially vague and confusing derived HTML surrogate. 

Why spend significant time and resources writing or implementing a complex set of XSLT stylesheets when the goals are simply to publish, and optionally index and search, one or more TEI/XML documents? TEI Boilerplate uses CSS to provide a simple clean display of TEI/XML documents. It also employs one very simple XSLT sheet that copies the TEI/XML document into an HTML5 wrapper that wraps the TEI/XML document and provides access to javascript and javascript libraries. When the TEI document is copies, a handful of elements are transformed or added:

* TEI `<ref>` and `<ptr>` elements are transformed to html `<a>` elements.
* TEI `<figure>` elements are transformed to hmtl `<img>` elements.
* TEI @rend attribute values are copied to html @span attributes.

TEI Boilerplate goals include providing a simple solution for publishing usable and welcoming presentations of TEI/XML-encoded documents and aiding the beautiful, performative, and inquisitive designing of encoded texts.


To Do:
	- Update XSLT to produce COINS metadata in HTML5 wrapper.
	
	
#rambling thoughts about TEI Boilerplate/argument for/sales pitch

We're not about searching or text analysis or preservation. We love all those things but that's not what TEI Boilerplate is for. TEI Boilerplate solves this simple problem. People want to publish TEI documents. They want to encode a document and publish it to the web to iPads and iPhones or print it out and have it look pretty. Typically people do that using XSLT. We *LOVE* XSLT, but we love it in part because its crazy geeky and weird and powerful and puzzle-like. That's fun, but not everyone wants to get into that weird programmerly world of XSLT and lots of people have mad skills with HTML and CSS. With TEI Boilerplate, you attach an XSLT 1.0 document to your TEI document using the standard <?xsl-stylesheet ?> declaration. This very simple XSLT embeds your TEI document into an HTML 5 shell, with links to CSS and JQuery and all the cool tools and utilities rad web developer kids want their hands on today. TEI Boilerplate includes CSS that styles the TEI document. There is a crucial conceptual advantage here. In many cases, these TEI documents are painstakingly created, by hand, and represent countless hours of research and study. When designing how the TEI document should look, why add the layer of HTML and strip the document of all its semantic richness? In terms of interacting with and learning from the encoded document, the process of designing and styling a document is an incredibly interpretive, transformative, informative exercise. It is moreso, we think, when the document being molded is the TEI document rather than an intermediary HTML. If one needed a battle cry for this approach, it might be “I Want My TEI!” [Image of I want my MTV guy] HTML is wonderful and powerful, that's why we embed the TEI in an HTML 5 shell, so we can take advantage of all the HTML goodies. But as a designer and web developer, when you want to do something with epigraphs, you want to work with the `<epigraph>` tag, not the HTML `<div class="epigraph">` or some such. The only obvious reason for transforming TEI to HTML is to publish it in Web browsers. It's a lot of work to write [good stylesheets](http://www.tei-c.org/Tools/Stylesheets/) for transforming TEI into HTML. And it's unnecessary in many cases. 