package controller;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;

import dao.Dao{{entity}};
import dao.{{entity}};

/**
 * Servlet implementation class Index
 */
@WebServlet("/{{class_name}}")
public class {{class_name}} extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public {{class_name}}() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = 0;

		try
		{
			id = Integer.parseInt(request.getParameter("id"));
		} 
		catch(NumberFormatException ex)
		{
			id = 0;
		}

		{{entity}} record = new {{entity}}();

		try
		{
			Dao{{entity}} dao{{entity}} = new Dao{{entity}}();
			record = dao{{entity}}.getById(id);
		}
		catch(SQLException e)
		{
			System.out.println("Grosse erreur : " + e.getMessage());
		}

		request.setAttribute("record", record);

		request.getRequestDispatcher("Admin{{entity}}Details.jsp").forward(request, response);
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
