<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:UML="http://www.eclipse.org/uml2/4.0.0/UML"
    xmlns:func="http://exslt.org/functions"
    exclude-result-prefixes="xs UML func"
    version="2.0">
    <xsl:import href="../genericHTML.xsl"/>
    
    <xsl:output method="html" />
    
    <xsl:template name="titleCategorie">
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">center</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="title">
                    <xsl:with-param name="style">inline <xsl:value-of select="$style"/></xsl:with-param>
                    <xsl:with-param name="content">Categorie</xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="textKiesCategorie">
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">center</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="text">
                    <xsl:with-param name="content">Kies uw categorie</xsl:with-param>
                    <xsl:with-param name="style">inline <xsl:value-of select="$style"/></xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="spanCategorie">
        <xsl:param name="content"/>
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">vertical <xsl:value-of select="$style"/></xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="item">
                    <xsl:with-param name="style">flex</xsl:with-param>
                    <xsl:with-param name="content">
                        <xsl:copy-of select="$content"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:function name="func:textCategorieName">
        <xsl:param name="position"/>
        <xsl:param name="style"/>
        
        <xsl:call-template name="text">
            <xsl:with-param name="content" select="func:getValue('Categorie', $NAAM,$position)"/>
            <xsl:with-param name="style"><xsl:value-of select="$style"/></xsl:with-param>
        </xsl:call-template>
    </xsl:function>
    
    <xsl:function name="func:textCategorieSummary">
        <xsl:param name="position"/>
        <xsl:param name="style"/>
        
        <xsl:call-template name="text">
            <xsl:with-param name="content" select="func:getValue('Categorie', 'samenvatting',$position)"/>
            <xsl:with-param name="style"><xsl:value-of select="$style"/></xsl:with-param>
        </xsl:call-template>
    </xsl:function>
    
    <xsl:template name="spanMultiplicity">
        <xsl:param name="content"/>
        <xsl:param name="position"/>
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">columns</xsl:with-param>
            <xsl:with-param name="id"><xsl:if test="$position = 1">firstParent</xsl:if></xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="item">
                    <xsl:with-param name="style">item center greyBorder <xsl:value-of select="$style"/></xsl:with-param>
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
                <xsl:call-template name="titleCategorie">
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '2'">
                <xsl:call-template name="textKiesCategorie">
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '3'">
                <xsl:call-template name="spanCategorie">
                    <xsl:with-param name="content" select="$contents"/>
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '4'">
                <xsl:copy-of select="func:textCategorieName($position, $importance)"/>
            </xsl:when>
            <xsl:when test="$id = '5'">
                <xsl:copy-of select="func:textCategorieSummary($position, $importance)"/>
            </xsl:when>
            <xsl:when test="$id = '6'">
                <xsl:call-template name="emptySpan">
                    <xsl:with-param name="content" select="$contents"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$multiplicityId = '1'">
                <xsl:call-template name="spanMultiplicity">
                    <xsl:with-param name="content" select="$contents"/>
                    <xsl:with-param name="position" select="$position"/>
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>