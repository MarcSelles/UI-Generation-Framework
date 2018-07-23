<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:func="http://exslt.org/functions"
    exclude-result-prefixes="xs func"
    version="2.0">
    <xsl:import href="Bezetting/bezettingUIComponents.xsl"/>
    
    <xsl:template name="bezetting" match="/">
        <xsl:call-template name="spanBezetting">
            <xsl:with-param name="content">
                <xsl:copy-of select="$titleTeambezetting"/>
                <xsl:copy-of select="$textTeamName"/>
                
                <xsl:call-template name="spanContent">
                    <xsl:with-param name="content">
                        <xsl:copy-of select="$periodTeambezettingPeriod"/>
                        <xsl:copy-of select="$originalCustomMinBezetting"/>
                        <xsl:copy-of select="$originalCustomBuffer"/>
                        
                        <xsl:call-template name="spanTeam">
                            <xsl:with-param name="content">
                                <xsl:for-each select="$elementRoot[@name=$MEDEWERKER]/ownedAttribute[@name = $VOORNAAM]/value">
                                    <xsl:call-template name="spanMedewerker">
                                        <xsl:with-param name="content">
                                            <xsl:copy-of select="func:imageMedewerker(position())"/>
                                            <xsl:copy-of select="func:textVoornaamAchternaam(position())"/>
                                            <xsl:copy-of select="func:textUren(position())"/>
                                            <xsl:copy-of select="func:textFunctie(position())"/>
                                            <xsl:copy-of select="func:textRol(position())"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:with-param>
                </xsl:call-template>
                        
                        
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
                
</xsl:stylesheet>