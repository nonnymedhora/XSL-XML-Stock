<!-- StockMessage.jsp -->
<%-- ************************************************************************
File Name :			StockMessage.jsp
Description :		 display result message
Version :		v0.1
*************************************************************************** --%>
<html>
	<head>
		<title>Message</title>
	</head>
	<body bgcolor="yellow">
		<center>
		<h1>Message : </h1>
		<form 	name="msgInfoForm"
				action="/servlet/Stocks_XMLApplication.MainStockXMLServlet"
				method="post">
			<%-- import string bean object -StringBean--%>
			<%@ page import="Stocks_XMLApplication.StringBean" %>  			
			<%-- use string bean with session scope --%>
			<jsp:useBean id = "msgInfo" class = "Stocks_XMLApplication.StringBean" scope = "session" />
						<%-- call getMessage from string bean  --%>
			<br/><h2> <jsp:getProperty name = "msgInfo" property = "message" /></h2><br/>
			<input name="button" type="submit" value="OK"/>
		</form>
		</center>
	</body>
</html>