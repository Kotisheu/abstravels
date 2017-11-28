package servlet;
 
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import beans.Product;
import utils.DBUtils;
import utils.MyUtils;
 
@WebServlet(urlPatterns = { "/viewTable" })
public class ViewTableServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public ViewTableServlet() {
        super();
    }
 
    // Show product edit page.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
 
        String name = (String) request.getParameter("name");
 
        
        List<Map<String,Object>> table=null;
        String errorString = null;
 
        try {
             table= DBUtils.getTable(conn, name);
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
 
        // Store info in request attribute, before forward to views
        request.setAttribute("errorString", errorString);
        request.setAttribute("table", table);
        request.setAttribute("name", name);
        
         
 
  
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/viewTableView.jsp");
        dispatcher.forward(request, response);
 
    }
 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}