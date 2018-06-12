<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:UML="http://www.eclipse.org/uml2/4.0.0/UML"
    xmlns:func="http://exslt.org/functions"
    exclude-result-prefixes="xs UML func"
    version="2.0">
    <xsl:import href="variables.xsl"/>
    <xsl:output method="html" />
    
<!--    <xsl:variable name="root" select="UML:Model"/>-->
    
    <xsl:template name="simpleComponent" match="/">
        
        
        <html>
            <head>
                <title>UI example component test</title>
                <link rel="stylesheet" href="style.css" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
            </head>
            <body>
                <xsl:variable name="full-textMedewerkerVoornaam">Dit is <xsl:value-of select="$medewerkerVoornaam"/>, en dit zijn zijn gegevens:</xsl:variable>
                <xsl:variable name="full-textGeboortedatum">Geboren op <xsl:value-of select="$medewerkerGeboortedatum"/></xsl:variable>
                <xsl:variable name="full-textTeamNaam">Onderdeel van het team "<xsl:value-of select="$teamNaam"/>"</xsl:variable>
                <xsl:variable name="full-textTotaalAantal">Dit jaar recht op <xsl:value-of select="$verlofTotaalAantal"/> verlofdagen</xsl:variable>
                <xsl:variable name="full-textBeschikbaarAantal">Waarvan er nog <xsl:value-of select="$verlofBeschikbaarAantal"/> verlofdagen over zijn</xsl:variable>
                
                <xsl:call-template name="fullOrShortText">
                    <xsl:with-param name="fullText">
                        <xsl:value-of select="$full-textMedewerkerVoornaam"/>;<xsl:value-of select="$full-textGeboortedatum"/>;<xsl:value-of select="$full-textTeamNaam"/>;<xsl:value-of select="$full-textTotaalAantal"/>;<xsl:value-of select="$full-textBeschikbaarAantal"/>
                    </xsl:with-param>
                    <xsl:with-param name="shortText">
                        <xsl:value-of select="$medewerkerVoornaam"/>;<xsl:value-of select="$medewerkerGeboortedatum"/>;<xsl:value-of select="$teamNaam"/>;<xsl:value-of select="$verlofTotaalAantal"/>;<xsl:value-of select="$verlofBeschikbaarAantal"/>
                    </xsl:with-param>
                    <xsl:with-param name="label">Voornaam;Geboortedatum;Teamnaam; Totaal aantal verlofdagen; Beschikbaar aantal verlofdagen</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="multipleOptions">
                    <xsl:with-param name="labels">vakantie;kind;langdurig;bijzonder</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="image">
                    <xsl:with-param name="source" select="$medewerkerFoto"/>
                    <xsl:with-param name="name"><xsl:value-of select="concat(concat($medewerkerVoornaam, ' '), $medewerkerAchternaam)"/></xsl:with-param>
                    <xsl:with-param name="importance">1</xsl:with-param>
                    <xsl:with-param name="style">rounded</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="text">
                    <xsl:with-param name="content"><xsl:value-of select="concat(concat($medewerkerVoornaam, ' '), $medewerkerAchternaam)"/></xsl:with-param>
                    <xsl:with-param name="importance">1</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="text">
                    <xsl:with-param name="content" select="concat($medewerkerContactUren, ' uur')"/>
                    <xsl:with-param name="importance">2</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="text">
                    <xsl:with-param name="content" select="concat(concat($functieNiveau, ' '), $functieNaam)"/>
                    <xsl:with-param name="importance">3</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="text">
                    <xsl:with-param name="content" select="$rolNaam"/>
                    <xsl:with-param name="importance">3</xsl:with-param>
                </xsl:call-template>
               
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>