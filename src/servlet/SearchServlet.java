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
import utils.MyUtils;
 
@WebServlet(urlPatterns = { "/search" })
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public SearchServlet() {
        super();
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
 
        String errorString = null;
        List<Product> list = null;
        try {
            list = DBUtils.queryProduct(conn);
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        // Store info in request attribute, before forward to views
        request.setAttribute("errorString", errorString);
        request.setAttribute("productList", list);
         
        // Forward to /WEB-INF/views/productListView.jsp
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/resultsView.jsp");
        dispatcher.forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String departLocation = request.getParameter("from");
    	
    	String arrivalLocation = request.getParameter("to");
    	
    	int numAdults = Integer.valueOf(request.getParameter("adults"));
    	int numChild = Integer.valueOf(request.getParameter("child"));
    	
    	String flex = request.getParameter("flex");
    	boolean isFlex = "Y".equals(flex);
    	String nonstop = request.getParameter("nonstop");
    	boolean isNonstop = "Y".equals(nonstop);
    	
    	System.out.println(departLocation);
    	System.out.println(arrivalLocation);
    	System.out.println(numAdults);
    	System.out.println(numChild);
    	
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