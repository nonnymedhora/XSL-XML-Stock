<?xml version="1.0" standalone="no"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

	<svg width="1350" height="800">	
	
		<!-- Heading -->
		<text style="font-size:18; text-anchor:middle" x="550" y="20">Companies
		</text>
		<text style="font-weight:bold; fill:red; font-family:Arial; font-size:20;" x="20" y="20">
			<xsl:value-of select="/portfolio/description"/>
		</text>
		
		
		<!--Caption (Vertical)-->
		<g transform="translate(40, 100) rotate(270, 0, 0)">
			<text x="-220" y="5" text-anchor="middle" font-weight="bolder" font-size="16" fill="blue" font-face="arial">
				Stocks (Company Symbol)
			</text>
		</g>
		<!--Caption (Horizontal)-->
		<text x="190" y="740" font-size="16" font-weight="bolder" fill="black" font-face="arial">
				Price ($ USD)
		</text>
		
		
		<!-- Create X and Y axis --> 
		<g style="stroke-width:3; stroke:black">
			<line x1="120" y1="700" x2="1350" y2="700"/>
			<line x1="120" y1="700" x2="120" y2="30"/>
		</g>
		
		
		<!-- draw price scale-->
		<text x="220" y="720" font-size="10" fill="black" font-face="arial">10</text>
		<text x="320" y="720" font-size="10" fill="black" font-face="arial">20</text>
		<text x="420" y="720" font-size="10" fill="black" font-face="arial">30</text>
		<text x="520" y="720" font-size="10" fill="black" font-face="arial">40</text>
		<text x="620" y="720" font-size="10" fill="black" font-face="arial">50</text>
		<text x="720" y="720" font-size="10" fill="black" font-face="arial">60</text>
		<text x="820" y="720" font-size="10" fill="black" font-face="arial">70</text>
		<text x="920" y="720" font-size="10" fill="black" font-face="arial">80</text>
		<text x="1020" y="720" font-size="10" fill="black" font-face="arial">90</text>
		<text x="1120" y="720" font-size="10" fill="black" font-face="arial">100</text>
		<text x="1220" y="720" font-size="10" fill="black" font-face="arial">110</text>
		
		
		<xsl:apply-templates select="portfolio"/>
	
	</svg>
</xsl:template>
	
	
	<xsl:template match="portfolio">
	<!-- draw each bar -->
	<xsl:for-each select="stock">
	<xsl:sort select="name" order="ascending" />
	<xsl:variable name="ysplace" select="position() + 1"/>		
		<xsl:choose>
			<xsl:when test="(position() mod 2) = 0">
				<rect stroke-width="1" stroke="black" height="5" fill="red" x="120">
					<xsl:attribute name="y"><xsl:value-of select="$ysplace * 15 + 50"/></xsl:attribute>
					<xsl:attribute name="width"><xsl:value-of select="price * 10"/></xsl:attribute>
				</rect>
				<text font-size="10" fill="black" font-weight="bold" font-face="arial">
					<xsl:attribute name="x"><xsl:value-of select="price * 10 + 125"/></xsl:attribute>
					<xsl:attribute name="y"><xsl:value-of select="$ysplace * 15 + 50 + 5"/></xsl:attribute>
					<xsl:apply-templates select="price"/>
				</text>
				<text x="70" font-size="12" fill="black" font-weight="bold" font-face="arial">
					<xsl:attribute name="y"><xsl:value-of select="$ysplace * 15 + 50 + 5"/></xsl:attribute>
					<xsl:value-of select="symbol"/>
				</text>
			</xsl:when>
			<xsl:otherwise>
				<rect stroke-width="1" stroke="black" height="5" fill="blue" x="120">
					<xsl:attribute name="y"><xsl:value-of select="$ysplace * 15 + 50"/></xsl:attribute>
					<xsl:attribute name="width"><xsl:value-of select="price * 10"/></xsl:attribute>
				</rect>
				<text font-size="10" fill="black" font-weight="bold" font-face="arial">
					<xsl:attribute name="x"><xsl:value-of select="price * 10 + 125"/></xsl:attribute>
					<xsl:attribute name="y"><xsl:value-of select="$ysplace * 15 + 50 + 5"/></xsl:attribute>
					<xsl:apply-templates select="price"/>
				</text>
				<text x="70" font-size="12" fill="black" font-weight="bold" font-face="arial">
					<xsl:attribute name="y"><xsl:value-of select="$ysplace * 15 + 50 + 5"/></xsl:attribute>
					<xsl:value-of select="symbol"/>
				</text>
			</xsl:otherwise>
		</xsl:choose>		
	</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="price">
		<xsl:value-of select="format-number(., '$0.00')"/>
	</xsl:template>
	
</xsl:stylesheet>