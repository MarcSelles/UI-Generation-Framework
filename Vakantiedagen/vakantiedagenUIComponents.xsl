<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:UML="http://www.eclipse.org/uml2/4.0.0/UML"
    xmlns:func="http://exslt.org/functions"
    exclude-result-prefixes="xs UML func"
    version="2.0">
    <xsl:import href="../genericHTML.xsl"/>
    
    <xsl:output method="html" />
    
    <xsl:template name="multipleOptionsVerlofsoort">
        <xsl:param name="style"/>
        
        <xsl:call-template name="tabMultipleOptions">
            <xsl:with-param name="labels">Vakantie;Langdurig;Privé;Bijzonder;Kinder</xsl:with-param>
        </xsl:call-template>
        
        <xsl:call-template name="dropdownMultipleOptions">
            <xsl:with-param name="labels">Vakantie;Langdurig;Privé;Bijzonder;Kinder</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="textLineWelcome">
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">vertical</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="textLine">
                    <xsl:with-param name="content">Hoi <xsl:value-of select="concat(concat($medewerkerVoornaam,' '), $medewerkerAchternaam)"/></xsl:with-param>
                    <xsl:with-param name="style">standaard inline <xsl:value-of select="$style"/> original</xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="textLineTotaalVerlofdagen">
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">vertical</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="textLine">
                    <xsl:with-param name="content">Dit jaar heb je recht op <b> <xsl:value-of select="$verlofTotaalAantal"/> vakantiedagen / <xsl:value-of select="$verlofTotaalAantal * 8"/> vakantieuren.</b></xsl:with-param>
                    <xsl:with-param name="style">standaard inline <xsl:value-of select="$style"/> original</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="labelInlineTwoValueTwoUnitTwoLines">
                    <xsl:with-param name="label">Totaal aantal vakantiedagen/-uren</xsl:with-param>
                    <xsl:with-param name="value1" select="$verlofTotaalAantal"/>
                    <xsl:with-param name="unit1" select="'dagen'"/>
                    <xsl:with-param name="value2" select="$verlofTotaalAantal * 8"/>
                    <xsl:with-param name="unit2" select="'uren'"/>
                    <xsl:with-param name="style">standaard inline <xsl:value-of select="$style"/> custom</xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="textLineVerbruiktVerlofdagen">
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">vertical</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="textLine">
                    <xsl:with-param name="content">Tot nu toe heb je <b> <xsl:value-of select="$verlofTotaalAantal - $verlofBeschikbaarAantal"/> vakantiedagen / 
                        <xsl:value-of select="($verlofTotaalAantal - $verlofBeschikbaarAantal) * 8"/> vakantieuren</b> opgenomen.</xsl:with-param>
                    <xsl:with-param name="style">standaard inline original <xsl:value-of select="$style"/></xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="labelInlineTwoValueTwoUnitTwoLines">
                    <xsl:with-param name="label">Verbruikt aantal vakantiedagen/-uren</xsl:with-param>
                    <xsl:with-param name="value1" select="$verlofTotaalAantal - $verlofBeschikbaarAantal"/>
                    <xsl:with-param name="unit1" select="'dagen'"/>
                    <xsl:with-param name="value2" select="($verlofTotaalAantal - $verlofBeschikbaarAantal) * 8"/>
                    <xsl:with-param name="unit2" select="'uren'"/>
                    <xsl:with-param name="style">standaard inline custom <xsl:value-of select="$style"/></xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="textLineBeschikbaarVerlofdagen">
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">vertical</xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="textLine">
                    <xsl:with-param name="content">Dit betekent dat je nog <b> <xsl:value-of select="$verlofBeschikbaarAantal"/> vakantiedagen / 
                        <xsl:value-of select="$verlofBeschikbaarAantal * 8"/> vakantieuren</b> over hebt.</xsl:with-param>
                    <xsl:with-param name="style">standaard inline original <xsl:value-of select="$style"/></xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="labelInlineTwoValueTwoUnitTwoLines">
                    <xsl:with-param name="label">Beschikbaar aantal vakantiedagen/-uren:</xsl:with-param>
                    <xsl:with-param name="value1" select="$verlofBeschikbaarAantal"/>
                    <xsl:with-param name="unit1" select="'dagen'"/>
                    <xsl:with-param name="value2" select="$verlofBeschikbaarAantal * 8"/>
                    <xsl:with-param name="unit2" select="'uren'"/>
                    <xsl:with-param name="style">standaard inline custom <xsl:value-of select="$style"/></xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="PeriodInputHoliday">
        <xsl:param name="style"/>
        
        <table>
            <tr>
                <th>
                    <xsl:call-template name="labelValueVertical">
                        <xsl:with-param name="labels">Begindatum</xsl:with-param>
                        <xsl:with-param name="values"><input type="text" id="from" class="date" name="from"/></xsl:with-param>
                    </xsl:call-template>
                </th>
                <th>-</th>
                <th>
                    <xsl:call-template name="labelValueVertical">
                        <xsl:with-param name="labels">Einddatum</xsl:with-param>
                        <xsl:with-param name="values"><input type="text" id="to" name="to"/></xsl:with-param>
                    </xsl:call-template>
                </th>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template name="textAcceptatie">
        <xsl:param name="style"/>
        
        <p style="display:none" class="{$style}">In deze periode wordt je aanvraag direct geaccepteerd</p>
    </xsl:template>
    
    <xsl:template name="submitButtonAanvragen">
        <xsl:param name="style"/>
        
        <xsl:call-template name="submitButton">
            <xsl:with-param name="text">Aanvragen</xsl:with-param>
            <xsl:with-param name="styleId">button</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="spanForm">
        <xsl:param name="content"/>
        
        <form>
            <xsl:copy-of select="$content"/>
        </form>
    </xsl:template>
    
    <xsl:template name="spanContent">
        <xsl:param name="content"/>
        <xsl:param name="style"/>
        
        <div class="content {$style}">
            <xsl:copy-of select="$content"/>
        </div>
    </xsl:template>
    
    <xsl:template name="spanHolidayInformation">
        <xsl:param name="content"/>
        <xsl:param name="style"/>
        
        <xsl:call-template name="item">
            <xsl:with-param name="style">flex <xsl:value-of select="$style"/></xsl:with-param>
            <xsl:with-param name="content">
                <xsl:copy-of select="$content"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="rstTemplate">
        <xsl:param name="contents"/>
        <xsl:param name="id"/>
        <xsl:param name="multiplicityId"/>
        <xsl:param name="position"/>
        <xsl:param name="importance"></xsl:param>
        
        <xsl:choose>
            <xsl:when test="$id = '1'">
                <xsl:call-template name="multipleOptionsVerlofsoort">
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '2'">
                <xsl:call-template name="textLineWelcome">
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '3'">
                <xsl:call-template name="textLineTotaalVerlofdagen">
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '4'">
                <xsl:call-template name="textLineVerbruiktVerlofdagen">
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '5'">
                <xsl:call-template name="textLineBeschikbaarVerlofdagen">
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '6'">
                <xsl:call-template name="PeriodInputHoliday">
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '7'">
                <xsl:call-template name="textAcceptatie">
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '8'">
                <xsl:call-template name="submitButtonAanvragen">
                    <xsl:with-param name="style" select="$importance"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '9'">
                <xsl:call-template name="spanContent">
                    <xsl:with-param name="content" select="$contents"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '10'">
                <xsl:call-template name="spanHolidayInformation">
                    <xsl:with-param name="content" select="$contents"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$id = '11'">
                <xsl:call-template name="spanForm">
                    <xsl:with-param name="content" select="$contents"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    
</xsl:stylesheet>