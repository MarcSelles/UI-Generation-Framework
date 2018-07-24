<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:UML="http://www.eclipse.org/uml2/4.0.0/UML"
    xmlns:func="http://exslt.org/functions"
    exclude-result-prefixes="xs UML func"
    version="2.0">
    <xsl:import href="../genericHTML.xsl"/>
    
    <xsl:output method="html" />
    
    <xsl:variable name="titleTeambezetting">
        <xsl:call-template name="title">
            <xsl:with-param name="content">Teambezetting</xsl:with-param>
        </xsl:call-template>
    </xsl:variable>
    
    <xsl:variable name="textTeamName">
        <xsl:call-template name="text">
            <xsl:with-param name="content"><xsl:value-of select="$teamNaam"/></xsl:with-param>
            <xsl:with-param name="style">center teamnaam</xsl:with-param>
        </xsl:call-template>
    </xsl:variable>
    
    <xsl:variable name="periodTeambezettingPeriod">
        <xsl:call-template name="item">
            <xsl:with-param name="style">period</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="text">
                    <xsl:with-param name="content"><xsl:value-of select="concat(concat(func:formatDate($teamBezettingBeginDatum), ' - '), func:formatDate($teamBezettingEindDatum))"/></xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:variable>
    
    <xsl:variable name="labelValueUnitInlineMinBezetting">
        <xsl:call-template name="labelValueUnitInline">
            <xsl:with-param name="label">Minimale bezetting</xsl:with-param>
            <xsl:with-param name="value" select="$teamBezettingMin"/>
            <xsl:with-param name="unit">uur</xsl:with-param>
        </xsl:call-template>
    </xsl:variable>
    
    <xsl:variable name="labelValueUnitTwoLinesMinBezetting">
        <xsl:call-template name="labelValueUnitTwoLines">
            <xsl:with-param name="label">Minimale bezetting</xsl:with-param>
            <xsl:with-param name="value" select="$teamBezettingMin"/>
            <xsl:with-param name="unit">uur</xsl:with-param>
        </xsl:call-template>
    </xsl:variable>
    
    <xsl:variable name="originalCustomMinBezetting">
        <xsl:call-template name="item">
            <xsl:with-param name="style">requirements minbez</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:copy-of select="$labelValueUnitInlineMinBezetting"/>
                <xsl:copy-of select="$labelValueUnitTwoLinesMinBezetting"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:variable>
    
    <xsl:variable name="labelValueUnitInlineBuffer">
        <xsl:call-template name="item">
            <xsl:with-param name="style">requirements minbez</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="labelValueUnitInline">
                    <xsl:with-param name="label">Buffer</xsl:with-param>
                    <xsl:with-param name="value" select="$teamBezettingBuffer"/>
                    <xsl:with-param name="unit">uur</xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
        
    </xsl:variable>
    
    <xsl:variable name="labelValueUnitTwoLinesBuffer">
        <xsl:call-template name="item">
            <xsl:with-param name="style">requirements minbez</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="labelValueUnitTwoLines">
                    <xsl:with-param name="label">Minimale bezetting</xsl:with-param>
                    <xsl:with-param name="value" select="$teamBezettingBuffer"/>
                    <xsl:with-param name="unit">uur</xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:variable>
    
    <xsl:variable name="originalCustomBuffer">
        <xsl:call-template name="item">
            <xsl:with-param name="style">requirements buffer</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:copy-of select="$labelValueUnitInlineBuffer"/>
                <xsl:copy-of select="$labelValueUnitTwoLinesBuffer"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:variable>
    
    <xsl:function name="func:imageMedewerker">
        <xsl:param name="position"/>
        
        <xsl:call-template name="image">
            <xsl:with-param name="source" select="func:getValue($MEDEWERKER, $FOTO,$position)"/>
            <xsl:with-param name="name"><xsl:value-of select="concat(concat(func:getValue($MEDEWERKER, $VOORNAAM,$position), ' '), func:getValue($MEDEWERKER, $ACHTERNAAM,$position))"/></xsl:with-param>
            <xsl:with-param name="importance">position()</xsl:with-param>
            <xsl:with-param name="style">rounded</xsl:with-param>
        </xsl:call-template>
    </xsl:function>
    
    <xsl:function name="func:textVoornaamAchternaam">
        <xsl:param name="position"/>
        
        <xsl:call-template name="text">
            <xsl:with-param name="content"><xsl:value-of select="concat(concat(func:getValue($MEDEWERKER, $VOORNAAM,$position), ' '), func:getValue($MEDEWERKER, $ACHTERNAAM,$position))"/></xsl:with-param>
            <xsl:with-param name="importance">position()</xsl:with-param>
        </xsl:call-template>
    </xsl:function>
    
    <xsl:function name="func:textUren">
        <xsl:param name="position"/>
        
        <xsl:call-template name="text">
            <xsl:with-param name="content" select="concat(func:getValue($MEDEWERKER, $AANTALCONTACTUREN,$position), ' uur')"/>
            <xsl:with-param name="importance">2</xsl:with-param>
        </xsl:call-template>
    </xsl:function>
    
    <xsl:function name="func:textFunctie">
        <xsl:param name="position"/>
        
        <xsl:call-template name="text">
            <xsl:with-param name="content" select="concat(concat(func:getValue($FUNCTIE, $NIVEAU,$position), ' '), func:getValue($FUNCTIE, $NAAM,$position))"/>
            <xsl:with-param name="importance">3</xsl:with-param>
        </xsl:call-template>
    </xsl:function>
   
    <xsl:function name="func:textRol">
        <xsl:param name="position"/>
        
       <xsl:call-template name="text">
           <xsl:with-param name="content" select="func:getValue($ROL, $NAAM,$position)"/>
           <xsl:with-param name="importance">3</xsl:with-param>
       </xsl:call-template>
   </xsl:function>
  
    <xsl:template name="spanBezetting">
        <xsl:param name="content"/>
        
        <xsl:call-template name="genericStructure">
            <xsl:with-param name="title">Bezetting</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:copy-of select="$content"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="spanContent">
        <xsl:param name="content"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">teambezetting</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:copy-of select="$content"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="spanTeam">
        <xsl:param name="content"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">teambox</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="item">
                    <xsl:with-param name="style">team</xsl:with-param>
                    <xsl:with-param name="content">
                        <xsl:copy-of select="$content"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="spanMedewerker">
        <xsl:param name="content"/>
        <xsl:param name="position"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">columns</xsl:with-param>
            <xsl:with-param name="id"><xsl:if test="$position = 1">firstParent</xsl:if></xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="item">
                    <xsl:with-param name="style">member center</xsl:with-param>
                    <xsl:with-param name="id"><xsl:if test="$position = 1">firstChild</xsl:if></xsl:with-param>
                    <xsl:with-param name="content">
                        <xsl:copy-of select="$content"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
        
    </xsl:template>
    
    <xsl:template name="emptySpan">
        <xsl:param name="content"/>
        <xsl:copy-of select="$content"/>
    </xsl:template>
    
    <xsl:template name="rstTemplate">
        <xsl:param name="contents"/>
        <xsl:param name="id"/>
        <xsl:param name="multiplicityId"/>
        <xsl:param name="position"/>
        
        <xsl:choose>
            <xsl:when test="$id = '1'">
                <xsl:copy-of select="$titleTeambezetting"/>
            </xsl:when>
            <xsl:when test="$id = '2'">
                <xsl:copy-of select="$textTeamName"/>
            </xsl:when>
            <xsl:when test="$id = '3'">
                <xsl:copy-of select="$periodTeambezettingPeriod"/>
            </xsl:when>
            <xsl:when test="$id = '4'">
                <xsl:copy-of select="$originalCustomMinBezetting"/>
            </xsl:when>
            <xsl:when test="$id = '5'">
                <xsl:copy-of select="$originalCustomBuffer"/>
            </xsl:when>
            <xsl:when test="$id = '6'">
                <xsl:copy-of select="func:imageMedewerker($position)"/>
            </xsl:when>
            <xsl:when test="$id = '7'">
                <xsl:copy-of select="func:textVoornaamAchternaam($position)"/>
            </xsl:when>
            <xsl:when test="$id = '8'">
                <xsl:copy-of select="func:textUren($position)"/>
            </xsl:when>
            <xsl:when test="$id = '9'">
                <xsl:copy-of select="func:textFunctie($position)"/>
            </xsl:when>
            <xsl:when test="$id = '10'">
                <xsl:copy-of select="func:textRol($position)"/>
            </xsl:when>
            <xsl:when test="$id = '11'">
                <xsl:call-template name="emptySpan">
                    <xsl:with-param name="content" select="$contents"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '12'">
                <xsl:call-template name="emptySpan">
                    <xsl:with-param name="content" select="$contents"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '13'">
                <xsl:call-template name="spanTeam">
                    <xsl:with-param name="content" select="$contents"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '14'">
                <xsl:call-template name="spanContent">
                    <xsl:with-param name="content" select="$contents"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$multiplicityId = '1'">
                <xsl:call-template name="spanMedewerker">
                    <xsl:with-param name="content" select="$contents"/>
                    <xsl:with-param name="position" select="$position"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>