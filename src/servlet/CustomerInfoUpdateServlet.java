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

import beans.Customer;
import beans.UserAccount;
import utils.CustomerUtils;
import utils.DBUtils;
import utils.MyUtils;
/**
 * Servlet implementation class CustomerInfoUpdateServlet
 */
@WebServlet("/CustomerInfoUpdateServlet")
public class CustomerInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerInfoUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String customerId = request.getParameter("customerId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip = request.getParameter("zip");
		String ccNo = request.getParameter("ccNo");
		String email = request.getParameter("email");
		String phone = request.getParameter("phoneNum");
		
		int statements = -1;
		
		Connection conn = MyUtils.getStoredConnection(request);
		
		boolean hasError = false;
        String errorString = null;
		
		try {
			statements = CustomerUtils.updateCustomerInfo(conn, customerId, firstName, lastName, address, city, state, zip, ccNo, email, phone);
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
