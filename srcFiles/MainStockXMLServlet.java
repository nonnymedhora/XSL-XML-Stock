// MainStockXMLServlet.java
/*********************************************************************************
File Name :			MainStockXMLServlet.java
Description :		Controller for stock information lookup and update web application
Version :		````v0.1
*********************************************************************************/
package Stocks_XMLApplication;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class MainStockXMLServlet extends HttpServlet
{
	/**
	 *	Method Name: init
	 *  Method Desc: initialize the servlet
	 *  @param ServletConfig -- the servlet confiuration
	 *	@exception ServletException -- in case any errors occurs during initialization
	 *	@return -- void
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	/*
	 *	Method Name: doGet
	 *	Method Desc: Handle Get operations of the servlet
	 *	@param HttpServletRequest -- the incoming request
	 *	@param HttpServletResponse -- the outgoing response
	 *	@exception ServletException -- errors generated by servlet
	 *	@exception IOException -- for IO operation errors
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		processRequest(request, response);
	}
	
	/*
	 *	Method Name: doPost
	 *	Method Desc: Handle Post operations of the servlet
	 *	@param HttpServletRequest -- the incoming request
	 *	@param HttpServletResponse -- the outgoing response
	 *	@exception ServletException -- errors generated by servlet
	 *	@exception IOException -- for IO operation errors
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		processRequest(request, response);
	}
	
	/*	
	 *	Method Name: processRequest
	 *	Method Desc: Process incoming requests and determines the response 
	 *					to forward for further processing
	 *	@param HttpServletRequest -- the incoming request
	 *	@param HttpServletResponse -- the outgoing response
	 *	@exception ServletException -- errors generated by servlet
	 *	@exception IOException -- for IO operation errors
	 */
	private void processRequest(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		// notified which button is pressed
		String button = request.getParameter("button");
		
		if(button.equalsIgnoreCase("get stock info"))// for get stock info submit button
		{
			// forward login operations process with StockXMLServlet
			goToPage(singleStock, request, response);
			
						
		} else if(button.equalsIgnoreCase("show all stocks"))// for displaying all submit button
		{
			// forward update operations process with AllStockXMLSevlet
			goToPage(allStocks, request, response);
			
		
		} else if(button.equalsIgnoreCase("update"))// for update submit button
		{
			// forward update operations process with UpdateStockSevlet
			goToPage(updateStock, request, response);
			
		
		} else if(button.equalsIgnoreCase("delete stock"))	// for delete button
		{
			// forward update operations process with DeleteStockSevlet
			goToPage(deleteStock, request, response);
		}
		  else if(button.equalsIgnoreCase("sign out"))// for sign out button
		{
			Stocks_XMLApplication.StringBean mb = new Stocks_XMLApplication.StringBean();
			// prepare good bye and thank you message
			mb.setMessage("<font color=\"red\">Thank you and Have a Nice Day!</font>");
			HttpSession session = request.getSession();
			session.setAttribute("msgInfo", mb);
			// forward to JSP page to display message
			goToPage(messagePage, request, response);			
		
		} else if(button.equalsIgnoreCase("ok")) // for ok button
		{
			HttpSession session = request.getSession();
			// clean out session related resources
			session.removeAttribute("msgInfo");
			session.invalidate();
			// forward to login page
			goToPage(introPage, request, response);
			
		} else // shouldn't have chance to be here, just in case
		{
			Stocks_XMLApplication.StringBean mb = new Stocks_XMLApplication.StringBean();
			mb.setMessage("<font color=\"red\">Fatal Error : Un-able to recognize request!</font>");
			HttpSession session = request.getSession();
			session.setAttribute("msgInfo", mb);
			
			goToPage(messagePage, request, response);
			
		}		
	}

	
	/*
	 *	Method Name: goToPage
	 *	Method Desc: A generic helper method that supports processRequest to forward 
	 *					to a particular page
	 * @param  address - the URL page to go to
	 * @param  request - an HttpServletRequest 
	 * @param  response - an HttpServletResponse
	 * @exception ServletException, IOException	
	 * Original source from More Servlets & Java Server Pages(page 224)
	 **/
	private void goToPage ( String address, HttpServletRequest request, 
							HttpServletResponse response)
		throws ServletException, IOException 
	{
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
		dispatcher.forward(request, response);
		
	}
	private static final String introPage   = 	"/StockXML.jsp";	
	private static final String messagePage = 	"/StockMessage.jsp";
	private static final String singleStock = 	"/servlet/Stocks_XMLApplication.StockXMLServlet";
	private static final String allStocks	=	"/servlet/Stocks_XMLApplication.AllStockXMLServlet";
	private static final String updateStock	=	"/servlet/Stocks_XMLApplication.UpdateStockServlet";
	private static final String deleteStock	=	"/servlet/Stocks_XMLAppplication.DeleteStockServlet";

}