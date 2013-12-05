<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="insertion" as="element()*">
      <a>A</a>
      <b>B</b>
    </xsl:variable>
    
    <xsl:variable name="numeric-insertion" as="element()*">
      <a>99.0</a>
      <b>98.0</b>
    </xsl:variable>
    
    <!-- Streaming insert-before(): grounded operand -->
    
    <xsl:template name="r-001" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="insert-before(data(/BOOKLIST/BOOKS/ITEM/PRICE), 2, $insertion)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): grounded operand -->
    
    <xsl:template name="r-002" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="insert-before(copy-of(/BOOKLIST/BOOKS/ITEM/PRICE), 2, $insertion)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): grounded atomic operand -->
    
    <xsl:template name="r-003" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="/BOOKLIST/BOOKS/ITEM/DIMENSIONS ! insert-before(tokenize(., ' '), 2, $insertion)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): striding operand, inspection usage -->
    
    <xsl:template name="r-010" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="count(insert-before(/BOOKLIST/BOOKS/ITEM/PRICE, 2, $insertion))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): striding operand, absorption usage -->
    
    <xsl:template name="r-011" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="sum(insert-before(/BOOKLIST/BOOKS/ITEM/PRICE, 2, $insertion))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): striding operand, transmission usage -->
    
    <xsl:template name="r-012" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="insert-before(/BOOKLIST/BOOKS/ITEM/PRICE, 2, $insertion)[position() mod 2 = 0]"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): striding operand, focus-setting usage -->
    
    <xsl:template name="r-013" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="insert-before(/BOOKLIST/BOOKS/ITEM/PRICE, 2, $numeric-insertion) ! (.+1)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): striding operand, focus-controlled usage -->
    
    <xsl:template name="r-014" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="/BOOKLIST/BOOKS/ITEM[1] ! insert-before(*, 2, $insertion)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): striding operand, focus-setting usage -->
    
    <xsl:template name="r-015" use-when="true() or $RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:for-each select="insert-before(/BOOKLIST/BOOKS/ITEM/PRICE, 2, $numeric-insertion)">
            <xsl:value-of select=".+1 || ' '"/>
          </xsl:for-each>  
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): striding operand, focus-controlled usage -->
    
    <xsl:template name="r-016" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:for-each select="/BOOKLIST/BOOKS/ITEM[1]">
            <xsl:copy-of select="insert-before(*, 2, $insertion)"/>
          </xsl:for-each>  
        </out>
      </xsl:stream>
    </xsl:template>    
    
    <!-- Streaming insert-before(): striding operand, focus-setting usage for inspection action -->
    
    <xsl:template name="r-017" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="insert-before(/BOOKLIST/BOOKS/ITEM[1]/*, 2, $insertion) ! contains(name(), 'E')"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): striding operand, apply-templates usage -->
    
    <xsl:template name="r-018" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:apply-templates select="insert-before(/BOOKLIST/BOOKS/ITEM[1]/*, 2, $insertion)" mode="r-018-mode"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <xsl:mode name="r-018-mode" streamable="yes" on-no-match="deep-skip"/>
    <xsl:template match="ITEM/*" mode="r-018-mode"><xsl:value-of select="."/></xsl:template>
    <xsl:template match="a|b" mode="r-018-mode">(<xsl:value-of select="."/>)</xsl:template>
    
    <!-- Streaming insert-before(): crawling operand, inspection usage -->
    
    <xsl:template name="r-020" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="count(insert-before(//PRICE, 2, $insertion))"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- Streaming insert-before(): crawling operand, absorption usage -->
    
    <xsl:template name="r-021" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="count(insert-before(/BOOKLIST/BOOKS/ITEM[1]//text(), 2, $insertion))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): crawling operand, transmission usage -->
    
    <xsl:template name="r-022" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="insert-before(/BOOKLIST/BOOKS/ITEM[1]//text(), 2, $insertion)[position() lt 4]"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): crawling operand, focus-setting usage -->
    
    <xsl:template name="r-023" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="insert-before(//PRICE/text(), 2, $numeric-insertion) ! (.+1)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): climbing operand, inspection usage -->
    
    <xsl:template name="r-030" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="insert-before(/BOOKLIST/BOOKS/ITEM[1]/PRICE/ancestor::*, 2, $insertion) ! name()"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): climbing operand, inspection usage, removal of duplicates -->
    
    <xsl:template name="r-031" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="insert-before(/BOOKLIST/BOOKS/ITEM/PRICE/ancestor::*, 2, $insertion) ! name()"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): climbing operand, absorption usage -->
    
    <xsl:template name="r-032" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="insert-before(/BOOKLIST/BOOKS/ITEM[1]/PRICE/ancestor::*/data(@*), 2, $insertion)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): climbing operand, absorption usage -->
    
    <xsl:template name="r-033" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="insert-before(/BOOKLIST/BOOKS/ITEM/ancestor-or-self::*/data(@CAT), 2, $insertion)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): climbing operand, absorption usage, removal of duplicates -->
    
    <xsl:template name="r-034" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="insert-before(/BOOKLIST/BOOKS/ITEM/PRICE/ancestor-or-self::*/data(@CAT), 2, $insertion)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming insert-before(): climbing operand, absorption usage, removal of duplicates -->
    
    <xsl:template name="r-035" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="insert-before(//PRICE/ancestor-or-self::*/data(@*), 2, $insertion)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>               
    
</xsl:stylesheet>