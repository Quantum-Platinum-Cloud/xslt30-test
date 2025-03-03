<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:g="http://www.w3.org/xsl-tests/grouped-transactions"
    exclude-result-prefixes="g"
    version="3.0">
       
  
    <!-- within a streaming template, compute total of an empty sequence of attribute values -->
     
    <xsl:mode streamable="yes"/>
         
    <xsl:output method="xml" indent="yes" encoding="UTF-8" />
    
  <xsl:import-schema namespace="http://www.w3.org/xsl-tests/grouped-transactions" schema-location="grouped-transactions.xsd"/>
  
    <xsl:strip-space elements="*"/>
      
    <xsl:template name="main">
      <out>
        <xsl:source-document streamable="true" href="grouped-transactions.xml" validation="strict">
          <xsl:apply-templates select="."/>
        </xsl:source-document>
      </out>
    </xsl:template>
     
    <xsl:template match="*">
      <xsl:copy>
        <xsl:copy-of select="@*"/>
        <xsl:apply-templates/>
      </xsl:copy>
    </xsl:template>
    
    <xsl:template match="g:account">
      <account total="{sum(g:transaction/@balance, -12345)}"/>
    </xsl:template>
      
</xsl:transform>

