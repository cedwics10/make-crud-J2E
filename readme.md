# J2EE code generator

## Abstract

Here is a code used to generate some code of a J2E projects

- DAO
- Entities
- Routes
- JSP files

## How to run it ?

* Set the information about the database into the input/tables.json file
* py main.py

## How to retrieve the result of the script  ?

* Check the output folder

## How to set the parameters of the program ?

Go to the file constant/Constnat.py

## How to create a new script ?

1. Create a JSP file on the "jsp" folder
2. Create your template class in the folder "utils/template" with a sensible name
3. Start by extending your class of "Template" class (copy/paste an other scirpt)
4. Override the method "set_custom_parameters" (abstract) by updating the
   attribute "output_parameters"
5. Edit the "path" attribute in the constructor to tell where the JSP file is
6. Edit the JSP.

   CHEAT SHEET :

   - {{entity}} : name of the table
   - {{class_name}} : name of the generated class/route
   - {{primary_key}} : get the value of the primary key
   - {{pascal_primary_key}} : get the pascal case vaue of the primary key
   - {% for name, details in insert_columns.items() %} {% endfor %} : iterate over columns of a specific entity
     - {details.pascal} : get the pascal name of the attrobite
     - {details.type} : get the gross type of a column
     - {details.type_min} : get the formatted type of a column
     - {details.type_pascal} : get the pascal case of the type
     - {index} : rank number of the column
7. Add the script in the "constants/constants/py" scripts list.
