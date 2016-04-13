<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-stylesheet type="text/xsl" href="teibp.xsl"?>
<TEI xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:svg="http://www.w3.org/2000/svg" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns="http://www.tei-c.org/ns/1.0" 
xmlns:html="http://www.w3.org/1999/xhtml">
  <teiHeader>
    <fileDesc>
      <titleStmt>
        <title type="main">TEI Boilerplate</title>
        <title type="sub">Styles available in the <ref target="../content/teibp.xml">TEI Boilerplate Template</ref> (<ref target="../content/teibp.xml">teibp.xml</ref>)</title>
      </titleStmt>
      <publicationStmt>
        <pubPlace>Bloomington, IN</pubPlace>
        <publisher>Digital Culture Lab, School of Library &amp; Information Science, Indiana University</publisher>
        <availability status="free">
          <p>Copyright © 2012. TEI Boilerplate.</p>
          <p>
          <ref n="license" target="http://creativecommons.org/licenses/by/3.0/"><figure rend="border-width:0;"><figDesc>Creative Commons License</figDesc><graphic url="http://i.creativecommons.org/l/by/3.0/80x15.png"/></figure></ref><lb />TEI Boilerplate s licensed under a <ref n="license" target="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0 Unported License</ref>.
          </p>
        </availability>
      </publicationStmt>
      <sourceDesc>
        <p>This TEI/XML document is the original source</p>
      </sourceDesc>
    </fileDesc>
    <encodingDesc>
      <tagsDecl>
        <!-- Basic text formatting: bold, italic, underline, "normal," etc. -->
        <rendition xml:id="b" n="tiebp:bold" scheme="css">
          font-weight:bold;
        </rendition> 
        
        <rendition xml:id="i" n="tiebp:italic" scheme="css">
          font-style:italic;
        </rendition> 
        
        <rendition xml:id="u" n="tiebp:underline" scheme="css">
          text-decoration:underline;
        </rendition> 
        
        <rendition xml:id="n" n="teibp:normal" scheme="css">
          font-weight:normal;
          text-decoration:none;
          font-style:normal;
        </rendition>
        
        <rendition xml:id="mono" n="teibp:mono" scheme="css">
          font-family:Monaco,Courier,monospace;
        </rendition>
        
        <rendition xml:id="super" n="tiebp:super" scheme="css">
          vertical-align:super;
          font-size:80%;
        </rendition>
        
        <rendition xml:id="sub" n="tiebp:sub" scheme="css">
          vertical-align:sub;
          font-size:80%;
        </rendition>
        
        <rendition xml:id="lowercase" n="tiebp:lowercase" scheme="css">
          text-transform:lowercase;
        </rendition>
        
        <rendition xml:id="uppercase" n="tiebp:uppercase" scheme="css">
          text-transform:uppercase;
        </rendition>
        
        <rendition xml:id="capitalize" n="tiebp:capitalize" scheme="css">
          text-transform:capitalize;
        </rendition>
        
        <rendition xml:id="small-caps" n="tiebp:small-caps" scheme="css">
          font-variant:small-caps;
        </rendition>
        
        <!-- Blocks. -->
        <rendition xml:id="block" n="tiebp:block" scheme="css">
          display:block;
        </rendition> 
        
        <rendition xml:id="blockquote" n="tiebp:blockquote" scheme="css">
          display:block;
          font-size:90%;
          margin-left:3em;
          padding-left:1em;
          border-left: 1px solid gray;
          margin-top:.75em;
          margin-bottom:.75em;
          padding-top:.75em;
          padding-bottom:.75em;
        </rendition>
        
        <rendition corresp="#blockquote" n="tiebp:blockquote" scheme="css" scope="before">
          <!-- This turns off the default generated quotes for block quotes. -->
          content:"" !important;
        </rendition>
        
        <rendition corresp="#blockquote" n="tiebp:blockquote" scheme="css" scope="after">
          <!-- This turns off the default generated quotes for block quotes. -->
          content:"" !important;
        </rendition>
        
        <rendition xml:id="codeblock" n="teibp:codeblock" scheme="css">
          display: block;
          font-size: 80%;
          margin-left: 1em;
          padding-left: 1em;
          border-left: 1px solid gray;
          margin-top: .75em;
          margin-bottom: .75em;
          padding-top: .75em;
          padding-bottom: .75em;
          font-family:Monaco,Courier,monospace;
          white-space:pre;
        </rendition>
        
        <!-- Inline -->
        
        <rendition xml:id="inline" n="teibp:inline" scheme="css">
          display:inline;
        </rendition>
        
        <!-- Alignment. -->
        <rendition xml:id="center" n="tiebp:center" scheme="css">
          display:block;
          text-align:center;
          margin-left:auto;
          margin-right:auto;
        </rendition>
        
        <rendition xml:id="left" n="teibp:left" scheme="css">
          text-align:left;
        </rendition>
        
        <rendition xml:id="right" n="teibp:right" scheme="css">
          text-align:right;
        </rendition>
        
        <rendition xml:id="justify" n="teibp:justify" scheme="css">
          text-align:justify;
        </rendition>
        
        <rendition xml:id="center-block" n="tiebp:center-block" scheme="css">
          display:block;
          margin-left:auto;
          margin-right:auto;
        </rendition>
        
        <!-- Indentation -->
        <rendition xml:id="hang" n="teibp:hang" scheme="css">
          display:block;
          padding-left:2.5em;
          text-indent:-2.5em;
        </rendition>
        
        <!-- Indentation for verse lines. Results in a “hanging” indent if
					the line wraps. -->
        <rendition xml:id="l-indent-01" n="tiebp:l-indent-01" scheme="css">
          display:block;
          padding-left:4em;
          text-indent:-2em;
        </rendition>
        
        <rendition xml:id="l-indent-02" n="tiebp:l-indent-02" scheme="css">
          display:block;
          padding-left:6em;
          text-indent:-2em;
        </rendition>
        
        <rendition xml:id="l-indent-03" n="tiebp:l-indent-03" scheme="css">
          display:block;
          padding-left:8em;
          text-indent:-2em;
        </rendition>
        
        <rendition xml:id="l-indent-04" n="tiebp:l-indent-04" scheme="css">
          display:block;
          padding-left:10em;
          text-indent:-2em;
        </rendition>
        
        <rendition xml:id="l-indent-05" n="tiebp:l-indent-05" scheme="css">
          display:block;
          padding-left:12em;
          text-indent:-2em;
        </rendition>
        
        <rendition xml:id="l-indent-06" n="tiebp:l-indent-06" scheme="css">
          display:block;
          padding-left:14em;
          text-indent:-2em;
        </rendition>
        
        <rendition xml:id="l-indent-07" n="tiebp:l-indent-07" scheme="css">
          display:block;
          padding-left:16em;
          text-indent:-2em;
        </rendition>
        
        <rendition xml:id="l-indent-08" n="tiebp:l-indent-08" scheme="css">
          display:block;
          padding-left:18em;
          text-indent:-2em;
        </rendition>
        
        <rendition xml:id="indent" n="tiebp:indent" scheme="css" scope="before">
          /* text-indent:4em; */
          /* The above method of describing an indentation for, say, a paragraph is preferred.
          The method being used is in response to a bug in some browsers whereby a block
          element, like a paragraph, is erroneously re-indented after interruption by another 
          block element (like a list, which is valid inside a paragraph). */
          content:"\A0\A0\A0\A0\A0\A0";
        </rendition>
        
        <!-- font sizes -->
        
        <rendition xml:id="small" n="tiebp:small" scheme="css">
          font-size:90%;
        </rendition>
        
        <rendition xml:id="x-small" n="tiebp:x-small" scheme="css">
          font-size:85%;
        </rendition>
        
        <rendition xml:id="xx-small" n="tiebp:xx-small" scheme="css">
          font-size:80%;
        </rendition>
        
        <rendition xml:id="large" n="tiebp:large" scheme="css">
          font-size:110%;
        </rendition>
        
        <rendition xml:id="x-large" n="tiebp:x-large" scheme="css">
          font-size:115%;
        </rendition>
        
        <rendition xml:id="xxx-large" n="tiebp:xxx-large" scheme="css">
          font-size:120%;
        </rendition>
        
        <rendition xml:id="bracket" n="teibp:bracket" scheme="css"/>
        
        <rendition corresp="#bracket" n="tiebp:bracket" scheme="css" scope="before">
          content:"&lt;";
        </rendition>
        
        <rendition corresp="#bracket" n="tiebp:bracket" scheme="css" scope="after">
          content:">";
        </rendition>
        
      </tagsDecl>
    </encodingDesc>
  </teiHeader>
  <text>
    <body>
      <div>
        <p>
          The <ref target="../content/teibp.xml">TEI Boilerplate Template</ref> (<ref target="../content/teibp.xml">teibp.xml</ref>) is pre-populated with a number of rendition styles for use in describing styles encountered in source documents or expressing style information in born-digital TEI documents.
        </p>
        <p>
        The following <gi>tagsDecl</gi> element is included in the <gi>teiHeader</gi> of the TEI Boilerplate template:
        <egXML xmlns="http://www.tei-c.org/ns/Examples" rend="width:50em;">
<tagsDecl>
  <!-- Basic text formatting: bold, italic, underline, "normal," etc. -->
  <rendition xml:id="b" n="tiebp:bold" scheme="css">
    font-weight:bold;
  </rendition> 
  
  <rendition xml:id="i" n="tiebp:italic" scheme="css">
    font-style:italic;
  </rendition> 
  
  <rendition xml:id="u" n="tiebp:underline" scheme="css">
    text-decoration:underline;
  </rendition> 
  
  <rendition xml:id="n" n="teibp:normal" scheme="css">
    font-weight:normal;
    text-decoration:none;
    font-style:normal;
  </rendition>
  
  <rendition xml:id="mono" n="teibp:mono" scheme="css">
    font-family:Monaco,Courier,monospace;
  </rendition>
  
  <rendition xml:id="super" n="tiebp:super" scheme="css">
    vertical-align:super;
    font-size:80%;
  </rendition>
  
  <rendition xml:id="sub" n="tiebp:sub" scheme="css">
    vertical-align:sub;
    font-size:80%;
  </rendition>
  
  <rendition xml:id="lowercase" n="tiebp:lowercase" scheme="css">
    text-transform:lowercase;
  </rendition>
  
  <rendition xml:id="uppercase" n="tiebp:uppercase" scheme="css">
    text-transform:uppercase;
  </rendition>
  
  <rendition xml:id="capitalize" n="tiebp:capitalize" scheme="css">
    text-transform:capitalize;
  </rendition>
  
  <rendition xml:id="small-caps" n="tiebp:small-caps" scheme="css">
    font-variant:small-caps;
  </rendition>
  
  <!-- Blocks. -->
  <rendition xml:id="block" n="tiebp:block" scheme="css">
    display:block;
  </rendition> 
  
  <rendition xml:id="blockquote" n="tiebp:blockquote" scheme="css">
    display:block;
    font-size:90%;
    margin-left:3em;
    padding-left:1em;
    border-left: 1px solid gray;
    margin-top:.75em;
    margin-bottom:.75em;
    padding-top:.75em;
    padding-bottom:.75em;
  </rendition>
  
  <rendition corresp="#blockquote" n="tiebp:blockquote" scheme="css" scope="before">
    <!-- This turns off the default generated quotes for block quotes. -->
    content:"" !important;
  </rendition>
  
  <rendition corresp="#blockquote" n="tiebp:blockquote" scheme="css" scope="after">
    <!-- This turns off the default generated quotes for block quotes. -->
    content:"" !important;
  </rendition>
  
  <rendition xml:id="codeblock" n="teibp:codeblock" scheme="css">
    display: block;
    font-size: 80%;
    margin-left: 1em;
    padding-left: 1em;
    border-left: 1px solid gray;
    margin-top: .75em;
    margin-bottom: .75em;
    padding-top: .75em;
    padding-bottom: .75em;
    font-family:Monaco,Courier,monospace;
    white-space:pre;
  </rendition>
  
  <!-- Inline -->
  
  <rendition xml:id="inline" n="teibp:inline" scheme="css">
    display:inline;
  </rendition>
  
  <!-- Alignment. -->
  <rendition xml:id="center" n="tiebp:center" scheme="css">
    display:block;
    text-align:center;
    margin-left:auto;
    margin-right:auto;
  </rendition>
  
  <rendition xml:id="left" n="teibp:left" scheme="css">
    text-align:left;
  </rendition>
  
  <rendition xml:id="right" n="teibp:right" scheme="css">
    text-align:right;
  </rendition>
  
  <rendition xml:id="justify" n="teibp:justify" scheme="css">
    text-align:justify;
  </rendition>
  
  <rendition xml:id="center-block" n="tiebp:center-block" scheme="css">
    display:block;
    margin-left:auto;
    margin-right:auto;
  </rendition>
  
  <!-- Indentation -->
  <rendition xml:id="hang" n="teibp:hang" scheme="css">
    display:block;
    padding-left:2.5em;
    text-indent:-2.5em;
  </rendition>
  
  <!-- Indentation for verse lines. Results in a “hanging” indent if
the line wraps. -->
  <rendition xml:id="l-indent-01" n="tiebp:l-indent-01" scheme="css">
    display:block;
    padding-left:4em;
    text-indent:-2em;
  </rendition>
  
  <rendition xml:id="l-indent-02" n="tiebp:l-indent-02" scheme="css">
    display:block;
    padding-left:6em;
    text-indent:-2em;
  </rendition>
  
  <rendition xml:id="l-indent-03" n="tiebp:l-indent-03" scheme="css">
    display:block;
    padding-left:8em;
    text-indent:-2em;
  </rendition>
  
  <rendition xml:id="l-indent-04" n="tiebp:l-indent-04" scheme="css">
    display:block;
    padding-left:10em;
    text-indent:-2em;
  </rendition>
  
  <rendition xml:id="l-indent-05" n="tiebp:l-indent-05" scheme="css">
    display:block;
    padding-left:12em;
    text-indent:-2em;
  </rendition>
  
  <rendition xml:id="l-indent-06" n="tiebp:l-indent-06" scheme="css">
    display:block;
    padding-left:14em;
    text-indent:-2em;
  </rendition>
  
  <rendition xml:id="l-indent-07" n="tiebp:l-indent-07" scheme="css">
    display:block;
    padding-left:16em;
    text-indent:-2em;
  </rendition>
  
  <rendition xml:id="l-indent-08" n="tiebp:l-indent-08" scheme="css">
    display:block;
    padding-left:18em;
    text-indent:-2em;
  </rendition>
  
  <rendition xml:id="indent" n="tiebp:indent" scheme="css" scope="before">
    /* text-indent:4em; */
    /* The above method of describing an indentation for, say, a paragraph is 
    preferred. The method being used is in response to a bug in some browsers 
    whereby a block element, like a paragraph, is erroneously re-indented 
    after interruption by another block element (like a list, which is valid,
    in TEI, inside a paragraph). */
    content:"\A0\A0\A0\A0\A0\A0";
  </rendition>
  
  <!-- font sizes -->
  
  <rendition xml:id="small" n="tiebp:small" scheme="css">
    font-size:90%;
  </rendition>
  
  <rendition xml:id="x-small" n="tiebp:x-small" scheme="css">
    font-size:85%;
  </rendition>
  
  <rendition xml:id="xx-small" n="tiebp:xx-small" scheme="css">
    font-size:80%;
  </rendition>
  
  <rendition xml:id="large" n="tiebp:large" scheme="css">
    font-size:110%;
  </rendition>
  
  <rendition xml:id="x-large" n="tiebp:x-large" scheme="css">
    font-size:115%;
  </rendition>
  
  <rendition xml:id="xxx-large" n="tiebp:xxx-large" scheme="css">
    font-size:120%;
  </rendition>
  
  <rendition xml:id="bracket" n="teibp:bracket" scheme="css"/>
  
  <rendition corresp="#bracket" n="tiebp:bracket" scheme="css" scope="before">
    content:"&lt;";
  </rendition>
  
  <rendition corresp="#bracket" n="tiebp:bracket" scheme="css" scope="after">
    content:">";
  </rendition>
  
</tagsDecl>
        </egXML>
        </p>
        <p>
        These <gi>rendition</gi> styles are transformed into CSS declarations in TEI Boilerplate's HTML5 that surrounds the TEI document. Below are the CSS declarations derived from the TEI <gi>rendition</gi> elements:
          <egXML xmlns="http://www.tei-c.org/ns/Examples">
<style type="text/css">
  [rendition~="#b"] {
  font-weight: bold;
  }
  
  [rendition~="#i"] {
  font-style: italic;
  }
  
  [rendition~="#u"] {
  text-decoration: underline;
  }
  
  [rendition~="#n"] {
  font-weight: normal;
  text-decoration: none;
  font-style: normal;
  }
  
  [rendition~="#mono"] {
  font-family: Monaco,Courier,monospace;
  }
  
  [rendition~="#super"] {
  vertical-align: super;
  font-size: 80%;
  }
  
  [rendition~="#sub"] {
  vertical-align: sub;
  font-size: 80%;
  }
  
  [rendition~="#lowercase"] {
  text-transform: lowercase;
  }
  
  [rendition~="#uppercase"] {
  text-transform: uppercase;
  }
  
  [rendition~="#capitalize"] {
  text-transform: capitalize;
  }
  
  [rendition~="#small-caps"] {
  font-variant: small-caps;
  }
  
  [rendition~="#block"] {
  display: block;
  }
  
  [rendition~="#blockquote"] {
  display: block;
  font-size: 90%;
  margin-left: 3em;
  padding-left: 1em;
  border-left: 1px solid gray;
  margin-top: .75em;
  margin-bottom: .75em;
  padding-top: .75em;
  padding-bottom: .75em;
  }
  
  [rendition~="#blockquote"]:before {
  content: "" !important;
  }
  
  [rendition~="#blockquote"]:after {
  content: "" !important;
  }
  
  [rendition~="#codeblock"] {
  display: block;
  font-size: 80%;
  margin-left: 1em;
  padding-left: 1em;
  border-left: 1px solid gray;
  margin-top: .75em;
  margin-bottom: .75em;
  padding-top: .75em;
  padding-bottom: .75em;
  font-family: Monaco,Courier,monospace;
  white-space: pre;
  }
  
  [rendition~="#inline"] {
  display: inline;
  }
  
  [rendition~="#center"] {
  display: block;
  text-align: center;
  margin-left: auto;
  margin-right: auto;
  }
  
  [rendition~="#left"] {
  text-align: left;
  }
  
  [rendition~="#right"] {
  text-align: right;
  }
  
  [rendition~="#justify"] {
  text-align: justify;
  }
  
  [rendition~="#center-block"] {
  display: block;
  margin-left: auto;
  margin-right: auto;
  }
  
  [rendition~="#hang"] {
  display: block;
  padding-left: 2.5em;
  text-indent: -2.5em;
  }
  
  [rendition~="#l-indent-01"] {
  display: block;
  padding-left: 4em;
  text-indent: -2em;
  }
  
  [rendition~="#l-indent-02"] {
  display: block;
  padding-left: 6em;
  text-indent: -2em;
  }
  
  [rendition~="#l-indent-03"] {
  display: block;
  padding-left: 8em;
  text-indent: -2em;
  }
  
  [rendition~="#l-indent-04"] {
  display: block;
  padding-left: 10em;
  text-indent: -2em;
  }
  
  [rendition~="#l-indent-05"] {
  display: block;
  padding-left: 12em;
  text-indent: -2em;
  }
  
  [rendition~="#l-indent-06"] {
  display: block;
  padding-left: 14em;
  text-indent: -2em;
  }
  
  [rendition~="#l-indent-07"] {
  display: block;
  padding-left: 16em;
  text-indent: -2em;
  }
  
  [rendition~="#l-indent-08"] {
  display: block;
  padding-left: 18em;
  text-indent: -2em;
  }
  
  [rendition~="#indent"]:before {
  content: "\A0\A0\A0\A0\A0\A0";
  }
  
  [rendition~="#small"] {
  font-size: 90%;
  }
  
  [rendition~="#x-small"] {
  font-size: 85%;
  }
  
  [rendition~="#xx-small"] {
  font-size: 80%;
  }
  
  [rendition~="#large"] {
  font-size: 110%;
  }
  
  [rendition~="#x-large"] {
  font-size: 115%;
  }
  
  [rendition~="#xxx-large"] {
  font-size: 120%;
  }
  
  [rendition~="#bracket"] {
  }
  
  [rendition~="#bracket"]:before {
  content: "&lt;";
  }
  
  [rendition~="#bracket"]:after {
  content: "&gt;";
  }
</style>      
          </egXML>
        </p>
        <p>
        With this rendition infrastructure, one simply needs to use the global <att>rendition</att> attribute to reference these styles. For instance, if one wants to make a heading <soCalled>large</soCalled>, bold, and centered one could use the following code:
        	<egXML xmlns="http://www.tei-c.org/ns/Examples" rend="width:50em;">
<head rendition="#b #center #large">My Big Bold Centered Head</head>
        </egXML>
        </p>
      </div>
    </body>
  </text>
</TEI>
