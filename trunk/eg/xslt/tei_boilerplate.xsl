<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="html">
	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Nov 17, 2011</xd:p>
			<xd:p><xd:b>Author:</xd:b> John A. Walsh</xd:p>
			<xd:p>TEI Boilerplate stylesheet: Copies TEI document, with a very few modificaations
			into an html shell, which provides access to javascript and other features from the
			html/browser environment.</xd:p>
		</xd:desc>
	</xd:doc>

	<xsl:output encoding="UTF-8" method="xml" doctype-system="about:legacy-compat"/>
	
	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Match document root and create and html5 wrapper for the TEI document, 
			which is copied, with some modification, into the HTML document.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="/">
		<html>
			<xsl:call-template name="htmlHead"/>
			<body>
				<div id="tei_wrapper">
						<xsl:apply-templates/>
				</div>
				<xsl:copy-of select="$htmlFooter"/>
			</body>
		</html>
	</xsl:template>
	
	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Basic copy template, copies all nodes from source XML tree to output document.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="@*|node()">
		<!-- copy select elements -->
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Template for elements, which adds an @xml:id to every element. 
			Existing @xml:id attributes are retained unchanged.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="*"> 
		<xsl:copy>
			<xsl:if test="not(@xml:id)">
				<xsl:attribute name="xml:id">
					<xsl:call-template name="generate-unique-id">
						<xsl:with-param name="root" select="generate-id()"/>
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
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
		<xsl:attribute name="style" namespace="http://www.w3.org/1999/xhtml">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Transforms TEI ref element to html a (link) element.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="tei:ref[@target]">
		<a href="{@target}"><xsl:apply-templates/></a>
	</xsl:template>
	
	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Transforms TEI ref element to html a (link) element.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="tei:prt[@target]">
		<a href="{@target}"><xsl:value-of select="normalize-space(@target)"/></a>
	</xsl:template>
	
	<!-- need something else for images with captions -->
	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Transforms TEI figure element to html img element.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="tei:figure[graphic[@url]]">
		<xsl:variable name="figDesc" select="normalize-space(tei:figDesc)"/>
		<img alt="{$figDesc}" src="{tei:graphic/@url}"/>
	</xsl:template>
	
	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Adds some javascript just before end of root tei element. Javascript sets the /html/head/title element to an appropriate title selected from the TEI document. This could also be achieved through XSLT but is here to demonstrate some simple javascript, using JQuery, to manipulate the DOM containing both html and TEI.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template match="tei:TEI">
		<xsl:copy>
			<xsl:if test="not(@xml:id)">
				<xsl:attribute name="xml:id">
					<xsl:call-template name="generate-unique-id">
						<xsl:with-param name="root" select="generate-id()"/>
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="@*|node()"/>
			<script type="text/javascript">
				$(document).ready(function() {
					$("html > head > title").text($("TEI > teiHeader > fileDesc > titleStmt > title:first").text());
					$.unblockUI();				
				});
			</script>
		</xsl:copy>
	</xsl:template>

	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>The generate-id() function does not guarantee the generated id will not conflict 
			with existing ids in the document. This template checks for conflicts and appends a 
			number (hexedecimal 'f') to the id. The template is recursive and continues until no 
			conflict is found</xd:p>
		</xd:desc>
		<xd:param name="root">The root, or base, id used to check for conflicts</xd:param>
		<xd:param name="suffix">The suffix added to the root id if a conflict is detected.</xd:param>
	</xd:doc>
	<xsl:template name="generate-unique-id">
		<xsl:param name="root"/>
		<xsl:param name="suffix"></xsl:param>
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
			<meta charset="UTF-8" />

			<link  rel="stylesheet" type="text/css" href="css/style.css" />

			<script type="text/javascript" src="js/jquery/jquery-1.7.min.js"></script>
			<script type="text/javascript" src="js/tei_boilerplate.js"></script>
			<xsl:call-template name="rendition2style"/>
			<title></title>
		</head>
	</xsl:template>
	
	<xsl:template name="rendition2style">
		<style>
            <xsl:for-each select="//tei:rendition[@scheme = 'css']">
                <xsl:value-of select="concat('.',@xml:id,' { ',normalize-space(.),'}&#x000A;')"/>
            </xsl:for-each>
        </style>
	</xsl:template>

	<xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
		<xd:desc>
			<xd:p>Template for adding footer to html document.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:variable name="htmlFooter">
		<div id="footer">
			© 2011 John A. Walsh<br /><span>TEI Boilerplate</span> by <a href="teiboilerplate.slis.indiana.edu">John A. Walsh</a> is licensed under a <a href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0 Unported License</a>. <a href="http://creativecommons.org/licenses/by/3.0/"><img alt="Creative Commons License" style="border-width:0;" src="http://i.creativecommons.org/l/by/3.0/80x15.png" /></a>
		</div>	
	</xsl:variable>
	
</xsl:stylesheet>