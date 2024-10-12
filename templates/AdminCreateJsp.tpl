<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    {{name}} :{% if details.type_min == "String" %}<input type="text" name="{{name}}" value="Test"/>
    {% elif details.type_min == "Int" %}<input type="number" name="{{name}}" step="1" value="0"/>
    {% elif details.type_min == "boolean" %}Oui : <input type="radio" name="{{name}}" value="1">, Non : <input type="radio" name="{{name}}" value="0">
    {% else %}NOTHING : '{{details.type_min}}'{% endif %} <br />
    {% endfor %}

    <input type="hidden" name="id" value="0" />
    <input type="submit" name="envoyer" value="Envoyer" />
</form>

</body>
</html>