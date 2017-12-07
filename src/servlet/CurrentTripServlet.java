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

import beans.Reservation;
import utils.EmployeeUtils;
import utils.MyUtils;
import utils.ReservationUtils;

/**
 * Servlet implementation class CurrentTripServlet
 */
@WebServlet("/currentTrip")
public class CurrentTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurrentTripServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = MyUtils.getStoredConnection(request);
		String errorString = null;
		List<Reservation> list = null;
		try {
			list = ReservationUtils.queryCurrentReservation(conn);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		
		request.setAttribute("errorString", errorString);
		request.setAttribute("reservationList", list);
		// Forward to /WEB-INF/views/productListView.jsp
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/currentTrips.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String reservationNumber = request.getParameter("reservationNumber");
		String task = request.getParameter("task");
	
		int statements = -1;
		
		Connection conn = MyUtils.getStoredConnection(request);
		
		boolean hasError = false;
        String errorString = null;
		
		try {
			
			if (task.equals("cancel")) {
				System.out.println("cancel");
				statements = ReservationUtils.cancelReservation(conn, reservationNumber);
				
				response.sendRedirect("/test/currentTrip");
	
				return;
			}
			else if (task.equals("itinerary")) {
				System.out.println("itinerary");
				request.setAttribute("reservationNumber",reservationNumber);
				RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/ItineraryServlet");

				dispatcher.forward(request, response);
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if (statements == -1) {
                hasError = true;
                errorString = "Unable to update the account Information";
            }
			
		}
		if (hasError) {
 
			System.out.println("Error");
            RequestDispatcher dispatcher //
                    = this.getServletContext().getRequestDispatcher("/WEB-INF/views/currentTrips.jsp");
 
            dispatcher.forward(request, response);
        }
		return;
	}

}
