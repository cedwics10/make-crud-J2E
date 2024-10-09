from utils.templates.Template import Template
from utils.TextParser import TextParser

class AdminDeleteRoute(Template):
    folder = "entity"

    def __init__(self, table_name, table_details):
        super().__init__(table_name, table_details)
        self.parameters.update({
            "path": "AdminDeleteRoute.tpl",

            "folder" : "java/controller",

            "preffix": "Admin",
            "title": TextParser.toPascalCase(table_name),
            "suffix": "Delete",

            "extension" : "java"
        })

    def set_custom_parameters(self):
        super().set_custom_parameters()
        self.output_parameters.update({
            "attributes": self.column_insert_details
        })
