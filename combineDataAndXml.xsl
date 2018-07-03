<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:exsl="http://exslt.org/common"
    extension-element-prefixes="exsl"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:import href="constants.xsl"/>
    <xsl:import href="csvToXml.xsl"/>
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- Identity transform -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $ID]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.ID"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $VOORNAAM]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.voornaam">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $TUSSENNAMEN]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.tussennamen"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $ACHTERNAAM]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.achternaam"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $STRAAT]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.straat"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $STRAATNUMMER]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.straatnummer"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $WOONPLAATS]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.woonplaats"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $POSTCODE]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.postcode"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $GEBOORTEDATUM]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.geboortedatum"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $GESLACHT]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.geslacht"/></value>
        <xsl:copy-of select="."/>
    </xsl:template> 
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $BSN]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.bsn"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $BURGERLIJKESTAAT]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.burgerlijkeStaat"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $IDENTIFICATIE]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.identificatie"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $TELEFOONNUMMERWERK]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.telefoonnummerWerk"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $TELEFOONNUMMERPRIVE]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.telefoonnummerPrive"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $MAILADRESSWERK]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.mailadressWerk"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $MAILADRESSPRIVE]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.mailadressPrive"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $NAAMPARTNER]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.naamPartner"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $NAAMKINDEREN]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.naamKinderen"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $IBAN]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.IBAN"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $FOTO]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.foto"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $TYPE]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.type"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $STATUS]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.status"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $EMOLUMENTEN]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.emolumenten"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $TYPECONTRACT]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.typeContract"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $AANTALCONTACTUREN]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.aantalContacturen"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $DATUMINDIENST]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.datumInDienst"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $DATUMINFUNCTIE]/*">
        <value><xsl:value-of select="$csv2xml/data/Medewerker.datumInFunctie"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="packagedElement[@name = $TEAM]/ownedAttribute[@name = $NAAM]/*">
        <value><xsl:value-of select="$csv2xml/data/Team.naam"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="packagedElement[@name = $TEAM]/ownedAttribute[@name = $ID]/*">
        <value><xsl:value-of select="$csv2xml/data/Team.ID"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $FUNCTIE]/ownedAttribute[@name = $NAAM]/*">
        <value><xsl:value-of select="$csv2xml/data/Functie.naam"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $FUNCTIE]/ownedAttribute[@name = $NIVEAU]/*">
        <value><xsl:value-of select="$csv2xml/data/Functie.niveau"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $ROL]/ownedAttribute[@name = $NAAM]/*">
        <value><xsl:value-of select="$csv2xml/data/Rol.naam"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="packagedElement[@name = $TEAMBEZETTING]/ownedAttribute[@name = $DATUMBEGIN]/*">
        <value><xsl:value-of select="$csv2xml/data/Teambezetting.datumBegin"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $TEAMBEZETTING]/ownedAttribute[@name = $DATUMEINDE]/*">
        <value><xsl:value-of select="$csv2xml/data/Teambezetting.datumEinde"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    

    <xsl:template match="packagedElement[@name = $TEAMBEZETTING]/ownedAttribute[@name = $MINIMALEBEZETTING]/*">
        <value><xsl:value-of select="$csv2xml/data/Teambezetting.minimaleBezetting"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $TEAMBEZETTING]/ownedAttribute[@name = $BUFFER]/*">
        <value><xsl:value-of select="$csv2xml/data/Teambezetting.buffer"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $VERLOFDAGEN]/ownedAttribute[@name = $TOTAALAANTAL]/*">
        <value><xsl:value-of select="$csv2xml/data/Verlofdagen.totaalAantal"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $VERLOFDAGEN]/ownedAttribute[@name = $TOTAALBESCHIKBAAR]/*">
        <value><xsl:value-of select="$csv2xml/data/Verlofdagen.beschikbaarAantal"/></value>
        <xsl:copy-of select="."/>
    </xsl:template>

</xsl:stylesheet>