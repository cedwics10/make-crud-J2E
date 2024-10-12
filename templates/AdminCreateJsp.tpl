<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.{{entity}}" %>
<%
{{entity}} record = new {{entity}}();
record = ({{entity}}) request.getAttribute("record");
{% for column, depedency in references.items() %}
ArrayList<{{depedency["table"]|capitalize}}> {{depedency["table"]}}Data = new Dao{{depedency["table"] |capitalize}}();
{{depedency["table"]}}Data = request.getAttribute("{{depedency["table"] |capitalize}}");{% endfor %}


String id = (String) request.getAttribute("id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game shop - {{entity}} - Créer/Modifier</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
<h1>{{entity}} : Créer/Éditer</h1>

<form method="post" action="{{class_name}}">
    {% for name, details in insert_columns.items() %}
    {{name}} :{% if details.type_min == "String" %}<input type="text" name="{{name}}" value="<%=(record.get{{details.pascal}}() == null) ? "" : record.get{{details.pascal}}() %>"/>
    {% elif details.type_min == "int" %}
    {% if name in references.keys() %}
    <select name="{{name}}">
        <% for({{references[name].table|capitalize}} item : {{references[name].table}}Data)) { %>
            <option name="">OUI</option>
        <% } %>
    </select>
    {% else %}
    <input type="number" name="{{name}}" step="1" min="0" value="<%=record.get{{details.pascal}}() %>"/>
    {% endif %}
    {% elif details.type_min == "double" %}<input type="number" name="{{name}}" step="1" value="<%=record.get{{details.pascal}}() %>"/>
    {% elif details.type_min == "boolean" %}Oui : <input type="radio" name="{{name}}" value="1">, Non : <input type="radio" name="{{name}}" value="0">
    {% else %}NOTHING : '{{details.type_min}}'{% endif %} <br />
    {% endfor %}

    <input type="hidden" name="id" value="<%=id%>" />
    <input type="submit" name="envoyer" value="Envoyer" />
</form>
<br />
<a href="{{preffix}}{{entity}}">Retour à la liste des {{entity}}</a>

</body>
</html>