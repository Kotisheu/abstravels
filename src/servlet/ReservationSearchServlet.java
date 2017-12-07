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
import utils.MyUtils;
import utils.ReservationUtils;

/**
 * Servlet implementation class ReservationSearchServlet
 */
@WebServlet("/ReservationSearchServlet")
public class ReservationSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationSearchServlet() {
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
		String searchType = request.getParameter("searchType");
	
		List<Reservation> reservationList = null;
		
		Connection conn = MyUtils.getStoredConnection(request);
		
		boolean hasError = false;
        String errorString = null;
		
		try {
			
			if (searchType.equals("Search By Flight")) {
				System.out.println("Search By Flight");
				String searchFlight = request.getParameter("searchFlight");
				reservationList = ReservationUtils.queryByFlight (conn, searchFlight);
				
				request.setAttribute("reservationList", reservationList);
				
				RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/WEB-INF/views/reservationSearchResultView.jsp");

				dispatcher.forward(request, response);
	
				return;
			}
			else if (searchType.equals("Search By Customer")) {
				System.out.println("itinerary");
				
				String firstName = request.getParameter("firstName");
				String lastName = request.getParameter("lastName");
				
				reservationList = ReservationUtils.queryByCustomer (conn, firstName, lastName);
				
				request.setAttribute("reservationList", reservationList);
				
				RequestDispatcher dispatcher
                = this.getServletContext().getRequestDispatcher("/WEB-INF/views/reservationSearchResultView.jsp");

				dispatcher.forward(request, response);
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if (reservationList == null) {
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
