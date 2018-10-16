<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!--  Import data (csv)  -->
    <xsl:param name="csv-encoding" as="xs:string" select="'iso-8859-1'"/>
    <xsl:param name="csv-uri" as="xs:string" select="'../data.csv'"/>
    
    <!--  Transform the csv-file into xml and store xml in variable  -->
    <xsl:variable name="csv2xml">
        <xsl:choose>
            <xsl:when test="unparsed-text-available($csv-uri, $csv-encoding)">
                <xsl:variable name="csv" select="unparsed-text($csv-uri, $csv-encoding)"/>
                
                <!--Get Header-->
                <xsl:variable name="header-tokens" as="xs:string*">
                    <xsl:analyze-string select="$csv" regex="\r\n?|\n">
                        <xsl:non-matching-substring>
                            <xsl:if test="position()=1">
                                <xsl:copy-of select="tokenize(.,';')"/>                                        
                            </xsl:if>
                        </xsl:non-matching-substring>
                    </xsl:analyze-string>
                </xsl:variable>      
                
                <!-- Create xml -->
                <xsl:analyze-string select="$csv" regex="\r\n?|\n">
                    <xsl:non-matching-substring>
                        <xsl:if test="not(position()=1)">
                            <data>
                                <!-- 
                                    The name of each node is the columnname of the csv.
                                    The value of these nodes will be the data itself 
                                -->
                                <xsl:for-each select="tokenize(.,';')">
                                    <xsl:variable name="pos" select="position()"/>
                                    <xsl:element name="{$header-tokens[$pos]}">
                                        <xsl:value-of select="."/>
                                    </xsl:element>
                                </xsl:for-each>
                            </data>
                        </xsl:if>
                    </xsl:non-matching-substring>
                </xsl:analyze-string>
            </xsl:when>
        </xsl:choose>
    </xsl:variable>
    
</xsl:stylesheet>