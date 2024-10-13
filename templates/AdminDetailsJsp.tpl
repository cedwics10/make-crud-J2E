<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.{{entity}}" %>
{% for column, depedency in references.items() %}
<%@page import="dao.{{depedency.table|capitalize}}" %>
{% endfor %}
<%@page import="java.util.ArrayList" %>
<%

{{entity}} record = new {{entity}}();
record = ({{entity}}) request.getAttribute("record");

{% for column, depedency in references.items() %}
ArrayList<{{depedency["table"]|capitalize}}> {{depedency["table"]}}Data = new ArrayList<{{depedency["table"] |capitalize}}>();
{{depedency["table"]}}Data = (ArrayList<{{depedency["table"] |capitalize}}>) request.getAttribute("{{depedency["table"] |capitalize}}");{% endfor %}


String id = (String) request.getAttribute("id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game shop - {{entity}} - Créer/Modifier</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>

<h1>{{entity}} : DETAILS</h1>

<table>
    {% for name, details in insert_columns.items() %}
    <tr>
        <td>{{name}}</td>
        <td><%=(record.get{{details.pascal}}() == null) ? "" : record.get{{details.pascal}}() %>"/></td>
    </tr>
    {% endfor %}

    <input type="hidden" name="id" value="<%=id%>" />
    <input type="submit" name="envoyer" value="Envoyer" />
</form>
<br />
<a href="{{preffix}}{{entity}}">Retour à la liste des {{entity}}</a>

</body>
</html>