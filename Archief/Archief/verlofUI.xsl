<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:UML="http://www.eclipse.org/uml2/4.0.0/UML"
    xmlns:func="http://exslt.org/functions"
    exclude-result-prefixes="xs UML func"
    version="2.0">
    <xsl:import href="genericHTML.xsl"/>
    <xsl:output method="html" />
    
    <!--    <xsl:variable name="root" select="UML:Model"/>-->
    
    <xsl:template name="verlof" match="/">
        <xsl:call-template name="genericStructure">
            <xsl:with-param name="title">Verlof</xsl:with-param>
            <xsl:with-param name="additionalHead">
                <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
                <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
                <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                <!-- https://jqueryui.com/datepicker/#date-range -->
                <script>
                    $( function() {
                    var dateFormat = "mm/dd/yy",
                    from = $( "#from" )
                    .datepicker({
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 2
                    })
                    .on( "change", function() {
                    to.datepicker( "option", "minDate", getDate( this ) );
                    }),
                    to = $( "#to" ).datepicker({
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 2
                    })
                    .on( "change", function() {
                    from.datepicker( "option", "maxDate", getDate( this ) );
                    });
                    
                    function getDate( element ) {
                    var date;
                    try {
                    date = $.datepicker.parseDate( dateFormat, element.value );
                    } catch( error ) {
                    date = null;
                    }
                    
                    return date;
                    }
                    } );
                    
                </script>
            </xsl:with-param>
            <xsl:with-param name="content">
                <xsl:call-template name="multipleOptions">
                    <xsl:with-param name="labels">Vakantie;Langdurig;Privé;Bijzonder;Kinder</xsl:with-param>
                </xsl:call-template>
                
                <xsl:call-template name="text">
                    <xsl:with-param name="content">
                        <xsl:call-template name="fullOrShortText">
                            <xsl:with-param name="fullText">
                                Hoi <xsl:value-of select="concat(concat($medewerkerVoornaam,' '), $medewerkerAchternaam)"/>, <br/>Dit jaar heb je recht op <b> <xsl:value-of select="$verlofTotaalAantal"/> vakantiedagen / <xsl:value-of select="$verlofTotaalAantal * 8"/> vakantieuren.</b>
                            </xsl:with-param>
                            <xsl:with-param name="shortText">
                                <xsl:value-of select="$verlofTotaalAantal"/> dagen / <xsl:value-of select="$verlofTotaalAantal * 8"/> uren
                            </xsl:with-param>
                            <xsl:with-param name="label">Totaal aantal vakantiedagen/-uren</xsl:with-param>
                        </xsl:call-template>
                        
                        <xsl:call-template name="fullOrShortText">
                            <xsl:with-param name="fullText">
                                Tot nu toe heb je <b> <xsl:value-of select="$verlofTotaalAantal - $verlofBeschikbaarAantal"/> vakantiedagen / 
                                    <xsl:value-of select="($verlofTotaalAantal - $verlofBeschikbaarAantal) * 8"/> vakantieuren</b> opgenomen.
                            </xsl:with-param>
                            <xsl:with-param name="label">Verbruikt aantal vakantiedagen/-uren: </xsl:with-param>
                            <xsl:with-param name="shortText">
                                <xsl:value-of select="$verlofTotaalAantal - $verlofBeschikbaarAantal"/> dagen / 
                                <xsl:value-of select="($verlofTotaalAantal - $verlofBeschikbaarAantal) * 8"/> uren
                            </xsl:with-param>
                        </xsl:call-template>
                        
                        <xsl:call-template name="fullOrShortText">
                            <xsl:with-param name="fullText">
                                Dit betekent dat je nog <b> <xsl:value-of select="$verlofBeschikbaarAantal"/> vakantiedagen / 
                                    <xsl:value-of select="$verlofBeschikbaarAantal * 8"/> vakantieuren</b> over hebt.
                            </xsl:with-param>
                            <xsl:with-param name="label">Beschikbaar aantal vakantiedagen/-uren: </xsl:with-param>
                            <xsl:with-param name="shortText">
                                <xsl:value-of select="$verlofBeschikbaarAantal"/> dagen / 
                                <xsl:value-of select="$verlofBeschikbaarAantal * 8"/> uren
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:with-param>
                </xsl:call-template>
                <form>
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
                    <!--<label for="from">From</label>
                    <input type="text" id="from" name="from"/>
                        <label for="to">to</label>
                        <input type="text" id="to" name="to"/>-->
                    <xsl:call-template name="button">
                        <xsl:with-param name="text">Aanvragen</xsl:with-param>
                        <xsl:with-param name="styleId">button</xsl:with-param>
                    </xsl:call-template>
                   <!-- <script>
                        if(document.getElementById("to").value == ""){
                        document.getElementById("button").style.display="none";
                        } if(!document.getElementById("to").value == "") {
                        document.getElementById("button").style.display="block";
                        };
                    </script>-->
                    
                </form>
                
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>