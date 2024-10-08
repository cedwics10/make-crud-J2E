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
		int id = 0;

		try
		{
			id = Integer.parseInt(request.getParameter("id"));
		} 
		catch(NumberFormatException ex)
		{
			id = 0;
		}

		boolean submitButtonPressed = request.getParameter("submit") != null;

		if(submitButtonPressed)
		{
			{{entity}} entry = new {{entity}}();

			entry.set{{pascal_primary_key}}(id);{% for name, details in insert_columns.items() %}
			{% if details.type == "int" %}entry.set{{details.pascal}}(Integer.parseInt(request.getParameter("{{name}}")));
			{% elif details.type == "boolean" %}entry.set{{details.pascal}}(Boolean.parseBoolean(request.getParameter("{{name}}")));
			{% elif details.type == "double" %}entry.set{{details.pascal}}(Double.parseDouble(request.getParameter("{{name}}")));
			{% else %}entry.set{{details.pascal}}(request.getParameter("{{name}}"));{% endif %}{% endfor %}

			Dao{{entity}} dao = new Dao{{entity}}();
			try
			{
				dao.save(entry);
			}
			catch(SQLException e)
			{
				System.out.println("ERROR : " + e.getMessage());
			}

			response.sendRedirect("{{route_read}}");
			return;
		}

		Dao{{entity}} dao{{entity}} = new Dao{{entity}}();
		
		{{entity}} record = new {{entity}}();

		try
		{
			record = dao{{entity}}.getById(id);
		}
		catch(SQLException e)
		{
			System.out.println("ERROR : " + e.getMessage());
		}

		request.setAttribute("record", record);
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
