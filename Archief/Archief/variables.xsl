<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:exsl="http://exslt.org/common"
    xmlns:UML="http://www.eclipse.org/uml2/4.0.0/UML"
    xmlns:func="http://exslt.org/functions"
    exclude-result-prefixes="xs UML func"
    version="2.0">
    <xsl:import href="functions.xsl"/>
    <xsl:import href="constants.xsl"/>

    <xsl:variable name="elementRoot" select="//packagedElement"/>
    
    <xsl:variable name="medewerkerVoornaam" select="func:getValue($MEDEWERKER, $VOORNAAM,2)"/>
    <xsl:variable name="medewerkerGeboortedatum" select="func:formatDate(func:getValue($MEDEWERKER, $GEBOORTEDATUM,1))"/>
    <xsl:variable name="medewerkerAchternaam" select="func:getValue($MEDEWERKER, $ACHTERNAAM,1)"/>
    <xsl:variable name="medewerkerFoto" select="func:getValue($MEDEWERKER, $FOTO,1)"/>
    <xsl:variable name="medewerkerContactUren" select="func:getValue($MEDEWERKER, $AANTALCONTACTUREN,1)"/>
    
    <xsl:variable name="functieNaam" select="func:getValue($FUNCTIE, $NAAM,1)"/>
    <xsl:variable name="functieNiveau" select="func:getValue($FUNCTIE, $NIVEAU,1)"/>
    
    <xsl:variable name="rolNaam" select="func:getValue($ROL, $NAAM,1)"/>
    
    <xsl:variable name="teamNaam" select="func:getValue($TEAM, $NAAM,1)"/>
    
    <xsl:variable name="teamBezettingBeginDatum" select="func:getValue($TEAMBEZETTING, $DATUMBEGIN,1)"/>
    <xsl:variable name="teamBezettingEindDatum" select="func:getValue($TEAMBEZETTING, $DATUMEINDE,1)"/>
    <xsl:variable name="teamBezettingMin" select="func:getValue($TEAMBEZETTING, $MINIMALEBEZETTING,1)"/>
    <xsl:variable name="teamBezettingBuffer" select="func:getValue($TEAMBEZETTING, $BUFFER,1)"/>
    
    <xsl:variable name="verlofTotaalAantal" select="func:getValue($VERLOFDAGEN, $TOTAALAANTAL,1)"/>
    <xsl:variable name="verlofBeschikbaarAantal" select="func:getValue($VERLOFDAGEN, $TOTAALBESCHIKBAAR,1)"/>
    
</xsl:stylesheet>