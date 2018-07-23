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
        <xsl:for-each select="$csv2xml/data/Medewerker.ID">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $VOORNAAM]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.voornaam">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $TUSSENNAMEN]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.tussennamen">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $ACHTERNAAM]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.achternaam">
           <value><xsl:value-of select="."/></value>
       </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $STRAAT]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.straat">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $STRAATNUMMER]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.straatnummer">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $WOONPLAATS]/*">
        
        <xsl:for-each select="$csv2xml/data/Medewerker.woonplaats">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $POSTCODE]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.postcode">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $GEBOORTEDATUM]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.geboortedatum">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $GESLACHT]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.geslacht">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template> 
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $BSN]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.bsn">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $BURGERLIJKESTAAT]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.burgerlijkeStaat">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $IDENTIFICATIE]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.identificatie">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $TELEFOONNUMMERWERK]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.telefoonnummerWerk">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $TELEFOONNUMMERPRIVE]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.telefoonnummerPrive">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $MAILADRESSWERK]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.mailadressWerk">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $MAILADRESSPRIVE]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.mailadressPrive">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $NAAMPARTNER]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.naamPartner">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $NAAMKINDEREN]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.naamKinderen">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $IBAN]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.IBAN">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $FOTO]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.foto">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $TYPE]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.type">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $STATUS]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.status">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $EMOLUMENTEN]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.emolumenten">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $TYPECONTRACT]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.typeContract">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $AANTALCONTACTUREN]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.aantalContacturen">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $DATUMINDIENST]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.datumInDienst">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $DATUMINFUNCTIE]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.datumInFunctie">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="packagedElement[@name = $TEAM]/ownedAttribute[@name = $NAAM]/*">
        <xsl:for-each select="$csv2xml/data/Team.naam">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="packagedElement[@name = $TEAM]/ownedAttribute[@name = $ID]/*">
        <xsl:for-each select="$csv2xml/data/Team.ID">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $FUNCTIE]/ownedAttribute[@name = $NAAM]/*">
        <xsl:for-each select="$csv2xml/data/Functie.naam">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $FUNCTIE]/ownedAttribute[@name = $NIVEAU]/*">
        <xsl:for-each select="$csv2xml/data/Functie.niveau">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $ROL]/ownedAttribute[@name = $NAAM]/*">
        <xsl:for-each select="$csv2xml/data/Rol.naam">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="packagedElement[@name = $TEAMBEZETTING]/ownedAttribute[@name = $DATUMBEGIN]/*">
        <xsl:for-each select="$csv2xml/data/Teambezetting.datumBegin">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $TEAMBEZETTING]/ownedAttribute[@name = $DATUMEINDE]/*">
        <xsl:for-each select="$csv2xml/data/Teambezetting.datumEinde">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    

    <xsl:template match="packagedElement[@name = $TEAMBEZETTING]/ownedAttribute[@name = $MINIMALEBEZETTING]/*">
        <xsl:for-each select="$csv2xml/data/Teambezetting.minimaleBezetting">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $TEAMBEZETTING]/ownedAttribute[@name = $BUFFER]/*">
        <xsl:for-each select="$csv2xml/data/Teambezetting.buffer">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $VERLOFDAGEN]/ownedAttribute[@name = $TOTAALAANTAL]/*">
        <xsl:for-each select="$csv2xml/data/Verlofdagen.totaalAantal">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $VERLOFDAGEN]/ownedAttribute[@name = $TOTAALBESCHIKBAAR]/*">
        <xsl:for-each select="$csv2xml/data/Verlofdagen.beschikbaarAantal">
            <value><xsl:value-of select="."/></value>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>

</xsl:stylesheet>