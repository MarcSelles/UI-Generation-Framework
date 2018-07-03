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
    
    <xsl:variable name="medewerkerVoornaam" select="func:getValue($MEDEWERKER, $VOORNAAM)"/>
    <xsl:variable name="medewerkerGeboortedatum" select="func:formatDate(func:getValue($MEDEWERKER, $GEBOORTEDATUM))"/>
    <xsl:variable name="medewerkerAchternaam" select="func:getValue($MEDEWERKER, $ACHTERNAAM)"/>
    <xsl:variable name="medewerkerFoto" select="func:getValue($MEDEWERKER, $FOTO)"/>
    <xsl:variable name="medewerkerContactUren" select="func:getValue($MEDEWERKER, $AANTALCONTACTUREN)"/>
    
    <xsl:variable name="functieNaam" select="func:getValue($FUNCTIE, $NAAM)"/>
    <xsl:variable name="functieNiveau" select="func:getValue($FUNCTIE, $NIVEAU)"/>
    
    <xsl:variable name="rolNaam" select="func:getValue($ROL, $NAAM)"/>
    
    <xsl:variable name="teamNaam" select="func:getValue($TEAM, $NAAM)"/>
    
    <xsl:variable name="teamBezettingBeginDatum" select="func:getValue($TEAMBEZETTING, $DATUMBEGIN)"/>
    <xsl:variable name="teamBezettingEindDatum" select="func:getValue($TEAMBEZETTING, $DATUMEINDE)"/>
    <xsl:variable name="teamBezettingMin" select="func:getValue($TEAMBEZETTING, $MINIMALEBEZETTING)"/>
    <xsl:variable name="teamBezettingBuffer" select="func:getValue($TEAMBEZETTING, $BUFFER)"/>
    
    <xsl:variable name="verlofTotaalAantal" select="func:getValue($VERLOFDAGEN, $TOTAALAANTAL)"/>
    <xsl:variable name="verlofBeschikbaarAantal" select="func:getValue($VERLOFDAGEN, $TOTAALBESCHIKBAAR)"/>
    
</xsl:stylesheet>