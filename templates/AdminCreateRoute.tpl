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

{% for depedency in references.values() %}
import dao.{{depedency.table|capitalize}};
import dao.Dao{{depedency.table|capitalize}};
{% endfor %}

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

		boolean submitButtonPressed = request.getParameter("envoyer") != null;

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
				response.sendRedirect("Admin{{entity}}");
				return;
			}
			catch(SQLException e)
			{
				System.out.println("ERROR : " + e.getMessage());
				return;
			}
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

		{% for details in references.values() %}
		try
		{
			Dao{{details.table|capitalize}} dao{{details.table|capitalize}} = new Dao{{details.table|capitalize}}();
			ArrayList<{{details.table|capitalize}} > data{{details.table|capitalize}} = dao{{details.table|capitalize}}.getAll();
			request.setAttribute("{{details.table|capitalize}}", data{{details.table|capitalize}});
		}
		catch (SQLException e) {
			request.setAttribute("{{details.table|capitalize}}", new ArrayList<{{details.table|capitalize}}>());
			e.printStackTrace();
		}
		{% endfor %}

		System.out.println(record);

		request.setAttribute("record", record);
		request.setAttribute("id", Integer.toString(record.get{{pascal_primary_key}}()));

		request.getRequestDispatcher("Admin{{entity}}New.jsp").forward(request, response);
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
