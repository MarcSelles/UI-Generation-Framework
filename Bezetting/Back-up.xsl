<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!--<xsl:template name="rstTemplate">
        <xsl:param name="contents"/>
        
        
        <rst>
            <element>
                <id>1</id>
                <uiComponent><xsl:copy-of select="$titleTeambezetting"/></uiComponent>
            </element>
            <element>
                <id>2</id>
                <uiComponent><xsl:copy-of select="$textTeamName"/></uiComponent>
            </element>
            <element>
                <id>3</id>
                <uiComponent><xsl:copy-of select="$periodTeambezettingPeriod"/></uiComponent>
            </element>
            <element>
                <id>4</id>
                <uiComponent><xsl:copy-of select="$originalCustomMinBezetting"/></uiComponent>
            </element>
            <element>
                <id>5</id>
                <uiComponent><xsl:copy-of select="$originalCustomBuffer"/></uiComponent>
            </element>
            <element>
                <id>6</id>
                <uiComponent><xsl:copy-of select="func:imageMedewerker($contents)"/></uiComponent>
            </element>
            <element>
                <id>7</id>
                <uiComponent><xsl:copy-of select="func:textVoornaamAchternaam($contents)"/></uiComponent>
            </element>
            <element>
                <id>8</id>
                <uiComponent><xsl:copy-of select="func:textUren($contents)"/></uiComponent>
            </element>
            <element>
                <id>9</id>
                <uiComponent><xsl:copy-of select="func:textFunctie($contents)"/></uiComponent>
            </element>
            <element>
                <id>10</id>
                <uiComponent><xsl:copy-of select="func:textRol($contents)"/></uiComponent>
            </element>
            <element>
                <id>11</id>
                <uiComponent><!-\-<xsl:call-template name="span"/>-\-></uiComponent>
            </element>
            <element>
                <id>12</id>
                <uiComponent>
                    <xsl:call-template name="spanMedewerker">
                        <xsl:with-param name="content" select="$contents"/>
                    </xsl:call-template>
                </uiComponent>
            </element>
            <element>
                <id>13</id>
                <uiComponent>
                    
                    <xsl:call-template name="spanTeam">
                        <xsl:with-param name="content" select="$contents"/>
                    </xsl:call-template>
                </uiComponent>
            </element>
            <element>
                <id>14</id>
                <uiComponent>
                    <xsl:copy-of select="func:spanContent($contents)"/>
                </uiComponent>
            </element>
        </rst>
        
        
    </xsl:template>-->
    
    
    
    <xsl:function name="func:rstToHTML">
        <xsl:param name="order"/>
        
        <xsl:for-each select="$order/orderedRst/*">
            
            <xsl:variable name="i" select="position()" />
            
            <xsl:variable name="currentID" select="./@id"/>
            
            <xsl:choose>
                <xsl:when test="$order/orderedRst/segment = .">
                    <xsl:copy-of select="func:UIComponent($order, ., $order/orderedRst/*[$i+1], false())"/>
                    <xsl:copy-of select="$rstComponents//rst/element[id = $currentID]/uiComponent/*"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="func:UIComponent($order, ., $order/orderedRst/*[$i+1], true())"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>
    
    <xsl:function name="func:UIComponent">
        <xsl:param name="order"/>
        <xsl:param name="item1"/>
        <xsl:param name="item2"/>
        <xsl:param name="span"/>
        <xsl:param name="skip"/>
        
        <xsl:variable name="rstComponents">
            <xsl:call-template name="rstTemplate">
                <xsl:with-param name="contents" select="func:bla"></xsl:with-param> <!--select="func:rstToHTML($order[$i+1])"-->
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$skip">
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$rstComponents//rst/element[id = $currentID]/uiComponent/*"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    
    <!--<xsl:function name="func:rstToHTML">
        <xsl:param name="order"/>
        
        <xsl:for-each select="$order/orderedRst/*">
            
            <xsl:variable name="i" select="position()" />
            
            <xsl:variable name="currentID" select="./@id"/>
            
            <xsl:choose>
                <xsl:when test="$order/orderedRst/segment = .">
                    <xsl:copy-of select="func:UIComponent($order, ., $order/orderedRst/*[$i+1], false())"/>
                    <xsl:copy-of select="$rstComponents//rst/element[id = $currentID]/uiComponent/*"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="func:UIComponent($order, ., $order/orderedRst/*[$i+1], true())"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>
    
    <xsl:function name="func:UIComponent">
        <xsl:param name="order"/>
        <xsl:param name="item1"/>
        <xsl:param name="item2"/>
        <xsl:param name="span"/>
        <xsl:param name="skip"/>
        
        <xsl:variable name="rstComponents">
            <xsl:call-template name="rstTemplate">
                <xsl:with-param name="contents" select="func:bla"></xsl:with-param> <!-\-select="func:rstToHTML($order[$i+1])"-\->
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$skip">
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$rstComponents//rst/element[id = $currentID]/uiComponent/*"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>-->
    
    
    <!--            <xsl:copy-of select="."></xsl:copy-of>-->
    <!--<xsl:choose>
                <xsl:when test="./segment">
                    <xsl:copy-of select="."/>
<!-\-                    <xsl:copy-of select="$rstModel//rst/element[id = $parent/@id]/uiComponent/*"/>-\->
                    <xsl:copy-of select="func:rstComponents(.)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="."/>
<!-\-                    <xsl:copy-of select="$rstModel//rst/element[id = $parent/@id]/uiComponent/*"/>-\->
                </xsl:otherwise>
            </xsl:choose>-->
    
    <!--            <xsl:copy-of select="$rstModel//rst/element[id = $parent/@id]/uiComponent/*"/>-->
    
    
    <!--        <xsl:copy-of select="$rstModel//rst/element[id = $parent/@id]/uiComponent/*"/>-->
    
    <!--<xsl:choose>
            <xsl:when test="contains($rst/rst[id = $parent/@id]/uiComponent,'func:')">
                <xsl:variable name="content" select="'hoi'"/>
                <xsl:copy-of select="$rst/rst[id = $parent/@id]/uiComponent"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$rst/rst[id = $parent/@id]/uiComponent/*"/>
            </xsl:otherwise>
        </xsl:choose>-->
    <!--        <xsl:value-of select="$rst/rst[id = $parent/@id]/uiComponent"/>-->
</xsl:stylesheet>