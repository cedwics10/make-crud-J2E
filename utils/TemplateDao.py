from jinja2 import Environment, FileSystemLoader

from utils.TextParser import TextParser


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
class TemplateDao():
    def __init__(self, table_name, table_details):
        self.env = Environment(loader=FileSystemLoader('templates'))

        self.template_path = "DaoClass.tpl"

        self.table_name = table_name
        self.file_name = table_name
        
        self.primary_key = table_details["primary_key"]
        
        self.columns_table = table_details["columns"]

        self.template_parameters = {}
        self.template_content = ""
        
    def __set_base_parameters(self):
        self.template_parameters.update({
            "entity" : TextParser.toPascalCase(self.table_name),
            "class_name" : TextParser.toPascalCase(self.table_name) + "Dao",
            
            "table_name" : self.table_name,

            "primary_key" : self.primary_key
        })

    def __set_column_paramters(self):
        self.insert_columns = {
            column_name : {
                "pascal" : TextParser.toPascalCase(column_name),                
                "type" : column_type.title(),
                "index" : 1 # to edit
            } for column_name, column_type in self.columns_table.items()
        }
        
        column_list = [column_name for column_name in self.columns_table.keys()]
        column_update_details = [column_name + " = ?" for column_name in self.columns_table.keys()]

        self.update_columns = "," . join(column_list)
        self.update_details =  ", " . join(column_update_details)

        self.question_marks = "," . join(["?" for column_name in self.columns_table.keys()])

        self.template_parameters.update({
            
            "insert_columns" : self.insert_columns,
            
            "update_columns" : self.update_columns,
            "update_elements" : self.update_details,
            "update_question_marks" : self.question_marks
        })

    def __set_template_parameters(self):
        self.__set_base_parameters()
        self.__set_column_paramters()
       
    def get_file_name(self):
        pascal_case_name = TextParser.toPascalCase(self.file_name)
        return  pascal_case_name

    def render(self):
        self.__set_template_parameters()

        model_template = self.env.get_template(self.template_path)
        
        self.content = model_template.render(self.template_parameters);

    def get_content(self):
        return self.content
    

    
