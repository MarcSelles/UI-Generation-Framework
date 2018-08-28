<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:UML="http://www.eclipse.org/uml2/4.0.0/UML"
    xmlns:func="http://exslt.org/functions"
    exclude-result-prefixes="xs UML func"
    version="2.0">
    <xsl:import href="genericHTML.xsl"/>
    
    <xsl:output method="html" />
    
    <!--    <xsl:variable name="root" select="UML:Model"/>-->
    
    <xsl:template name="bezetting" match="/">
        <xsl:call-template name="genericStructure">
            <xsl:with-param name="title">Bezetting</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="title">
                    <xsl:with-param name="content">Teambezetting</xsl:with-param>
                </xsl:call-template>
                
                <xsl:call-template name="text">
                    <xsl:with-param name="content"><xsl:value-of select="$teamNaam"/></xsl:with-param>
                    <xsl:with-param name="style">center teamnaam</xsl:with-param>
                </xsl:call-template>
                
                <xsl:call-template name="item">
                    <xsl:with-param name="style">teambezetting</xsl:with-param>
                    <xsl:with-param name="content">
                        <xsl:call-template name="item">
                            <xsl:with-param name="style">period</xsl:with-param>
                            <xsl:with-param name="content">
                                <xsl:call-template name="text">
                                    <xsl:with-param name="content"><xsl:value-of select="concat(concat(func:formatDate($teamBezettingBeginDatum), ' - '), func:formatDate($teamBezettingEindDatum))"/></xsl:with-param>
                                </xsl:call-template>
                            </xsl:with-param>
                        </xsl:call-template>
                        
                        <xsl:call-template name="item">
                            <xsl:with-param name="style">requirements minbez</xsl:with-param>
                            <xsl:with-param name="content">
                                <xsl:call-template name="fullOrShortText">
                                    <xsl:with-param name="fullText">
                                        <xsl:call-template name="labelValue">
                                            <xsl:with-param name="importance">1</xsl:with-param>
                                            <xsl:with-param name="labels">Minimale bezetting</xsl:with-param>
                                            <xsl:with-param name="values" select="concat($teamBezettingMin, ' uur')"/>
                                        </xsl:call-template>
                                    </xsl:with-param>
                                    <xsl:with-param name="label">Minimale bezetting</xsl:with-param>
                                    <xsl:with-param name="shortText" select="concat($teamBezettingMin, ' uur')"/>
                                </xsl:call-template>
                            </xsl:with-param>
                        </xsl:call-template>
                        
                        <xsl:call-template name="item">
                            <xsl:with-param name="style">requirements buffer</xsl:with-param>
                            <xsl:with-param name="content">
                                <xsl:call-template name="fullOrShortText">
                                    <xsl:with-param name="fullText">
                                        <xsl:call-template name="labelValue">
                                            <xsl:with-param name="importance">1</xsl:with-param>
                                            <xsl:with-param name="labels">Buffer</xsl:with-param>
                                            <xsl:with-param name="values" select="concat($teamBezettingBuffer, ' uur')"/>
                                        </xsl:call-template>
                                    </xsl:with-param>
                                    <xsl:with-param name="label">Buffer</xsl:with-param>
                                    <xsl:with-param name="shortText" select="concat($teamBezettingBuffer, ' uur')"/>
                                </xsl:call-template>
                            </xsl:with-param>
                        </xsl:call-template>
                        
                        <xsl:call-template name="item">
                            <xsl:with-param name="style">teambox</xsl:with-param>
                            <xsl:with-param name="content">
                                <xsl:call-template name="item">
                                    <xsl:with-param name="style">team</xsl:with-param>
                                    <xsl:with-param name="content">
                                        <xsl:call-template name="item">
                                            <xsl:with-param name="style">columns</xsl:with-param>
                                            <xsl:with-param name="id">firstParent</xsl:with-param>
                                            <xsl:with-param name="content">
                                                <xsl:call-template name="item">
                                                    <xsl:with-param name="style">member center</xsl:with-param>
                                                    <xsl:with-param name="id">firstChild</xsl:with-param>
                                                    <xsl:with-param name="content">
                                                        <xsl:call-template name="image">
                                                            <xsl:with-param name="source" select="func:getValue($MEDEWERKER, $FOTO,1)"/>
                                                            <xsl:with-param name="name"><xsl:value-of select="concat(concat(func:getValue($MEDEWERKER, $VOORNAAM,1), ' '), func:getValue($MEDEWERKER, $ACHTERNAAM,1))"/></xsl:with-param>
                                                            <xsl:with-param name="importance">1</xsl:with-param>
                                                            <xsl:with-param name="style">rounded</xsl:with-param>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="text">
                                                            <xsl:with-param name="content"><xsl:value-of select="concat(concat(func:getValue($MEDEWERKER, $VOORNAAM,1), ' '), func:getValue($MEDEWERKER, $ACHTERNAAM,1))"/></xsl:with-param>
                                                            <xsl:with-param name="importance">1</xsl:with-param>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="text">
                                                            <xsl:with-param name="content" select="concat(func:getValue($MEDEWERKER, $AANTALCONTACTUREN,1), ' uur')"/>
                                                            <xsl:with-param name="importance">2</xsl:with-param>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="text">
                                                            <xsl:with-param name="content" select="concat(concat(func:getValue($FUNCTIE, $NIVEAU,1), ' '), func:getValue($FUNCTIE, $NAAM,1))"/>
                                                            <xsl:with-param name="importance">3</xsl:with-param>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="text">
                                                            <xsl:with-param name="content" select="func:getValue($ROL, $NAAM,1)"/>
                                                            <xsl:with-param name="importance">3</xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                        <xsl:variable name="test" select="$elementRoot[@name=$MEDEWERKER]/ownedAttribute[@name = $VOORNAAM]/value"/>
                                        <xsl:for-each select="$test">
                                            <xsl:if test="position() != 1">
                                                <xsl:call-template name="item">
                                                    <xsl:with-param name="style">columns</xsl:with-param>
                                                    <xsl:with-param name="content">
                                                        <xsl:call-template name="item">
                                                            <xsl:with-param name="style">member center</xsl:with-param>
                                                            <xsl:with-param name="content">
                                                                <xsl:call-template name="image">
                                                                    <xsl:with-param name="source" select="func:getValue($MEDEWERKER, $FOTO,position())"/>
                                                                    <xsl:with-param name="name"><xsl:value-of select="concat(concat(func:getValue($MEDEWERKER, $VOORNAAM,position()), ' '), func:getValue($MEDEWERKER, $ACHTERNAAM,position()))"/></xsl:with-param>
                                                                    <xsl:with-param name="importance">position()</xsl:with-param>
                                                                    <xsl:with-param name="style">rounded</xsl:with-param>
                                                                </xsl:call-template>
                                                                <xsl:call-template name="text">
                                                                    <xsl:with-param name="content"><xsl:value-of select="concat(concat(func:getValue($MEDEWERKER, $VOORNAAM,position()), ' '), func:getValue($MEDEWERKER, $ACHTERNAAM,position()))"/></xsl:with-param>
                                                                    <xsl:with-param name="importance">position()</xsl:with-param>
                                                                </xsl:call-template>
                                                                <xsl:call-template name="text">
                                                                    <xsl:with-param name="content" select="concat(func:getValue($MEDEWERKER, $AANTALCONTACTUREN,position()), ' uur')"/>
                                                                    <xsl:with-param name="importance">2</xsl:with-param>
                                                                </xsl:call-template>
                                                                <xsl:call-template name="text">
                                                                    <xsl:with-param name="content" select="concat(concat(func:getValue($FUNCTIE, $NIVEAU,position()), ' '), func:getValue($FUNCTIE, $NAAM,position()))"/>
                                                                    <xsl:with-param name="importance">3</xsl:with-param>
                                                                </xsl:call-template>
                                                                <xsl:call-template name="text">
                                                                    <xsl:with-param name="content" select="func:getValue($ROL, $NAAM,position())"/>
                                                                    <xsl:with-param name="importance">3</xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>