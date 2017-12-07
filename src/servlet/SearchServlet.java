package servlet;
 
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import beans.FlightEntry;
import utils.SRUtils;
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
		List<FlightEntry> list = null;
		// these have to be arrays because of multicity/ convenience p:
		String radios =request.getParameter("radios");
		String[] fromList = request.getParameterValues("from[]");
		String[] toList = request.getParameterValues("to[]");
		String[] departList = request.getParameterValues("depart[]");
		String[] returnList = request.getParameterValues("return[]");
		String[] adultsList = request.getParameterValues("adults[]");
		String[] childList = request.getParameterValues("child[]");
		String[] flexList = request.getParameterValues("flex[]");
		String[] nonstopList = request.getParameterValues("nonstop[]");
	
        try {
            list =SRUtils.findFlights(conn,radios,fromList,toList,departList,
            		returnList,adultsList,childList,flexList,nonstopList);
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        // Store info in request attribute, before forward to views
        request.setAttribute("errorString", errorString);
        request.setAttribute("flightList", list);
         
       
        // Forward to /WEB-INF/views/productListView.jsp
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/resultsView.jsp");
        dispatcher.forward(request, response);
		
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
 
}