// StringBean.java
/*********************************************************************************
File Name :			StringBean.java
Description :		A java bean contain a String message
Version :			Source from More Servlets (Pg 170)
*********************************************************************************/
package Stocks_XMLApplication;

public class StringBean
{
	public String getMessage()
	{
		return this.message;
	}

	public void setMessage(String msg)
	{
		this.message = msg;
	}

	private String message = "None specified";
}