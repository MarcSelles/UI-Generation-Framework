<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:UML="http://www.eclipse.org/uml2/4.0.0/UML"
    xmlns:func="http://exslt.org/functions"
    exclude-result-prefixes="xs UML func"
    version="2.0">
    <xsl:output method="html" /> 
    
    <!-- 
        Transformeer een datum van de vorm ddmmyyyy naar dd-mm-yyyy.
        @param date:    Datum in de vorm 'ddmmyyyy'
        @return:        Datum in de vorm 'dd-mm-yyyy'
    -->
    <xsl:function name="func:formatDate">
        <xsl:param name="date"/>
        
        <xsl:variable name="day" select="substring($date,1,2)"/>
        <xsl:variable name="month" select="substring($date,3,2)"/>
        <xsl:variable name="year" select="substring($date,5, 4)"/>
        
        <xsl:value-of select="concat(concat(concat($day, '-'),concat($month, '-')),$year)"/>
    </xsl:function>
    
    <!-- 
        Haal een waarde uit de xml die in een attribuut van een element is opgeslagen.
        @param element:     Het hoofd element
        @param attribute:   De attribute waar de waarde in opgeslagen is
        @return:            De waarde van het attribuut
    -->
    <xsl:function name="func:getValue">
        <xsl:param name="element"/>
        <xsl:param name="attribute"/>
        
        <xsl:value-of select="$elementRoot[@name=$element]/ownedAttribute[@name = $attribute]/value"/>
    </xsl:function>
    
    <!--
        Bij een groot scherm wordt de volledige text getoond, anders het label en de korte text.
        Meerdere paragrafen worden onderscheiden door een ;
        @param fullText:    De volledige text die bij een groot scherm getoond moet worden
        @param shortText:   De verkleinde text die getoond wordt bij een kleinder scherm
        @param label:       Het label die boven de verkleinde text komt te staan
    -->
    <xsl:template name="fullOrShortText">
        <xsl:param name="fullText"/>
        <xsl:param name="shortText"/>
        <xsl:param name="label"/>
        
        <xsl:variable name="tokenizeFullText" select="tokenize($fullText,';')"/>
        <xsl:variable name="tokenizeShortText" select="tokenize($shortText,';')"/>
        <xsl:variable name="tokenizeLabel" select="tokenize($label,';')"/>
        
        
        <xsl:for-each select="$tokenizeFullText">
            <xsl:variable name="position" select="position()"/>
            <p>
                <span class="full-text"><xsl:value-of select="."/></span>
                <span class="short-text"><b><xsl:value-of select="$tokenizeLabel[$position]"/></b></span><br/>
                <span class="short-text"><xsl:value-of select="$tokenizeShortText[$position]"/></span>
            </p>
        </xsl:for-each>
  
    </xsl:template>

    <xsl:template name="multipleOptions">
        <xsl:param name="labels"/>
        
        <xsl:variable name="tokenizeLabel" select="tokenize($labels,';')"/>
        
        <!-- Tab links -->
        <div class="tab full-text">
            <xsl:for-each select="$tokenizeLabel">
                <button class="tablinks"><xsl:value-of select="."/></button>
            </xsl:for-each>
        </div>
        
        <select class="short-text">
            <xsl:for-each select="$tokenizeLabel">
                <option value="{.}"><xsl:value-of select="."/></option>
            </xsl:for-each>
        </select>
    </xsl:template>
    
    <xsl:template name="text">
        <xsl:param name="content"/>
        <xsl:param name="importance" select="1"/>
        
        <p class="importance{$importance}"><xsl:value-of select="$content"/></p>
    </xsl:template>
    
    <xsl:template name="image">
        <xsl:param name="source"/>
        <xsl:param name="name"/>
        <xsl:param name="importance"/>
        <xsl:param name="style"/>
        
        <img class="importance{$importance} {$style}" src="{$source}" alt="{$name}"/>
    </xsl:template>

</xsl:stylesheet>