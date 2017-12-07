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

import beans.Customer;
import beans.Employee;
import beans.Flights;
import beans.Reservation;
import utils.MyUtils;
import utils.ReservationUtils;
import utils.CustomerUtils;
import utils.EmployeeUtils;
import utils.FlightsUtils;

/**
 * Servlet implementation class EmployeeHomeServlet
 */
@WebServlet("/EmployeeHomeServlet")
public class EmployeeHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeHomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		 
        String errorString = null;
		List<Customer> list = null;
		List<Flights> flightList = null;
		List<Employee> employeeList = null;
		List<Reservation> reservationList = null;
        try {
            list = CustomerUtils.queryAllCustomers(conn);
            flightList = FlightsUtils.queryAllFlights(conn);
            employeeList = EmployeeUtils.queryAllEmployee(conn);
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        // Store info in request attribute, before forward to views
        request.setAttribute("errorString", errorString);
        request.setAttribute("customerList", list);
        request.setAttribute("flightList", flightList);
        request.setAttribute("employeeList", employeeList);
        
        
         
       
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/employeeHomeView.jsp");
        dispatcher.forward(request, response);
        return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
