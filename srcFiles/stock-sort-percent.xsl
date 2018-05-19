<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  	<head>
		<STYLE>
		    BODY {margin:0}
		    .bg {font:8pt Verdana; background-color:purple; color:white}
		     H1 {font:bold 14pt Verdana; width:100%; margin-top:1em}
		     .row {font:8pt Verdana; border-bottom:1px solid #CC88CC}
		     .header {font:bold 9pt Verdana; cursor:hand; padding:2px; border:2px outset gray}
		     .up {background-color:#DDFFDD;}
		    .down {background-color:#FFDDDD;}
		    </STYLE>
	</head>
  <body>
  	<form  	name="individualStockForm" 
						action="/servlet/Stocks_XMLApplication.AllStockXMLServlet"
						method="post">
					
					<input type="submit" name="changeStyle" value="Normal View"/>
					<input type="submit" name="changeStyle" value="Graphic View"/>
					
					<select name="sortingStyle">
						<option value="company">Company</option>
						<option value="symbol">Symbol</option>
						<option value="price">Price</option>						
						<option value="change">Change</option>
						<option value="percent">%Change</option>
						<option value="volume">Volume</option>
					</select>
					<input type="submit" value="Sort"/>
					
				</form>
    <h2><xsl:value-of select="portfolio/description"/></h2>
    <table border="0">
    <tr>
    	<td><b>Total Number of Stocks in Portfolio:</b>
    		<xsl:value-of select="count(.//stock)"/>
    	</td>
    </tr>
    <tr>
    	<td>
    		<B>Average change: 
    		<xsl:value-of select="format-number(sum(.//percent) div count(.//stock), 0.00)"/> %
			</B>
    	</td>
    </tr>
    <tr>
    	<td>
    		<B>Total volume:
    		<xsl:value-of select="sum(.//volume)"/> shares
			</B>
		</td>
    </tr>
    </table>
    <table STYLE="background-color:white" border="1">
      <tr bgcolor="#9acd32">
        <THEAD><B>
				<TD width="200">Company
				</TD>
				<TD width="80">Symbol
				</TD>
				<TD width="80">Price
				</TD>
				<TD width="80">Change
				</TD>
				<TD width="80">%Change
				</TD>
				<TD width="80">Volume
				</TD></B>
			</THEAD>
      </tr>
      <xsl:for-each select="portfolio/stock">
      <xsl:sort select="percent" data-type="number" order="ascending" />
      <tr>
        <td><xsl:value-of select="name"/></td>
        <td><xsl:value-of select="symbol"/></td>
        <td><xsl:value-of select="price"/></td>
        <td><xsl:value-of select="percent"/></td>
        <td><xsl:value-of select="change"/></td>
        <td><xsl:value-of select="volume"/></td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>