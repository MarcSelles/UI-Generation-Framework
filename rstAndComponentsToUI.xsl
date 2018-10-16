<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:func="http://exslt.org/functions"
    exclude-result-prefixes="xs func"
    version="2.0">
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- Function to structure the UI components using RST -->
    <xsl:function name="func:rstAndUIComponentsToUI">
        <xsl:param name="rst"/>
        
        <!-- Take the root UI element(s) of the RST -->
        <xsl:for-each select="$rst//body/*[not(@parent)]">
            <xsl:choose>
                <!-- Atomic UI elements -->
                <xsl:when test="./name() = 'segment'">
                    <!-- Generate the UI component -->
                    <xsl:call-template name="rstTemplate">
                        <xsl:with-param name="id" select="./@id"/>
                        <xsl:with-param name="importance" select="'importance1'"/>
                    </xsl:call-template>
                    <!-- Call function for structuring the children -->
                    <xsl:copy-of select="func:rstOrderOfElements(.,0, 1)"/>
                </xsl:when>
                <!-- Composite UI elements -->
                <xsl:otherwise>
                    <!-- Generate the UI component -->
                    <xsl:call-template name="rstTemplate">
                        <xsl:with-param name="id" select="./@id"/>
                        <xsl:with-param name="importance" select="'importance1'"/>
                        <!-- Call function for structuring the children -->
                        <xsl:with-param name="contents" select="func:rstOrderOfElements(.,0, 1)"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>
    
    <!-- Function for structuring the children of a UI element -->
    <xsl:function name="func:rstOrderOfElements">
        <xsl:param name="parent"/>
        <xsl:param name="position"/>
        <xsl:param name="importance"/>
        
        <xsl:variable name="importance" select="$importance + 1"/>
        
        <!-- For each child -->
        <xsl:for-each select="$RST//body/*[@parent = $parent/@id]">
            <xsl:variable name="id" select="string(./@id)"/>
            <xsl:choose>
                <!-- Child = Atomic UI element -->
                <xsl:when test="./name() = 'segment'">
                    <xsl:choose>
                        <!-- Relationship to parent = elaboration -->
                        <xsl:when test="string(./@relname) = 'elaboration'">
                            <xsl:call-template name="item">
                                <xsl:with-param name="content">
                                    <!-- Generate the UI component -->
                                    <xsl:call-template name="rstTemplate">
                                        <xsl:with-param name="id" select="$id"/>
                                        <xsl:with-param name="position" select="$position"/>
                                        <xsl:with-param name="importance" select="concat('importance', $importance)"/>
                                    </xsl:call-template>
                                    <!-- Use recursion for structuring the children -->
                                    <xsl:copy-of select="func:rstOrderOfElements(.,$position, $importance)"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <!-- Relationship to parent != elaboration -->
                        <xsl:otherwise>
                            <!-- Generate the UI component -->
                            <xsl:call-template name="rstTemplate">
                                <xsl:with-param name="id" select="$id"/>
                                <xsl:with-param name="position" select="$position"/>
                                <xsl:with-param name="importance" select="concat('importance', $importance)"/>
                            </xsl:call-template>
                            <!-- Use recursion for structuring the children -->
                            <xsl:copy-of select="func:rstOrderOfElements(.,$position, $importance)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- Child = Composite UI element -->
                <xsl:otherwise>
                    <xsl:choose>
                        <!-- Parent contains multiplicity -->
                        <xsl:when test="./@maxEntities">
                            <xsl:variable name="multiplicityId" select="string(./@multiplicityId)"/>
                            <xsl:variable name="childs" select="$RST//body/*[@parent = $id]"/>
                            <xsl:variable name="firstChild" select="$childs[1]/text()"/>
                            <xsl:variable name="class" select="substring-before($firstChild,'.')"/>
                            <xsl:variable name="attribute" select="substring-after($firstChild,'.')"/>
                            <xsl:variable name="numberOfInstances" select="count($elementRoot[@name= $class]/ownedAttribute[@name = $attribute]/value)"/>
                            <!-- Generate the UI component for using multiplicity -->
                            <xsl:call-template name="rstTemplate">
                                <xsl:with-param name="id" select="$id"/>
                                <xsl:with-param name="importance" select="concat('importance', $importance)"/>
                                <xsl:with-param name="contents">
                                    <xsl:variable name="importance" select="$importance + 1"/>
                                    <!-- For each instance of the multiplicity -->
                                    <xsl:for-each select="1 to $numberOfInstances">
                                        <xsl:variable name="position" select="."/>
                                        <xsl:call-template name="rstTemplate">
                                            <xsl:with-param name="multiplicityId" select="$multiplicityId"/>
                                            <xsl:with-param name="position" select="$position"/>
                                            <xsl:with-param name="importance" select="concat('importance', $importance)"/>
                                            <xsl:with-param name="contents">
                                                <xsl:for-each select="$childs">
                                                    <xsl:choose>
                                                        <!-- Child = Atomic UI element -->
                                                        <xsl:when test="./name() = 'segment'">
                                                            <!-- Generate the UI component -->
                                                            <xsl:call-template name="rstTemplate">
                                                                <xsl:with-param name="id" select="./@id"/>
                                                                <xsl:with-param name="position" select="$position"/>
                                                                <xsl:with-param name="importance" select="concat('importance', $importance)"/>
                                                            </xsl:call-template>
                                                            <!-- Use recursion for structuring the children -->
                                                            <xsl:copy-of select="func:rstOrderOfElements(.,$position, $importance)"/>
                                                        </xsl:when>
                                                        <!-- Child = Composite UI element -->
                                                        <xsl:otherwise>
                                                            <!-- Generate the UI component -->
                                                            <xsl:call-template name="rstTemplate">
                                                                <xsl:with-param name="id" select="./@id"/>
                                                                <xsl:with-param name="position" select="$position"/>
                                                                <xsl:with-param name="importance" select="concat('importance', $importance)"/>
                                                                <!-- Use recursion for structuring the children -->
                                                                <xsl:with-param name="contents" select="func:rstOrderOfElements(.,$position, $importance)"/>
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
                        <!-- Parent does not contain multiplicity -->
                        <xsl:otherwise>
                            <!-- Generate the UI component -->
                            <xsl:call-template name="rstTemplate">
                                <xsl:with-param name="id" select="$id"/>
                                <xsl:with-param name="position" select="$position"/>
                                <xsl:with-param name="importance" select="concat('importance', $importance)"/>
                                <!-- Use recursion for structuring the children -->
                                <xsl:with-param name="contents" select="func:rstOrderOfElements(.,$position, $importance)"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>
    
    
</xsl:stylesheet>