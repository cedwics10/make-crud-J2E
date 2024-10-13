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

System.out.println(record);

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

<h1>{{entity}} : Créer/Éditer</h1>

<form method="post" action="{{class_name}}">
    {% for name, details in insert_columns.items() %}
        {{name}} :
        {% if details.type_min == "int" %}
            {% if name in references.keys() %}
            <select name="{{name}}">
                <% for({{references[name]["table"]|capitalize}} item : {{references[name]["table"]}}Data) { %>
                    <% 
                        String selected = "";
                        if(record.get{{details.pascal}}() == item.get{{references[name]["primary_pascal"]}}())
                            selected = "selected";
                    %>
                    <option <%=selected%> value="<%=item.get{{references[name]["primary_pascal"]}}()%>"><%=item.get{{references[name]["column_pascal"]}}()%></option>
                <% } %>
            </select>
            {% else %}
            <input type="number" name="{{name}}" step="1" min="0" value="<%=record.get{{details.pascal}}() %>"/>
            {% endif %}
        {% elif details.type_min == "double" %}<input type="number" name="{{name}}" step="0.01" value="<%=record.get{{details.pascal}}() %>"/>
        {% elif details.type_min == "boolean" %}
        <% 
            String checked = "";
            String checked2 = "checked";
            if(record.get{{details.pascal}}())
            { 
                checked = "checked";
                checked2 = "";
            }
            System.out.println("valeur du machin : " + record.get{{details.pascal}}());
        %>
        Oui : <input type="radio" name="{{name}}" value="true" <%=checked%>>, Non : <input type="radio" name="{{name}}" value="false" <%=checked2%>>
        {% else %}<input type="text" name="{{name}}" value="<%=(record.get{{details.pascal}}() == null) ? "" : record.get{{details.pascal}}() %>"/>{% endif %}
        <br />
    {% endfor %}

    <input type="hidden" name="id" value="<%=id%>" />
    <input type="submit" name="envoyer" value="Envoyer" />
</form>
<br />
<a href="{{preffix}}{{entity}}">Retour à la liste des {{entity}}</a>

</body>
</html>