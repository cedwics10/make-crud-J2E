from jinja2 import Environment, FileSystemLoader

from utils.TextParser import TextParser
from utils.templates.Template import Template

'''
class TemplateDao
* attributs :
- table_details
- jinja_templater
- table_name
- contenu

+ __construct(array table_details) : void
+ getTableName()
+ render() : void
+ getContent() : void
'''
class TemplateDao(Template):
    folder = "dao"

    def __init__(self, table_name, table_details):
        super().__init__(table_name, table_details)

        self.parameters = {
            "path": "DaoClass.tpl",

            "table_name": table_name,
            
            "folder" : "dao",

            "preffix": "Dao",
            "title": TextParser.toPascalCase(table_name),
            "suffix": "",

            "extension" : ".java",

            "primary_key": table_details["primary_key"],
            "columns": table_details["columns"],
        }
    
    def set_custom_parameters(self):
        column_list = [column_name for column_name in self.parameters["columns"].keys()]
        update_columns_setters = [column_name + " = ?" for column_name in self.parameters["columns"].keys()]

        update_columns_binding = "," . join(["?" for column_name in self.parameters["columns"].keys()])

        update_columns = "," . join(column_list)
        update_setters =  ", " . join(update_columns_setters)

        self.template_parameters.update({
            "insert_columns" :  self.column_insert_details,
            
            "update_columns" : update_columns,
            "update_elements" :update_setters,

            "update_question_marks" : update_columns_binding,
        })
    

    
