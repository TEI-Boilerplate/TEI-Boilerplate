<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
	xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
	xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xsl ixsl tei xd #default">
	<xd:doc  scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Nov 17, 2011</xd:p>
			<xd:p><xd:b>Author:</xd:b> John A. Walsh</xd:p>
			<xd:p>TEI Boilerplate stylesheet: Copies TEI document, with a very few modifications
				into an html shell, which provides access to javascript and other features from the
				html/browser environment.</xd:p>
		</xd:desc>
	</xd:doc>

	<xsl:output encoding="UTF-8" method="xml" omit-xml-declaration="yes"/>

	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Match document root and create and html5 wrapper for the TEI document, which is
				copied, with some modification, into the HTML document.</xd:p>
		</xd:desc>
	</xd:doc>

	<xsl:key name="ids" match="//*" use="@xml:id"/>

	<xsl:template match="/">
		<html>
			<xsl:call-template name="htmlHead"/>
			<body>
				
				<div id="tei_wrapper">
					<xsl:call-template name="pbToggleBox"/>
					<xsl:apply-templates/>
				</div>
				<xsl:copy-of select="$htmlFooter"/>
			</body>
		</html>
	</xsl:template>

	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Basic copy template, copies all nodes from source XML tree to output
				document.</xd:p>
		</xd:desc>
	</xd:doc>
	
	<xsl:template match="@*">
		<!-- copy select elements -->
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Template for elements, which adds an @xml:id to every element. Existing @xml:id
				attributes are retained unchanged.</xd:p>
		</xd:desc>
	</xd:doc>

	<xsl:template match="*"> 
		<xsl:element name="{local-name()}">
			<xsl:if test="not(@xml:id)">
				<xsl:attribute name="id">
					<xsl:call-template name="generate-unique-id">
						<xsl:with-param name="root" select="generate-id()"/>
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:element>
	</xsl:template>

	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Template to omit processing instructions from output.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="processing-instruction()" priority="10"/>

	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Template moves value of @rend into an html @style attribute. Stylesheet assumes
				CSS is used in @rend to describe renditions, i.e., styles.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="@rend">
		<xsl:attribute name="style">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>

	<xsl:template match="@xml:id">
		<xsl:attribute name="xml:id">
			<xsl:value-of select="."/>
		</xsl:attribute>
		<xsl:attribute name="id">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>

	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Transforms TEI ref element to html a (link) element.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="tei:ref[@target]" priority="99">
		<a href="{@target}">
			<xsl:apply-templates/>
		</a>
	</xsl:template>

	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Transforms TEI ptr element to html a (link) element.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="tei:ptr[@target]" priority="99">
		<a href="{@target}">
			<xsl:value-of select="normalize-space(@target)"/>
		</a>
	</xsl:template>


	<!-- need something else for images with captions -->
	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Transforms TEI figure element to html img element.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="tei:figure[tei:graphic[@url]]" priority="99">
		<xsl:variable name="figDesc" select="normalize-space(tei:figDesc)"/>
		<img alt="{$figDesc}" src="{tei:graphic/@url}"/>
	</xsl:template>

	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Adds some javascript just before end of root tei element. Javascript sets the
				/html/head/title element to an appropriate title selected from the TEI document.
				This could also be achieved through XSLT but is here to demonstrate some simple
				javascript, using JQuery, to manipulate the DOM containing both html and TEI.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="tei:TEI" priority="99">
		<xsl:element name="{local-name()}">
			<xsl:if test="not(@xml:id)">
				<xsl:attribute name="xml:id">
					<xsl:call-template name="generate-unique-id">
						<xsl:with-param name="root" select="generate-id()"/>
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:element>
	</xsl:template>

	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>The generate-id() function does not guarantee the generated id will not conflict
				with existing ids in the document. This template checks for conflicts and appends a
				number (hexedecimal 'f') to the id. The template is recursive and continues until no
				conflict is found</xd:p>
		</xd:desc>
		<xd:param name="root">The root, or base, id used to check for conflicts</xd:param>
		<xd:param name="suffix">The suffix added to the root id if a conflict is
			detected.</xd:param>
	</xd:doc>
	<xsl:template name="generate-unique-id">
		<xsl:param name="root"/>
		<xsl:param name="suffix"/>
		<xsl:variable name="id" select="concat($root,$suffix)"/>
		<xsl:choose>
			<xsl:when test="key('ids',$id)">
				<!--
				<xsl:message>
					<xsl:value-of select="concat('Found duplicate id: ',$id)"/>
				</xsl:message>
				-->
				<xsl:call-template name="generate-unique-id">
					<xsl:with-param name="root" select="$root"/>
					<xsl:with-param name="suffix" select="concat($suffix,'f')"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$id"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Template for adding /html/head content.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template name="htmlHead">
		<head>
			<meta charset="UTF-8"/>

			<link id="maincss" rel="stylesheet" type="text/css" href="../css/style.css"/>
			<link rel="stylesheet" type="text/css" href="../css/custom.css"/>
			<script type="text/javascript" src="../js/jquery/jquery.min.js"/>
			<script type="text/javascript" src="../js/jquery/plugins/jquery.blockUI.js"/>
			<script type="text/javascript" src="../js/tei_boilerplate.js"/>
			
			<script type="text/javascript">
				$(document).ready(function() {
					$("html > head > title").text($("TEI > teiHeader > fileDesc > titleStmt > title:first").text());
					$.unblockUI();				
				});
			</script>
			<xsl:call-template name="rendition2style"/>
			<title/>
		</head>
	</xsl:template>

	<xsl:template name="rendition2style">
		<style>
            <xsl:apply-templates select="//tei:rendition"/>
        </style>
	</xsl:template>
	
	<xsl:template match="tei:rendition[@xml:id and @scheme = 'css']">
		<xsl:value-of select="concat('[rendition~=&quot;#',@xml:id,'&quot;]')"/>
		<xsl:if test="@scope">
			<xsl:value-of select="concat(':',@scope)"/>
		</xsl:if>
		<xsl:value-of select="concat('{ ',normalize-space(.),'}&#x000A;')"/>
	</xsl:template>
	
	<xsl:template match="tei:rendition[not(@xml:id) and @scheme = 'css' and @corresp]">
		<xsl:value-of select="concat('[rendition~=&quot;#',substring-after(@corresp,'#'),'&quot;]')"/>
		<xsl:if test="@scope">
			<xsl:value-of select="concat(':',@scope)"/>
		</xsl:if>
		<xsl:value-of select="concat('{ ',normalize-space(.),'}&#x000A;')"/>
	</xsl:template>
	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Template for adding footer to html document.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:variable name="htmlFooter">
		<div id="footer"> Powered by TEI Boilerplate. TEI Boilerplate is licensed under a <a
				href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0
				Unported License</a>. <a href="http://creativecommons.org/licenses/by/3.0/"><img
					alt="Creative Commons License" style="border-width:0;"
					src="http://i.creativecommons.org/l/by/3.0/80x15.png"/></a>
		</div>
	</xsl:variable>

	<xsl:template name="pbToggleBox">
		<div id="pbToggler" style="left: 25px; top: 25px; position: fixed; font-size: small">
			<label for="pbToggle">Hide page breaks</label>
			<input type="checkbox" id="pbToggle" /> 
			<div>
				<h3>Themes:</h3>
				<ul>
					<li><a href="#default-theme" onclick="switchThemes('../css/style.css');">Default</a></li>
					<li><a href="#sleepy-theme" onclick="switchThemes('../css/sleepy.css');">Sleepy Time</a></li>
					<li><a href="#terminal_theme" onclick="switchThemes('../css/terminal.css');">Terminal</a></li>
				</ul>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
