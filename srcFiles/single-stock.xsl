<?xml version="1.0"?>
<!-- edited with XMLSPY v5 rel. 4 U (http://www.xmlspy.com) by NAVROZ MEDHORA (FIRST FINANCIAL CHORPORATION) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<HTML>
			<HEAD>
				<STYLE>
		          BODY {margin:0}
		          .bg {font:8pt Verdana; background-color:purple; color:white}
		          H1 {font:bold 14pt Verdana; width:100%; margin-top:1em}
		          .row {font:8pt Verdana; border-bottom:1px solid #CC88CC}
		          .header {font:bold 9pt Verdana; cursor:hand; padding:2px; border:2px outset gray}
		          .up {background-color:#DDFFDD;}
		          .down {background-color:#FFDDDD;}
		        </STYLE>
			</HEAD>
			<TITLE><xsl:value-of select="portfolio/description"/></TITLE>
			
		<!--<SCRIPT><xsl:comment><![CDATA[
        function sort(field)
        {
          sortField.value = field;
          
          listing.innerHTML = source.documentElement.transformNode(stylesheet);
        }
       ]]></xsl:comment></SCRIPT> 
       
       <SCRIPT for="window" event="onload"><xsl:comment><![CDATA[
        stylesheet = document.XSLDocument;
        source = document.XMLDocument;
        sortField = document.XSLDocument.selectSingleNode("//@order-by");
      ]]></xsl:comment></SCRIPT> -->
       
       
			<BODY>
				<TABLE width="100%" cellspacing="0">
					<TR>
						<TD class="bg"/>
						<TD class="bg">
							<!--<H1>
								<xsl:value-of select="portfolio/description"/>
								
								Stock info for <xsl:apply-templates select="portfolio/stock/name"/>
                for <xsl:apply-templates select="portfolio/date"/>
							</H1>-->
						<!--	<DIV> Total Number of Stocks in Portfolio:   <B>
									<xsl:value-of select="count(.//stock)"/>
								</B>
							</DIV>
							<DIV>Average change: <B>
									<xsl:value-of select="format-number(sum(.//percent) div count(.//stock), 0.00)"/>
								</B>
							</DIV>
							<DIV>Total volume: <B>
									<xsl:value-of select="sum(.//volume)"/>
								</B>
							</DIV>-->
						</TD>
					</TR>
					<TR>
						<TD class="bg" width="120" valign="top">							
							<P>Stocks losing more than 5% indicated in red.  Stocks gaining
              				value indicated in green.</P>
						</TD>
						<TD class="bg" valign="top">
							<DIV id="listing">
								<xsl:apply-templates select="portfolio"/>
							</DIV>
						</TD>
					</TR>
				</TABLE>
			</BODY>
		</HTML>
	</xsl:template>
	
	
	<xsl:template match="portfolio">
		<TABLE STYLE="background-color:white">
			<THEAD>
				<TD width="200">
					<DIV class="header">Company</DIV>
				</TD>
				<TD width="80">
					<DIV class="header">Symbol</DIV>
				</TD>
				<TD width="80">
					<DIV class="header">Price</DIV>
				</TD>
				<TD width="80">
					<DIV class="header">Change</DIV>
				</TD>
				<TD width="80">
					<DIV class="header">%Change</DIV>
				</TD>
				<TD width="80">
					<DIV class="header">Volume</DIV>
				</TD>
			</THEAD>
			<xsl:for-each select="stock"> 
				<TR>
					<xsl:for-each select="change">
						<xsl:if test=". &gt; 0">
							<xsl:attribute name="class">up</xsl:attribute>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="percent">
						<xsl:if test=". &lt; -5">
							<xsl:attribute name="class">down</xsl:attribute>
						</xsl:if>
					</xsl:for-each>
					<TD>
						<DIV class="row">
							<xsl:value-of select="name"/>
						</DIV>
					</TD>
					<TD>
						<DIV class="row">
							<xsl:value-of select="symbol"/>
						</DIV>
					</TD>
					<TD>
						<DIV class="row" STYLE="text-align:center">
							<xsl:apply-templates select="price"/>
						</DIV>
					</TD>
					<TD>
						<DIV class="row" STYLE="text-align:center">
							<xsl:apply-templates select="change"/>
						</DIV>
					</TD>
					<TD>
						<DIV class="row" STYLE="text-align:center">
							<xsl:apply-templates select="percent"/>
						</DIV>
					</TD>
					<TD>
						<DIV class="row" STYLE="text-align:center">
							<xsl:apply-templates select="volume"/>
						</DIV>
					</TD>
				</TR>
			</xsl:for-each>
			
			<form  	name="individualStockForm" 
					action="/servlet/Stocks_XMLApplication.MainStockXMLServlet"
					method="post">
				<tr><td>Edit updates or delete
				</td></tr>
				<xsl:for-each select="stock">
				<tr>
					<td>
						<input type="text" name="companyName">
							<xsl:attribute name="value">
								<xsl:value-of select="name"/>
							</xsl:attribute>
						</input>
					</td>
					<td>
						<input name="symbol">
							<xsl:attribute name="value">	
								<xsl:value-of select="symbol"/>
							</xsl:attribute>
						</input>
					</td>
					<td>
						<input type="text" name="stockPrice">
							<xsl:attribute name="value">
								<xsl:value-of select="price"/>
							</xsl:attribute>
						</input>
					</td>
					
					<td>
						<input type="text" name="stockPriceChange">
							<xsl:attribute name="value">
								<xsl:value-of select="change"/>
							</xsl:attribute>
						</input>
					</td>
					
					<td>
						<input type="text" name="stockPricePercentChange">
							<xsl:attribute name="value">
								<xsl:value-of select="percent"/>
							</xsl:attribute>
						</input>
					</td>
					
					<td>
						<input type="text" name="stockVolume">
							<xsl:attribute name="value">
								<xsl:value-of select="volume"/>
							</xsl:attribute>
						</input>
					</td>
				</tr>
				</xsl:for-each>
				<tr>
					<td>
						<input type="submit" name="button" value="UPDATE"/>
						<input type="submit" name="button" value="DELETE STOCK"/>					
					</td> 
				</tr>
				</form>
		</TABLE>
	</xsl:template>
	<xsl:template match="price | change">
		<xsl:value-of select="format-number(., '$0.00')"/><!--this.nodeTypedValue-->
	</xsl:template>
	<xsl:template match="percent">
		<xsl:if test=". &gt; 0">+</xsl:if><!--this.nodeTypedValue-->
		<xsl:value-of select="format-number(., '0.0')"/>%<!--this.nodeTypedValue-->
		
  </xsl:template>
	<xsl:template match="volume">
		<xsl:value-of select="format-number(., '#,###,###')"/><!-- * 1000000-->
	</xsl:template>
	
	<xsl:template match="name">
		<xsl:value-of select="name"/>
	</xsl:template>
</xsl:stylesheet>
