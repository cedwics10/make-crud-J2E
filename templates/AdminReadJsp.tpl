<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="dao.{{entity}}" %>
<% ArrayList<{{entity}}> records = new ArrayList<{{entity}}>();
records = (ArrayList<{{entity}}>) request.getAttribute("records"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game shop - {{entity}} - Liste</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
<h1>{{entity}} : liste</h1>

<table>
    <thead>
        <td>{{primary_key}}</td>
        {% for name, details in insert_columns.items() %}<td>{{name}}</td>{% endfor %}
        <td>Supprimer</td>
    </thead>
    <tbody>
    <% for({{entity}} entry : records) { %>
        <tr>
            <td><%=entry.get{{pascal_primary_key}}()%></td>
        {% for name, details in insert_columns.items() %}
            <td><%=entry.get{{details.pascal}}()%></td>
        {% endfor %}
        <td>D</td>
        </tr>
    <% } %>
    </tbody>
</table><br />
<a href="{{preffix}}{{entity}}New">Créer un nouvel {{entity}}</a>
</body>
</html>