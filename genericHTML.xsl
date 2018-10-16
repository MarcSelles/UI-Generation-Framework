<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="variables.xsl"/>
    
    <xsl:output method="html" encoding="utf-8" indent="yes" />
    
    <!-- Generic structure of the HTML -->
    <xsl:template name="genericStructure">
        <xsl:param name="title"/>
        <xsl:param name="content"/>
        <xsl:param name="additionalHead"/>
        
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title><xsl:copy-of select="$title"/></title>
                <link rel="stylesheet" href="style.css" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
                <script type="text/javascript" src="scripts/tab.js"></script>
                <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
                <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                <script type="text/javascript" src="scripts/responsive.js"></script>
                <xsl:copy-of select="$additionalHead"></xsl:copy-of>
            </head>
            <body>
                <div class="sidenav">
                    <a href="#">Navigation</a>
                </div>
                
                <div class="main">
                    <xsl:copy-of select="$content"/>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>