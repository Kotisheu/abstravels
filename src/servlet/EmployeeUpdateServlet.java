package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.CustomerUtils;
import utils.EmployeeUtils;
import utils.MyUtils;

/**
 * Servlet implementation class EmployeeUpdateServlet
 */
@WebServlet("/EmployeeUpdateServlet")
public class EmployeeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String employeeId = request.getParameter("employeeId");
		String firstName = request.getParameter("efirstName");
		String lastName = request.getParameter("elastName");
		String address = request.getParameter("eaddress");
		String city = request.getParameter("ecity");
		String state = request.getParameter("estate");
		String zip = request.getParameter("ezip");
		String ssn = request.getParameter("essn");
		String start = request.getParameter("start");
		String manager = request.getParameter("manager");
		String hourly = request.getParameter("hourly");
		
		int statements = -1;
		
		Connection conn = MyUtils.getStoredConnection(request);
		
		boolean hasError = false;
        String errorString = null;
		
		try {
			statements = EmployeeUtils.updateEmployeeInfo(conn, employeeId, firstName, lastName, address, city, state, zip, ssn, start, hourly, manager);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if (statements == -1) {
                hasError = true;
                errorString = "Unable to update the account Information";
            }
			
		}
		if (hasError) {
 
            // Store information in request attribute, before forward.
            //request.setAttribute("errorString", errorString);
            //request.setAttribute("user", customer);
 
            // Forward to /WEB-INF/views/login.jsp
            RequestDispatcher dispatcher //
                    = this.getServletContext().getRequestDispatcher("/WEB-INF/views/employeeHomeView.jsp");
 
            dispatcher.forward(request, response);
        }
		
		RequestDispatcher dispatcher //
        = this.getServletContext().getRequestDispatcher("/WEB-INF/views/employeeHomeView.jsp");

		dispatcher.forward(request, response);
	}

}
