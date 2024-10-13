package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao{{entity}};

/**
 * Servlet implementation class Index
 */
@WebServlet("/Admin{{entity}}Delete")
public class Admin{{entity}}Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin{{entity}}Delete() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			int index = Integer.parseInt(request.getParameter("id"));
			
			Dao{{entity}} dao{{entity}} = new Dao{{entity}}();
			dao{{entity}}.delete(index);

			response.sendRedirect("Admin{{entity}}");
		} 
		catch(SQLException e)
		{
			System.out.println("Erreur requête : " + e.getMessage());
			response.sendRedirect("AdminIndex");
		}
		catch (NumberFormatException ex)
		{
			response.sendRedirect("AdminIndex");
		}
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* RIEN */
	}

}
