<?xml version="1.0" encoding="UTF-8"?>
	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<xsl:output method="html" indent="yes"/>
		<xsl:template match="/">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<head>
					<title>Liste des questions</title>
				</head>
				<!-- On applique un style au BODY, avec affichage du nombre de questions -->
				<body style="background-color:#f4f4f4;">
					<h1 style="color:#eeab69" align="center">Liste des <xsl:value-of select="count(quiz/question)"/> questions</h1>
					<xsl:apply-templates select="quiz/question" />
				</body>
			</html>
		</xsl:template>
		<!-- On repère toutes les questions du fichier XML -->
		<xsl:template match="question">
			<!-- On filtre de sorte à n'avoir que les questions de type category dans la boucle -->
			<xsl:if test="@type='category'">
				<div style="background-color:#ffffff;width: 500px;margin: 0 auto 15px auto;border: 2px solid;">
					<!-- On affiche le texte qui est dans la question -->
					<b><h2 align="center"><xsl:apply-templates select="category/text"/></h2></b>
				</div>
			</xsl:if>
			<!-- On filtre de sorte à n'avoir que les questions de type numerical dans la boucle -->
			<xsl:if test="@type='numerical'">
				<div id="question">
					<fieldset style="background-color:#ffffff;width: 750px;margin: 0 auto 15px auto;padding: 10px;border: 2px solid #eeab69;"><legend style="color: #eeab69;">Question : <xsl:apply-templates select="@type" /></legend>
						<u><xsl:apply-templates select="name/text"/></u><br/>
						<!-- On affiche le texte qui est dans la question -->
						<i><xsl:apply-templates select="questiontext/text"/></i>
						<fieldset style="background-color:#f4f4f4;width: 750px;margin: 0 auto 15px auto;padding: 10px;border: 2px solid #eeab69;"><legend style="color: #eeab69;">Réponse</legend>
						<!-- On affiche le texte qui est dans la réponse à la question -->
							<b><xsl:apply-templates select="answer/text" /></b>
						</fieldset>
					</fieldset>
				</div>
			</xsl:if>	
			<!-- On filtre de sorte à n'avoir que les questions de type multichoice dans la boucle -->
			<xsl:if test="@type='multichoice'">
				<div id="question">
					<fieldset style="background-color:#ffffff;width: 750px;margin: 0 auto 15px auto;padding: 10px;border: 2px solid #eeab69;"><legend style="color: #eeab69;">Question : <xsl:apply-templates select="@type" /></legend>
						<u><xsl:apply-templates select="name/text"/></u><br/>
						<!-- On affiche le texte qui est dans la question -->
						<i><xsl:apply-templates select="questiontext/text"/></i>
						<fieldset style="background-color:#f4f4f4;width: 750px;margin: 0 auto 15px auto;padding: 10px;border: 2px solid #eeab69;"><legend style="color: #eeab69;">Réponse</legend>
							<xsl:for-each select="answer">
								<xsl:if test="@fraction &lt;= '0'">
								<!-- On affiche le texte qui est dans la réponse à la question -->
									<b style="color:red">☐ <xsl:value-of select="text"/></b><br/>
								</xsl:if>
								<xsl:if test="@fraction &gt; '0'">
								<!-- On affiche le texte qui est dans la réponse à la question -->
									<b style="color:green">☐ <xsl:value-of select="text"/></b><br/>
								</xsl:if>
							</xsl:for-each>
						</fieldset>
					</fieldset>
				</div>
			</xsl:if>
			<!-- On filtre de sorte à n'avoir que les questions de type shortanswer dans la boucle -->
			<xsl:if test="@type='shortanswer'">
				<div id="question">
					<fieldset style="background-color:#ffffff;width: 750px;margin: 0 auto 15px auto;padding: 10px;border: 2px solid #eeab69;"><legend style="color: #eeab69;">Question : <xsl:apply-templates select="@type" /></legend>
						<u><xsl:apply-templates select="name/text"/></u><br/>
						<!-- On affiche le texte qui est dans la question -->
						<i><xsl:apply-templates select="questiontext/text"/></i>
						<fieldset style="background-color:#f4f4f4;width: 750px;margin: 0 auto 15px auto;padding: 10px;border: 2px solid #eeab69;"><legend style="color: #eeab69;">Réponse</legend>
						<xsl:for-each select="answer">
							<!-- On affiche le texte qui est dans la réponse à la question -->
							<b><xsl:value-of select="text"/></b><br/>
						</xsl:for-each>
						</fieldset>
					</fieldset>
				</div>
			</xsl:if>		
			<!-- On filtre de sorte à n'avoir que les questions de type truefalse dans la boucle -->
			<xsl:if test="@type='truefalse'">
				<div id="question">
					<fieldset style="background-color:#ffffff;width: 750px;margin: 0 auto 15px auto;padding: 10px;border: 2px solid #eeab69;"><legend style="color: #eeab69;">Question : <xsl:apply-templates select="@type" /></legend>
						<u><xsl:apply-templates select="name/text"/></u><br/>
						<!-- On affiche le texte qui est dans la question -->
						<i><xsl:apply-templates select="questiontext/text"/></i>
						<fieldset style="background-color:#f4f4f4;width: 750px;margin: 0 auto 15px auto;padding: 10px;border: 2px solid #eeab69;"><legend style="color: #eeab69;">Réponse</legend>
							<!-- Pour chaque réponse (balise answer) -->
							<xsl:for-each select="answer">
								<!-- On affiche le texte qui est dans la réponse à la question, avec une image -->
								<xsl:if test="text='true'">
									<xsl:if test="@fraction='100'">
										<b style="color:green">☑ True</b><br/>
									</xsl:if>
									<xsl:if test="@fraction='0'">
										<b style="color:red">☑ True</b><br/>
									</xsl:if>
								</xsl:if>
								<xsl:if test="text='false'">
									<xsl:if test="@fraction='100'">
										<b style="color:green">☒ False</b>
									</xsl:if>
									<xsl:if test="@fraction='0'">
										<b style="color:red">☒ False</b><br/>
									</xsl:if>
								</xsl:if>
								<!-- On affiche le texte qui est dans la réponse à la question
								<b><xsl:value-of select="text"/> | </b>-->
							</xsl:for-each>
						</fieldset>
					</fieldset>
				</div>
			</xsl:if>
			<!-- On filtre de sorte à n'avoir que les questions de type cloze dans la boucle -->
			<xsl:if test="@type='cloze'">
				<div id="question">
					<fieldset style="background-color:#ffffff;width: 750px;margin: 0 auto 15px auto;padding: 10px;border: 2px solid #eeab69;"><legend style="color: #eeab69;">Question : <xsl:apply-templates select="@type" /></legend>
						<u><xsl:apply-templates select="name/text"/></u><br/>
						<!-- On affiche le texte qui est dans la question -->
						<i><xsl:apply-templates select="questiontext/text"/></i>
					</fieldset>
				</div>
			</xsl:if>
			<!-- On filtre de sorte à n'avoir que les questions de type matching dans la boucle -->
			<xsl:if test="@type='matching'">
				<div id="question">
					<fieldset style="background-color:#ffffff;width: 750px;margin: 0 auto 15px auto;padding: 10px;border: 2px solid #eeab69;"><legend style="color: #eeab69;">Question : <xsl:apply-templates select="@type" /></legend>
						<!-- On affiche le texte qui est dans la question -->
						<u><xsl:apply-templates select="name/text"/></u><br/>
						<!-- Pour chaque sous-question (balise subquestion) -->
						<xsl:for-each select="subquestion">
							<!-- On affiche le texte qui est dans la réponse à la question -->
							<xsl:if test="text!=''">
								<i><xsl:value-of select="text"/></i> <b style="color:#eeab69;"> | <xsl:value-of select="answer/text"/></b><br/>
							</xsl:if>
							<!-- On affiche le texte qui est dans la réponse à la question -->
							<xsl:if test="text=''"><b style="color:#eeab69;"> / <xsl:value-of select="answer/text"/></b></xsl:if>
						</xsl:for-each>
					</fieldset>
				</div>
			</xsl:if>
			<!-- On filtre de sorte à n'avoir que les questions de type description dans la boucle -->
			<xsl:if test="@type='description'">
				<div style="background-color:#ffffff;width: 750px;margin: 0 auto 15px auto;padding: 10px;border: 2px solid #eeab69;">
					<!-- On affiche le texte qui est dans la question -->
					<i><xsl:apply-templates select="name/text"/></i>
				</div>
			</xsl:if>		
		</xsl:template>
	</xsl:stylesheet>