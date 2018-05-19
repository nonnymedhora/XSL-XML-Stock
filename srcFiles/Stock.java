//Stock.java
/*********************************************************************************
File Name :			Stock.java
Description :		A bean to hold Stock information
*********************************************************************************/


package Stocks_XMLApplication;



public class Stock implements java.io.Serializable {
	
	public Stock() {
		this("","",0.00,0.00,0.00,0);
	}
	
	public Stock (	String 	CompanyName, 
					String 	CompanySymbol, 
					double 	StockPrice, 
					double 	StockPriceChange,
					double 	StockPricePercentChange,
					int  	StockVolume)
		{
			this.CompanyName 				= 	CompanyName;
			this.CompanySymbol				= 	CompanySymbol;
			this.StockPrice					=	StockPrice;
			this.StockPriceChange			=	StockPriceChange;
			this.StockPricePercentChange	=	StockPricePercentChange;
			this.StockVolume				=	StockVolume;
		}
		
	public String getCompanyName() {
		return this.CompanyName;		
	}
	
	public void setCompanyName(String Co_Name) {
		this.CompanyName = Co_Name;
	}	
	
	public String getCompanySymbol() {
		return this.CompanySymbol;		
	}
	
	public void setCompanySymbol(String Co_Symbol) {
		this.CompanySymbol = Co_Symbol;
	}	
	
	public double getStockPrice() {
		return this.StockPrice;		
	}
	
	public void setStockPrice(double Co_StockPrice) {
		this.StockPrice = Co_StockPrice;
	}
	
	public double getStockPriceChange() {
		return this.StockPriceChange;		
	}
	
	public void setStockPriceChange(double Co_StockPriceChange) {
		this.StockPrice = Co_StockPriceChange;
	}
	
	public double getStockPricePercentChange() {
		return this.StockPricePercentChange;		
	}
	
	public void setStockPricePercentChange(double Co_StockPricePercentChange) {
		this.StockPricePercentChange = Co_StockPricePercentChange;
	}
	
	public int getStockVolume() {
		return this.StockVolume;		
	}
	
	public void setStockVolume(int Co_StockVolume) {
		this.StockVolume = Co_StockVolume;
	}
	
	public String toString() {
		String stockInfoDetails = "<table>";
		stockInfoDetails += "<tr><td>" + "Company Name: " + this.CompanyName + "</td></tr>";
		stockInfoDetails += "<tr><td>" + "Stock Symbol: " + this.CompanySymbol + "</td></tr>";
		stockInfoDetails += "<tr><td>" + "Stock Price: " + this.StockPrice + "</td></tr>";
		stockInfoDetails += "<tr><td>" + "Stock Price Change: " + this.StockPriceChange + "</td></tr>";
		stockInfoDetails += "<tr><td>" + "Stock price % Change: " + this.StockPricePercentChange + "</td></tr>";
		stockInfoDetails += "<tr><td>" + "Stock Volume: " + this.StockVolume + "</td></tr>";
		stockInfoDetails += "</table>";
		
		return stockInfoDetails;
		
		
	}
	
	
	private String CompanyName;
	private String CompanySymbol;
	private double  StockPrice;
	private double  StockPriceChange;
	private double  StockPricePercentChange;
	private int   StockVolume;
	
					
}