<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:UML="http://www.eclipse.org/uml2/4.0.0/UML"
    xmlns:func="http://exslt.org/functions"
    exclude-result-prefixes="xs UML func"
    version="2.0">
    <xsl:output method="html" /> 
    
    <!-- 
        Transform a date from ddmmyyyy to dd-mm-yyyy
        @param date:    Date in format 'ddmmyyyy'
        @return:        Date in format 'dd-mm-yyyy'
    -->
    <xsl:function name="func:formatDate">
        <xsl:param name="date"/>
        
        <xsl:variable name="day" select="substring($date,1,2)"/>
        <xsl:variable name="month" select="substring($date,3,2)"/>
        <xsl:variable name="year" select="substring($date,5, 4)"/>
        
        <xsl:value-of select="concat(concat(concat($day, '-'),concat($month, '-')),$year)"/>
    </xsl:function>
    
    <!-- 
        Retrieve the value of a attricute of a class in the domain model
        @param element:     Class
        @param attribute:   Attribute
        @return:            Value of the attribute
    -->
    <xsl:function name="func:getValue">
        <xsl:param name="element"/>
        <xsl:param name="attribute"/>
        <xsl:param name="position"/>
        
        <xsl:value-of select="$elementRoot[@name=$element]/ownedAttribute[@name = $attribute]/value[$position]"/>
    </xsl:function>
    
    <!-- 
        Generate the composite UI component, containing other UI components
        @param content:     The children of the composite UI component
        @param style:       Class of the HTML node
        @param id:          Id of the HTML node
    -->
    <xsl:template name="item">
        <xsl:param name="content"/>
        <xsl:param name="style"/>
        <xsl:param name="id"/>
        
        <div class="{$style}" id="{$id}">
            <xsl:copy-of select="$content"/>
        </div>
    </xsl:template>
    
    <!-- Template of the UI component "LabelValueUnitInline" -->
    <xsl:template name="labelValueUnitInline">
        <xsl:param name="label"/>
        <xsl:param name="value"/>
        <xsl:param name="unit"/>
        <xsl:param name="style"/>
        
        <p class="{$style}"><b><xsl:copy-of select="$label"/></b>: <xsl:copy-of select="concat(concat($value, ' '), $unit)"/></p>
        
    </xsl:template>
    
    <xsl:template name="labelValueUnitTwoLines">
        <xsl:param name="label"/>
        <xsl:param name="value"/>
        <xsl:param name="unit"/>
        <xsl:param name="style"/>
        
        <p class="{$style}"><b><xsl:copy-of select="$label"/></b><br/>
            <xsl:copy-of select="concat(concat($value, ' '), $unit)"/></p>
    </xsl:template>
    
    <!-- Template of the UI component "LabelValueUnitTwoLines" -->
    <xsl:template name="labelInlineTwoValueTwoUnitTwoLines">
        <xsl:param name="label"/>
        <xsl:param name="value1"/>
        <xsl:param name="unit1"/>
        <xsl:param name="value2"/>
        <xsl:param name="unit2"/>
        <xsl:param name="style"/>
        
        <span class="{$style}"><b><xsl:copy-of select="$label"/></b><br/>
            <xsl:copy-of select="concat(concat($value1, ' '), $unit1)"/>/ <xsl:copy-of select="concat(concat($value2, ' '), $unit2) "/></span>
    </xsl:template>
    
    <!-- Template of the UI component "TabMultipleOptions" -->
    <xsl:template name="tabMultipleOptions">
        <xsl:param name="labels"/>
        <xsl:param name="style"/>
        
        <xsl:variable name="tokenizeLabel" select="tokenize($labels,';')"/>
        
        <!-- Tab links -->
        
        <!--<div class="tab">-->
            <xsl:for-each select="$tokenizeLabel">
                <xsl:choose>
                    <xsl:when test=". = 'Vakantie'">
                        <button class="tablink" onclick="openVerlof('{.}', this)" id="defaultOpen">
                            <span class="inline {$style}"><xsl:value-of select="."/></span>
                        </button>
                    </xsl:when>
                    <xsl:otherwise>
                        <button class="tablink" onclick="openVerlof('{.}', this)">
                            <span class="inline {$style}"><xsl:value-of select="."/></span>
                        </button>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        <!--</div>-->
    </xsl:template>

    <!-- Template of the UI component "DropdownMultipleOptions" -->
    <xsl:template name="dropdownMultipleOptions">
        <xsl:param name="labels"/>
        <xsl:param name="style"/>
        
        <xsl:variable name="tokenizeLabel" select="tokenize($labels,';')"/>
        
        <select class="dropdown {$style}" onchange="openVerlof(this, this)">
            <xsl:for-each select="$tokenizeLabel">
                <option value="{.}"><xsl:value-of select="."/></option>
            </xsl:for-each>
        </select>
    </xsl:template>
    
    <!-- Template of the UI component "Text" -->
    <xsl:template name="text">
        <xsl:param name="content"/>
        <xsl:param name="style"/>
        
        <p class="{$style}"><xsl:copy-of select="$content"/></p>
    </xsl:template>
    
    <!-- 
        Template of the UI component "Text" where the text should be represented using HTML node span.
        TO DO: combine this template with "Text"
    -->
    <xsl:template name="textLine">
        <xsl:param name="content"/>
        <xsl:param name="style"/>
        
        <span class="{$style}"><xsl:copy-of select="$content"/></span>
    </xsl:template>
    
    <!-- Template of the UI component "Image" -->
    <xsl:template name="image">
        <xsl:param name="source"/>
        <xsl:param name="name"/>
        <xsl:param name="style"/>
        
        <img class="{$style}" src="{$source}" alt="{$name}" width="60%" height="auto"/>
    </xsl:template>

    <!-- Template of the UI component "Button" -->
    <xsl:template name="submitButton">
        <xsl:param name="text"/>
        <xsl:param name="style"/>
        
        <input class="{$style}" type="submit" value="{$text}"></input>
        
    </xsl:template>

    <!-- Template of the UI component "Title" -->
    <xsl:template name="title">
        <xsl:param name="content"/>
        <xsl:param name="style"/>
        
        <h1 class="{$style}"><xsl:copy-of select="$content"/></h1>
    </xsl:template>

</xsl:stylesheet>