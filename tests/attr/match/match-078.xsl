<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<?spec xslt#patterns?>

<xsl:strip-space elements="*"/>
<xsl:output indent="no"/>
<xsl:template match="*">
<xsl:copy><xsl:copy-of select="@*"/><xsl:apply-templates/></xsl:copy>
</xsl:template>
<xsl:template match="COORDINATES_ITEM[position() =
    /SHAPE/ELEM_INFO/ELEM_INFO_ITEM[position() mod 3 = 1]]">
  <xsl:copy>
    <xsl:text>d</xsl:text>
    <xsl:value-of select="."/>
  </xsl:copy>
</xsl:template>

<!-- Following match pattern is legal but can't match anything. Saxon gives a warning -->

<xsl:template match="@comment()"/>
</xsl:stylesheet>
