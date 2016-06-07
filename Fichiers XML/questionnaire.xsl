<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				
				<title>Liste des questions</title>
			</head>
			<body style="background-color:silver">
				<h1>Liste des questions</h1>
				<h2><xsl:value-of select="count(quiz/question)"/> questions</h2>
				<xsl:apply-templates select="quiz/question" />
			</body>
		</html>
	</xsl:template>
	<xsl:template match="question">
		<div style="width:450px; padding:5px; margin-bottom:10px;
          border:5px double black; color:black; background-color:white;
          text-align:left" id="question">
				<b><xsl:apply-templates select="questiontext/text"/></b>
			<hr />
			<xsl:if test="SITES_COMPOSANTES!='null'">
				<xsl:apply-templates select="SITES_COMPOSANTES"/>
				<hr />
			</xsl:if>			
			<xsl:apply-templates select="ADRESSE"/>
			<br />
			<xsl:if test="BP!='null'">
				<xsl:apply-templates select="BP"/><xsl:text> - </xsl:text>
			</xsl:if>			
			<xsl:apply-templates select="CP_VILLE"/>
		</div>
	</xsl:template>
</xsl:stylesheet>