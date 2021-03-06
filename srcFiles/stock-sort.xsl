<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:param name="column" select="'name'" />
<xsl:param name="name" select="''" />

	<xsl:template match="*|@*">			
	 	<xsl:copy>
	 		<xsl:apply-templates select="@* | * | comment() | processing-instruction() | text()"/>
	 	</xsl:copy>
	</xsl:template>
	
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
				<!--<script language="JavaScript1.2">
					<xsl:comment>
						<xsl:call-template name="dosort"/>
						<xsl:text>//</xsl:text>
					</xsl:comment>
				</script>-->
				
				<!--
				<script type="text/javascript" language="javascript">
				<![CDATA[
					function dosort(field)
        			{
          				sortField.value = field;          
          				listing.innerHTML = source.documentElement.transformNode(stylesheet);
        			}
        			
        			stylesheet = document.XSLDocument;
        			source = document.XMLDocument;
        			sortField = document.XSLDocument.selectSingleNode("//@order-by");
      			]]>
				</script>-->
				
				
			</HEAD>
			
<!--			
			<xsl:text><![CDATA[
        function dosort(field)
        {
          sortField.value = field;
          
          listing.innerHTML = source.documentElement.transformNode(stylesheet);
        }
      ]]></xsl:text>
       
       <xsl:text><![CDATA[
        stylesheet = document.XSLDocument;
        source = document.XMLDocument;
        sortField = document.XSLDocument.selectSingleNode("//@order-by");
      ]]></xsl:text>
-->       
			
			
	<!--		
		<SCRIPT language="JavaScript"><xsl:text><![CDATA[
        function dosort(field)
        {
          sortField.value = field;
          
          listing.innerHTML = source.documentElement.transformNode(stylesheet);
        }
       ]]></xsl:text></SCRIPT> 
       
       <SCRIPT  language="JavaScript" for="window" event="onload"><xsl:text><![CDATA[
        stylesheet = document.XSLDocument;
        source = document.XMLDocument;
        sortField = document.XSLDocument.selectSingleNode("//@order-by");
      ]]></xsl:text></SCRIPT> 
       -->
       
			<BODY>
				<form  	name="individualStockForm" 
						action="/servlet/Stocks_XMLApplication.MainStockXMLServlet"
						method="post">
					
					<input type="submit" name="changeStyle" value="Normal View"/>
					<input type="submit" name="changeStyle" value="Sorting View"/>
					<input type="submit" name="changeStyle" value="Graphic View"/>
				</form>
				<TABLE width="100%" cellspacing="0">
					<TR>
						<TD class="bg"/>
						<TD class="bg">
							<H1>
								<xsl:value-of select="portfolio/description"/>
                <!--for <xsl:apply-templates select="portfolio/date"/>-->
							</H1>
							<DIV> Total Number of Stocks in Portfolio:   <B>
									<xsl:value-of select="count(.//stock)"/>
								</B>
							</DIV>
							<DIV>Average change: <B>
									<xsl:value-of select="format-number(sum(.//percent) div count(.//stock), 0.00)"/> %
								</B>
							</DIV>
							<DIV>Total volume: <B>
									<xsl:value-of select="sum(.//volume)"/> shares
								</B>
							</DIV>
						</TD>
					</TR>
					<TR>
						<TD class="bg" width="120" valign="top">
							<P>Click on the column headers to sort by that field.</P>
							
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
					<DIV class="header" onClick="dosort('name')">Company</DIV>
				</TD>
				<TD width="80">
					<DIV class="header" onClick="dosort('symbol')">Symbol</DIV>
				</TD>
				<TD width="80">
					<DIV class="header" onClick="dosort('price')">Price</DIV>
				</TD>
				<TD width="80">
					<DIV class="header" onClick="dosort('change')">Change</DIV>
				</TD>
				<TD width="80">
					<DIV class="header" onClick="dosort('percent')">%Change</DIV>
				</TD>
				<TD width="80">
					<DIV class="header" onClick="dosort('volume')">Volume</DIV>
				</TD>
			</THEAD>
			<xsl:for-each select="stock"><!-- order-by="symbol">-->
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
						<DIV class="row" STYLE="text-align:right">
							<xsl:apply-templates select="price"/>
						</DIV>
					</TD>
					<TD>
						<DIV class="row" STYLE="text-align:right">
							<xsl:apply-templates select="change"/>
						</DIV>
					</TD>
					<TD>
						<DIV class="row" STYLE="text-align:right">
							<xsl:apply-templates select="percent"/>
						</DIV>
					</TD>
					<TD>
						<DIV class="row" STYLE="text-align:right">
							<xsl:apply-templates select="volume"/>
						</DIV>
					</TD>
				</TR>
			</xsl:for-each>
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
		<xsl:value-of select="format-number(., '#,###,###')"/> <!--* 1000000-->
	</xsl:template>
	
	<xsl:template name="dosort">
		<xsl:text><![CDATA[
		stylesheet = document.XSLDocument;
        source = document.XMLDocument;
        sortField = document.XSLDocument.selectSingleNode("//@order-by");
		
		function dosort(field)
        {
          sortField.value = field;
          
          listing.innerHTML = source.documentElement.transformNode(stylesheet);
        }
		]]></xsl:text>
	</xsl:template>
</xsl:stylesheet>
