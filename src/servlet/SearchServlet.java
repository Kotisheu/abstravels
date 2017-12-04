package servlet;
 
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

import beans.Product;
import beans.Search;
import utils.DBUtils;

import beans.Flight;
import utils.SRUtils;

import utils.MyUtils;
 
@WebServlet(urlPatterns = {"/result" })
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public SearchServlet() {
        super();
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
    /*    String radios=request.getParameter("radios");
        String[] from=request.getParameterValues("from[]");
        String[] to= request.getParameterValues("to[]");
        String[] depart=request.getParameterValues("depart[]");
        String[] returns=request.getParameterValues("return[]");
        String[] adults= request.getParameterValues("adults[]");
        String[] child=request.getParameterValues("child[]");
        String[] flex= request.getParameterValues("flex[]");
        String[] nonstop= request.getParameterValues("nonstop[]");
        String test=radios + from.length+ to.length+ depart.length+
        		returns.length+adults.length+child.length+flex.length+nonstop.length;
        if(radios.equals("radio1")) {
        	//oneway
        }else if(radios.equals("radio2")){
        	//roundtrip
        }else if(radios.equals("radio3")){
        	//multicity
        }*/
       String errorString = null;
        List<Flight> list = null;
        /*try {
            list = SRUtils.findFlights(conn,"a h");
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }*/
        // Store info in request attribute, before forward to views
        request.setAttribute("errorString", errorString);
        //request.setAttribute("errorString", test);;
        request.setAttribute("flights", list);
         
        // Forward to /WEB-INF/views/productListView.jsp
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/resultsView.jsp");
        dispatcher.forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String ways =  request.getParameter("ways");
    	
    	String departLocation = request.getParameter("from");
    	
    	String arrivalLocation = request.getParameter("to");
    	
    	int numAdults = Integer.valueOf(request.getParameter("adults"));
    	int numChild = Integer.valueOf(request.getParameter("child"));
    	
    	String departDate = request.getParameter("departDate");
    	String arriveDate = request.getParameter("arriveDate");
    	
    	String flex = request.getParameter("flex");
    	boolean isFlex = "Y".equals(flex);
    	String nonstop = request.getParameter("nonstop");
    	boolean isNonstop = "Y".equals(nonstop);
    	
    	
    	Search search = null;
    	
    	if (departLocation != null) {
    		System.out.println(departLocation);
    		
    		request.setAttribute("depart", departLocation);
    		
    		RequestDispatcher dispatcher //
            = this.getServletContext().getRequestDispatcher("/WEB-INF/views/searchView.jsp");

    		dispatcher.forward(request, response);
    	}
        
    }
 
}