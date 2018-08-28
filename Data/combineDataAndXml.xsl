<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:exsl="http://exslt.org/common"
    extension-element-prefixes="exsl"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:import href="../constants.xsl"/>
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
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $VOORNAAM]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.voornaam">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $TUSSENNAMEN]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.tussennamen">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $ACHTERNAAM]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.achternaam">
           <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
       </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $STRAAT]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.straat">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $STRAATNUMMER]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.straatnummer">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $WOONPLAATS]/*">
        
        <xsl:for-each select="$csv2xml/data/Medewerker.woonplaats">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $POSTCODE]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.postcode">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $GEBOORTEDATUM]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.geboortedatum">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $GESLACHT]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.geslacht">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template> 
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $BSN]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.bsn">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $BURGERLIJKESTAAT]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.burgerlijkeStaat">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $IDENTIFICATIE]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.identificatie">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $TELEFOONNUMMERWERK]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.telefoonnummerWerk">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $TELEFOONNUMMERPRIVE]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.telefoonnummerPrive">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $MAILADRESSWERK]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.mailadressWerk">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $MAILADRESSPRIVE]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.mailadressPrive">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $NAAMPARTNER]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.naamPartner">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $NAAMKINDEREN]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.naamKinderen">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $IBAN]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.IBAN">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $FOTO]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.foto">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $TYPE]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.type">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $STATUS]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.status">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $EMOLUMENTEN]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.emolumenten">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $TYPECONTRACT]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.typeContract">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $AANTALCONTACTUREN]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.aantalContacturen">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $DATUMINDIENST]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.datumInDienst">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $MEDEWERKER]/ownedAttribute[@name = $DATUMINFUNCTIE]/*">
        <xsl:for-each select="$csv2xml/data/Medewerker.datumInFunctie">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="packagedElement[@name = $TEAM]/ownedAttribute[@name = $NAAM]/*">
        <xsl:for-each select="$csv2xml/data/Team.naam">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="packagedElement[@name = $TEAM]/ownedAttribute[@name = $ID]/*">
        <xsl:for-each select="$csv2xml/data/Team.ID">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $FUNCTIE]/ownedAttribute[@name = $NAAM]/*">
        <xsl:for-each select="$csv2xml/data/Functie.naam">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $FUNCTIE]/ownedAttribute[@name = $NIVEAU]/*">
        <xsl:for-each select="$csv2xml/data/Functie.niveau">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $ROL]/ownedAttribute[@name = $NAAM]/*">
        <xsl:for-each select="$csv2xml/data/Rol.naam">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="packagedElement[@name = $TEAMBEZETTING]/ownedAttribute[@name = $DATUMBEGIN]/*">
        <xsl:for-each select="$csv2xml/data/Teambezetting.datumBegin">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $TEAMBEZETTING]/ownedAttribute[@name = $DATUMEINDE]/*">
        <xsl:for-each select="$csv2xml/data/Teambezetting.datumEinde">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    

    <xsl:template match="packagedElement[@name = $TEAMBEZETTING]/ownedAttribute[@name = $MINIMALEBEZETTING]/*">
        <xsl:for-each select="$csv2xml/data/Teambezetting.minimaleBezetting">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $TEAMBEZETTING]/ownedAttribute[@name = $BUFFER]/*">
        <xsl:for-each select="$csv2xml/data/Teambezetting.buffer">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $VERLOFDAGEN]/ownedAttribute[@name = $TOTAALAANTAL]/*">
        <xsl:for-each select="$csv2xml/data/Verlofdagen.totaalAantal">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = $VERLOFDAGEN]/ownedAttribute[@name = $TOTAALBESCHIKBAAR]/*">
        <xsl:for-each select="$csv2xml/data/Verlofdagen.beschikbaarAantal">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = 'Categorie']/ownedAttribute[@name = $NAAM]/*">
        <xsl:for-each select="$csv2xml/data/Categorie.naam">
            <xsl:if test=". != ''">
                <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="packagedElement[@name = 'Categorie']/ownedAttribute[@name = 'samenvatting']/*">
        <xsl:for-each select="$csv2xml/data/Categorie.samenvatting">
            <xsl:if test=". != ''">
                <value><xsl:value-of select="."/></value>
            </xsl:if>
        </xsl:for-each>
        <xsl:copy-of select="."/>
    </xsl:template>

</xsl:stylesheet>