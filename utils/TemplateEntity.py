from utils.Template import Template
from utils.TextParser import TextParser

class TemplateEntity(Template):
    def __init__(self, table_name, table_details):
        super().__init__(table_name, table_details)
        
        self.template_path = "EntityClass.tpl"
        
    def __set_template_parameters(self):
        super().__set_template_parameters()
        
        self.column_details = {
            column_name : {
                "pascal" : TextParser.toPascalCase(column_name),                
                "type" : column_type.title(),
                "index" : 1 # to edit
            } for column_name, column_type in self.columns_table.items()
        }