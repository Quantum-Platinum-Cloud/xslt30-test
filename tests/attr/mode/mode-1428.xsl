<?xml version="1.0"?>

<!-- mode-onnomatch017s -->
<!-- Michael Kay -->
<!-- on-no-match="text-only-copy, with warnings, with streaming --> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs">
 
  <xsl:mode name="s" on-no-match="text-only-copy" warning-on-no-match="yes" streamable="yes"/>
  
  <xsl:template match="/" mode="s">
    <xsl:message>** Expect no-matching-template warnings **</xsl:message>
    <xsl:apply-imports/>
  </xsl:template>
  
  <xsl:template match="*" mode="s">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
   
</xsl:stylesheet>