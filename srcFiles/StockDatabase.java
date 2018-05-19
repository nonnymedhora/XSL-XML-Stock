// StockDatabase
/*********************************************************************************
File Name :			StockDatabase.java
Description :		Handle query to and from company database.
*********************************************************************************/
package Stocks_XMLApplication;

import java.sql.*;
import java.util.Vector;

public class StockDatabase 
{
	/*
	** Method Name: findStock
	** Method Desc: verify stock info exists, and return it
	** @param stockSymbol -- the stock to look up
	** @return Stock -- the Stock object retreived
	*/
	public Stocks_XMLApplication.Stock findStock(String stockSymbol)
	{
		Stocks_XMLApplication.DBConnection dbCon = 
				new Stocks_XMLApplication.DBConnection(driverName, dbUrl, theConnection);
		try
		{			
			String sqlStmt = "SELECT * FROM stock_prices WHERE Symbol = \"" + stockSymbol + "\"";									
			
			ResultSet rs = dbCon.findRecords(sqlStmt);

			if(rs.next())
			{
				String 	companyName 		= 	rs.getString("Company");
				double 	stockPrice			=	rs.getDouble("Price");
				double	stockPriceChange	=	rs.getDouble("PriceChange");
				double 	stockPricePercentChange = rs.getDouble("PercChange");
				int		stockVolume			=	rs.getInt("Volume");

				Stocks_XMLApplication.Stock theStockInfo = 
						new Stocks_XMLApplication.Stock(companyName,
														stockSymbol,
														stockPrice,
														stockPriceChange,
														stockPricePercentChange,
														stockVolume);
				
				msg = "Successfully found record.";
				
				return theStockInfo;

			}else // Find no match
			{
				msg = "ERROR : Invalid user name or password";
				return null;
			}
		}catch(SQLException e)
		{
			e.printStackTrace(System.out);
		}
		
		return null;
	}
	
	
	/*
	** Method Name: findAllStocks
	** Method Desc: grab all stock info from database and returns in form of Vector
	** @return Vector -- a Vector of Stock objects in the database
	*/
	public Vector findAllStocks()
	{
		Stocks_XMLApplication.DBConnection dbCon = 
				new Stocks_XMLApplication.DBConnection(driverName, dbUrl, theConnection);
		Vector stockVector =  new Vector(50,10);
		try
		{			
			String sqlStmt = "SELECT * FROM stock_prices";								
			
			ResultSet rs = dbCon.findRecords(sqlStmt);
			if (rs.next()) {

				while(rs.next())
				{
					String 	companyName 		= 	rs.getString("Company");
					String  stockSymbol			=	rs.getString("Symbol");
					double 	stockPrice			=	rs.getDouble("Price");
					double	stockPriceChange	=	rs.getDouble("PriceChange");
					double 	stockPricePercentChange = rs.getDouble("PercChange");
					int		stockVolume			=	rs.getInt("Volume");
	
					Stocks_XMLApplication.Stock theStockInfo = 
							new Stocks_XMLApplication.Stock(companyName,
															stockSymbol,
															stockPrice,
															stockPriceChange,
															stockPricePercentChange,
															stockVolume);
					
					stockVector.addElement(theStockInfo);
	
				}
			}
			else // Found no stocks
			{
				msg = "no stocks exist";
				return null;
			}
		}catch(SQLException e)
		{
			e.printStackTrace(System.out);
		}
		
		return stockVector;
	}

	

	/*
	** Method Name: addStock
	** Method Desc: add stock information with information provided.
	** @param theStockInfo -- the Stock object to add to database
	*/
	public void add(Stocks_XMLApplication.Stock theStockInfo)
	{
		Stocks_XMLApplication.DBConnection dbCon = 
			new Stocks_XMLApplication.DBConnection(driverName, dbUrl, theConnection);
		if(findStock(String.valueOf(theStockInfo.getCompanySymbol())) == null)
		{
			String sqlStmt="INSERT INTO stock_prices " +
								" VALUES(\"" +   
								theStockInfo.getCompanyName() + "\", \"" +
								theStockInfo.getCompanySymbol() +  "\", \"" +
								theStockInfo.getStockPrice() +     "\", \"" +
								theStockInfo.getStockPricePercentChange() + "\"," +
								theStockInfo.getStockVolume() + ")";

				int result = dbCon.changeRecords(sqlStmt);

				msg = "Successfully added " + result + " record.";
				
		}else // Duplicated record
		{
			msg = "Stock Stymbol # " + theStockInfo.getCompanySymbol() + " already exists.";
		}
	}


	/*
	** Method Name: deleteStock
	** Method Desc: delete stock information with stock symbol provided.
	** @param stockSymbol -- the stock info to delete
	** @return boolen -- true if deleted
	*/
	public boolean deleteStock(String stockSymbol)
	{
		boolean stock_deleted = false;
		Stocks_XMLApplication.DBConnection dbCon = 
			new Stocks_XMLApplication.DBConnection(driverName, dbUrl, theConnection);

		if(findStock(stockSymbol) != null)
		{
			String sqlStmt = "DELETE FROM stock_prices WHERE Symbol = \"" + stockSymbol + "\"";

			int result = dbCon.changeRecords(sqlStmt);

			msg = "Successfully deleted " + result + " record.";
			return stock_deleted = true;
		}else // Record does not exist
		{
			msg = "Stock Symbol# " + stockSymbol + " does not exist.";
			return stock_deleted;
		}
	}


	/*
	** Method Name: updateStock
	** Method Desc: update stock information with information provided
	** @param Stock -- the Stock object to update in database
	*/
	public void update(Stocks_XMLApplication.Stock theStockInfo)
	{
		Stocks_XMLApplication.DBConnection dbCon = 
			new Stocks_XMLApplication.DBConnection(driverName, dbUrl, theConnection);

		if(findStock(theStockInfo.getCompanySymbol()) != null)
		{
			String sqlStmt = "UPDATE stock_prices SET Company = \"" + theStockInfo.getCompanyName() +
								"\",  Price = " + theStockInfo.getStockPrice() +
								",  PriceChange = " + theStockInfo.getStockPriceChange() +
								",  PercChange = " + theStockInfo.getStockPricePercentChange() +
								",  Volume = " + theStockInfo.getStockVolume() +
								" WHERE Symbol = \"" + theStockInfo.getCompanySymbol() + "\";";
				
				int result = dbCon.changeRecords(sqlStmt);

				msg = "Successfully updated " + result + " record.";
				
		}else // Stock record does not exist
		{
			msg = "StockSymbol# " + theStockInfo.getCompanySymbol() + " does not exist.";
		}

	}

	/*
	 *	Method Name: getMessage
	 *  Method Desc: A helper method to provide messages to and from the database
	 *	@return String -- the message resulting from SQL queries
	 */
	public String getMessage()
	{
		return msg;
	}
	
	private String msg;
	private Connection theConnection;
	
	private String driverName 	= 	"com.mysql.jdbc.Driver";
	private String dbUrl 		= 	"jdbc:mysql://localhost/company";

}
