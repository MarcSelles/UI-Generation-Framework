<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:func="http://exslt.org/functions"
    exclude-result-prefixes="xs func"
    version="2.0">
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    
    <xsl:function name="func:rstAndUIComponentsToUI">
        <xsl:param name="rst"/>
        
        <xsl:for-each select="$rst//body/*[not(@parent)]">
            <xsl:choose>
                <xsl:when test="./name() = 'segment'">
                    <xsl:call-template name="rstTemplate">
                        <xsl:with-param name="id" select="./@id"/>
                    </xsl:call-template>
                    <xsl:copy-of select="func:rstOrderOfElements(.,0)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="rstTemplate">
                        <xsl:with-param name="id" select="./@id"/>
                        <xsl:with-param name="contents" select="func:rstOrderOfElements(.,0)"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>
    
    
    
    <xsl:function name="func:rstOrderOfElements">
        <xsl:param name="parent"/>
        <xsl:param name="position"/>
        
        <xsl:for-each select="$RST//body/*[@parent = $parent/@id]">
            <xsl:variable name="id" select="string(./@id)"/>
            <xsl:choose>
                <xsl:when test="./name() = 'segment'">
                    <xsl:call-template name="rstTemplate">
                        <xsl:with-param name="id" select="$id"/>
                        <xsl:with-param name="position" select="$position"/>
                    </xsl:call-template>
                    <xsl:copy-of select="func:rstOrderOfElements(.,$position)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="./@maxEntities">
                            <xsl:variable name="multiplicityId" select="string(./@multiplicityId)"/>
                            <xsl:variable name="childs" select="$RST//body/*[@parent = $id]"/>
                            <xsl:variable name="firstChild" select="$childs[1]/text()"/>
                            <xsl:variable name="class" select="substring-before($firstChild,'.')"/>
                            <xsl:variable name="attribute" select="substring-after($firstChild,'.')"/>
                            <xsl:variable name="numberOfInstances" select="count($childs)"/>
                            <xsl:variable name="numberOfInstances" select="count($elementRoot[@name= $class]/ownedAttribute[@name = $attribute]/value)"/>
                            <xsl:call-template name="rstTemplate">
                                <xsl:with-param name="id" select="$id"/>
                                <xsl:with-param name="contents">
                                    <xsl:for-each select="1 to $numberOfInstances">
                                        <xsl:variable name="position" select="."/>
                                        <xsl:call-template name="rstTemplate">
                                            <xsl:with-param name="multiplicityId" select="$multiplicityId"/>
                                            <xsl:with-param name="position" select="$position"/>
                                            <xsl:with-param name="contents">
                                                <xsl:for-each select="$childs">
                                                    
                                                    <xsl:choose>
                                                        <xsl:when test="./name() = 'segment'">
                                                            <xsl:call-template name="rstTemplate">
                                                                <xsl:with-param name="id" select="./@id"/>
                                                                <xsl:with-param name="position" select="$position"/>
                                                            </xsl:call-template>
                                                            <xsl:copy-of select="func:rstOrderOfElements(.,$position)"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:call-template name="rstTemplate">
                                                                <xsl:with-param name="id" select="./@id"/>
                                                                <xsl:with-param name="position" select="$position"/>
                                                                <xsl:with-param name="contents" select="func:rstOrderOfElements(.,$position)"/>
                                                            </xsl:call-template>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:for-each>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="rstTemplate">
                                <xsl:with-param name="id" select="$id"/>
                                <xsl:with-param name="contents" select="func:rstOrderOfElements(.,$position)"/>
                                <xsl:with-param name="position" select="$position"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
            
        </xsl:for-each>
    </xsl:function>
    
    
</xsl:stylesheet>