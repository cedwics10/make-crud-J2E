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
		int page = 0;

		try
		{
			page = Integer.parseInt(request.getParameter("page"));
		} 
		catch (NumberFormatException ex)
		{
			page = 0;
		}

		Dao{{entity}} model = new Dao{{entity}}();

		ArrayList<{{entity}}> records = new ArrayList<{{entity}}>();

		try
		{
			records = model.getPage(page);
		}
		catch(SQLException e)
		{
			System.out.println("Error : " + e.getMessage());
		}

		request.setAttribute("records", records);
		request.getRequestDispatcher("admin{{entity}}.jsp");
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* RIEN */
	}

}
