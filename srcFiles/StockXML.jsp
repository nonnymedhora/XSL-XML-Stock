<html>
	<head>
		<title>Get Stock Information</title>
	</head>
	<body bgcolor="yellow" onLoad="self.focus();document.stockForm.usrName.focus()">
		<center>
		<h1>StockForm</h1>
		<form 	name="stockForm"
			action="/servlet/Stocks_XMLApplication.MainStockXMLServlet"
			method="post">
		<br/><b>Enter your stock symbol &nbsp;&nbsp;<input name="stockSymbol" type="text"/> &nbsp;
			<input name="button" type="submit" value="Get Stock info"/>
		<br/>
		<br/>
			<b>Else, get info on all stocks in database &nbsp;&nbsp;
			<input name="button" type="submit" value="Show All Stocks"/>
			
		
		</form>
		</center>
	</body>
</html>