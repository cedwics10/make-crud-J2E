from utils.templates.Template import Template
from utils.TextParser import TextParser

class AdminReadJsp(Template):
    folder = "entity"

    def __init__(self, table_name, table_details):
        super().__init__(table_name, table_details)
        self.parameters.update({
            "path": "AdminReadJsp.tpl",

            "folder" : "jsp",

            "preffix": "Admin",
            "title": TextParser.toPascalCase(table_name),
            "suffix": "",

            "extension" : "java"
        })

    def set_custom_parameters(self):
        super().set_custom_parameters()
        self.output_parameters.update({
            "attributes": self.column_insert_details
        })
