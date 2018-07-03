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
                <title>Verlof</title>
                <link rel="stylesheet" href="style.css" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
            </head>
            <body>
                <xsl:call-template name="multipleOptions">
                    <xsl:with-param name="labels">vakantie;kind;langdurig;bijzonder</xsl:with-param>
                </xsl:call-template>
                
                <xsl:call-template name="text">
                    <xsl:with-param name="content">
                        <xsl:call-template name="fullOrShortText">
                            <xsl:with-param name="fullText">
                                Hoi <xsl:value-of select="concat(concat($medewerkerVoornaam,' '), $medewerkerAchternaam)"/>, <br/>Dit jaar heb je recht op <b> <xsl:value-of select="$verlofTotaalAantal"/> vakantiedagen / <xsl:value-of select="$verlofTotaalAantal * 8"/> vakantieuren.</b>
                            </xsl:with-param>
                            <xsl:with-param name="shortText">
                                <xsl:value-of select="$verlofTotaalAantal"/> dagen / <xsl:value-of select="$verlofTotaalAantal * 8"/> uren
                            </xsl:with-param>
                            <xsl:with-param name="label">Totaal aantal vakantiedagen/-uren</xsl:with-param>
                        </xsl:call-template>
                        
                        <xsl:call-template name="fullOrShortText">
                            <xsl:with-param name="fullText">
                                Tot nu toe heb je <b> <xsl:value-of select="$verlofTotaalAantal - $verlofBeschikbaarAantal"/> vakantiedagen / 
                                    <xsl:value-of select="($verlofTotaalAantal - $verlofBeschikbaarAantal) * 8"/> vakantieuren</b> opgenomen.
                            </xsl:with-param>
                            <xsl:with-param name="label">Verbruikt aantal vakantiedagen/-uren: </xsl:with-param>
                            <xsl:with-param name="shortText">
                                <xsl:value-of select="$verlofTotaalAantal - $verlofBeschikbaarAantal"/> dagen / 
                                <xsl:value-of select="($verlofTotaalAantal - $verlofBeschikbaarAantal) * 8"/> uren
                            </xsl:with-param>
                        </xsl:call-template>
                        
                        <xsl:call-template name="fullOrShortText">
                            <xsl:with-param name="fullText">
                                Dit betekent dat je nog <b> <xsl:value-of select="$verlofBeschikbaarAantal"/> vakantiedagen / 
                                    <xsl:value-of select="$verlofBeschikbaarAantal * 8"/> vakantieuren</b> over hebt.
                            </xsl:with-param>
                            <xsl:with-param name="label">Beschikbaar aantal vakantiedagen/-uren: </xsl:with-param>
                            <xsl:with-param name="shortText">
                                <xsl:value-of select="$verlofBeschikbaarAantal"/> dagen / 
                                <xsl:value-of select="$verlofBeschikbaarAantal * 8"/> uren
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="button">
                    <xsl:with-param name="text">Aanvragen</xsl:with-param>
                </xsl:call-template>
                
                
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>