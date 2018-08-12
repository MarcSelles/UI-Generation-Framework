<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:UML="http://www.eclipse.org/uml2/4.0.0/UML"
    xmlns:func="http://exslt.org/functions"
    exclude-result-prefixes="xs UML func"
    version="2.0">
    <xsl:import href="../genericHTML.xsl"/>
    
    <xsl:output method="html" />
    
    <xsl:template name="titleTeambezetting">
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">center</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="title">
                    <xsl:with-param name="style">inline <xsl:value-of select="$style"/></xsl:with-param>
                    <xsl:with-param name="content">Teambezetting</xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="textTeamName">
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">center</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="text">
                    <xsl:with-param name="content"><xsl:value-of select="$teamNaam"/></xsl:with-param>
                    <xsl:with-param name="style">teamnaam inline <xsl:value-of select="$style"/></xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="periodTeambezettingPeriod">
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">center period</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="text">
                    <xsl:with-param name="content"><xsl:value-of select="concat(concat(func:formatDate($teamBezettingBeginDatum), ' - '), func:formatDate($teamBezettingEindDatum))"/></xsl:with-param>
                    <xsl:with-param name="style">inline <xsl:value-of select="$style"/></xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="labelValueUnitInlineMinBezetting">
        <xsl:param name="style"/>
        
        <xsl:call-template name="labelValueUnitInline">
            <xsl:with-param name="label">Minimale bezetting</xsl:with-param>
            <xsl:with-param name="value" select="$teamBezettingMin"/>
            <xsl:with-param name="unit">uur</xsl:with-param>
            <xsl:with-param name="style">inline <xsl:value-of select="$style"/></xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="labelValueUnitTwoLinesMinBezetting">
        <xsl:param name="style"/>
        
        <xsl:call-template name="labelValueUnitTwoLines">
            <xsl:with-param name="label">Minimale bezetting</xsl:with-param>
            <xsl:with-param name="value" select="$teamBezettingMin"/>
            <xsl:with-param name="unit">uur</xsl:with-param>
            <xsl:with-param name="style">inline <xsl:value-of select="$style"/></xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="originalCustomMinBezetting">
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">center requirements horizontal2</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="labelValueUnitInlineMinBezetting">
                    <xsl:with-param name="style" select="concat($style, ' original')"/>
                </xsl:call-template>
                <xsl:call-template name="labelValueUnitTwoLinesMinBezetting">
                    <xsl:with-param name="style" select="concat($style, ' custom')"/>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="labelValueUnitInlineBuffer">
        <xsl:param name="style"/>
        
        <xsl:call-template name="labelValueUnitInline">
            <xsl:with-param name="label">Buffer</xsl:with-param>
            <xsl:with-param name="value" select="$teamBezettingBuffer"/>
            <xsl:with-param name="unit">uur</xsl:with-param>
            <xsl:with-param name="style">inline <xsl:value-of select="$style"/></xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="labelValueUnitTwoLinesBuffer">
        <xsl:param name="style"/>
        
        <xsl:call-template name="labelValueUnitTwoLines">
            <xsl:with-param name="label">Buffer</xsl:with-param>
            <xsl:with-param name="value" select="$teamBezettingBuffer"/>
            <xsl:with-param name="unit">uur</xsl:with-param>
            <xsl:with-param name="style">inline <xsl:value-of select="$style"/></xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="originalCustomBuffer">
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">center requirements horizontal2</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="labelValueUnitInlineBuffer">
                    <xsl:with-param name="style" select="concat($style, ' original')"/>
                </xsl:call-template>
                <xsl:call-template name="labelValueUnitTwoLinesBuffer">
                    <xsl:with-param name="style" select="concat($style, ' custom')"/>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:function name="func:imageMedewerker">
        <xsl:param name="position"/>
        <xsl:param name="style"/>
        
        <xsl:call-template name="image">
            <xsl:with-param name="source" select="func:getValue($MEDEWERKER, $FOTO,$position)"/>
            <xsl:with-param name="name"><xsl:value-of select="concat(concat(func:getValue($MEDEWERKER, $VOORNAAM,$position), ' '), func:getValue($MEDEWERKER, $ACHTERNAAM,$position))"/></xsl:with-param>
            <xsl:with-param name="style">rounded <xsl:value-of select="$style"/></xsl:with-param>
        </xsl:call-template>
    </xsl:function>
    
    <xsl:function name="func:textVoornaamAchternaam">
        <xsl:param name="position"/>
        <xsl:param name="style"/>
        
        <xsl:call-template name="text">
            <xsl:with-param name="content"><xsl:value-of select="concat(concat(func:getValue($MEDEWERKER, $VOORNAAM,$position), ' '), func:getValue($MEDEWERKER, $ACHTERNAAM,$position))"/></xsl:with-param>
            <xsl:with-param name="style"><xsl:value-of select="$style"/> memberFontSize</xsl:with-param>
        </xsl:call-template>
    </xsl:function>
    
    <xsl:function name="func:textUren">
        <xsl:param name="position"/>
        <xsl:param name="style"/>
        
        <xsl:call-template name="text">
            <xsl:with-param name="content" select="concat(func:getValue($MEDEWERKER, $AANTALCONTACTUREN,$position), ' uur')"/>
            <xsl:with-param name="style"><xsl:value-of select="$style"/> memberFontSize</xsl:with-param>
        </xsl:call-template>
    </xsl:function>
    
    <xsl:function name="func:textFunctie">
        <xsl:param name="position"/>
        <xsl:param name="style"/>
        
        <xsl:call-template name="text">
            <xsl:with-param name="content" select="concat(concat(func:getValue($FUNCTIE, $NIVEAU,$position), ' '), func:getValue($FUNCTIE, $NAAM,$position))"/>
            <xsl:with-param name="style"><xsl:value-of select="$style"/> memberFontSize</xsl:with-param>
        </xsl:call-template>
    </xsl:function>
   
    <xsl:function name="func:textRol">
        <xsl:param name="position"/>
        <xsl:param name="style"/>
        
       <xsl:call-template name="text">
           <xsl:with-param name="content" select="func:getValue($ROL, $NAAM,$position)"/>
           <xsl:with-param name="style"><xsl:value-of select="$style"/> memberFontSize</xsl:with-param>
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
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">teambezetting flex <xsl:value-of select="$style"/></xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="item">
                    <xsl:with-param name="style">vertical</xsl:with-param>
                    <xsl:with-param name="content">
                        <xsl:copy-of select="$content"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="spanTitle">
        <xsl:param name="content"/>
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">flex <xsl:value-of select="$style"/></xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="item">
                    <xsl:with-param name="style">vertical</xsl:with-param>
                    <xsl:with-param name="content">
                        <xsl:copy-of select="$content"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="spanRequirements">
        <xsl:param name="content"/>
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">flex <xsl:value-of select="$style"/></xsl:with-param>
            <xsl:with-param name="content">
                <xsl:copy-of select="$content"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="spanTeam">
        <xsl:param name="content"/>
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">teambox vertical <xsl:value-of select="$style"/></xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="item">
                    <xsl:with-param name="style">team flex</xsl:with-param>
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
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">columns</xsl:with-param>
            <xsl:with-param name="id"><xsl:if test="$position = 1">firstParent</xsl:if></xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="item">
                    <xsl:with-param name="style">member center <xsl:value-of select="$style"/></xsl:with-param>
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
        <xsl:param name="importance"/>
        
        <xsl:choose>
            <xsl:when test="$id = '1'">
                <xsl:call-template name="titleTeambezetting">
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '2'">
                <xsl:call-template name="textTeamName">
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '3'">
                <xsl:call-template name="periodTeambezettingPeriod">
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '4'">
                <xsl:call-template name="originalCustomMinBezetting">
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '5'">
                <xsl:call-template name="originalCustomBuffer">
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '6'">
                <xsl:copy-of select="func:imageMedewerker($position, $importance)"/>
            </xsl:when>
            <xsl:when test="$id = '7'">
                <xsl:copy-of select="func:textVoornaamAchternaam($position, $importance)"/>
            </xsl:when>
            <xsl:when test="$id = '8'">
                <xsl:copy-of select="func:textUren($position, $importance)"/>
            </xsl:when>
            <xsl:when test="$id = '9'">
                <xsl:copy-of select="func:textFunctie($position, $importance)"/>
            </xsl:when>
            <xsl:when test="$id = '10'">
                <xsl:copy-of select="func:textRol($position, $importance)"/>
            </xsl:when>
            <xsl:when test="$id = '11'">
                <xsl:call-template name="emptySpan">
                    <xsl:with-param name="content" select="$contents"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '12'">
                <xsl:call-template name="spanRequirements">
                    <xsl:with-param name="content" select="$contents"/>
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '13'">
                <xsl:call-template name="spanTeam">
                    <xsl:with-param name="content" select="$contents"/>
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '14'">
                <xsl:call-template name="spanContent">
                    <xsl:with-param name="content" select="$contents"/>
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '15'">
                <xsl:call-template name="spanTitle">
                    <xsl:with-param name="content" select="$contents"/>
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$multiplicityId = '1'">
                <xsl:call-template name="spanMedewerker">
                    <xsl:with-param name="content" select="$contents"/>
                    <xsl:with-param name="position" select="$position"/>
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>