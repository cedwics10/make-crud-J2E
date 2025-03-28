from utils.templates.Template import Template
from utils.TextParser import TextParser

class AdminDetailsJsp(Template):
    folder = "entity"

    def __init__(self, table_name, table_details):
        super().__init__(table_name, table_details)
        self.parameters.update({
            "path": "adminDetailsJsp.tpl",

            "folder" : "webapp",

            "preffix": "Admin",
            "title": TextParser.toPascalCase(table_name),
            "suffix": "Detail",
            
            "extension" : "jsp"
        })

    def set_custom_parameters(self):
        super().set_custom_parameters()
        self.output_parameters.update({
            "route_read" : self.parameters["preffix"] + TextParser.toPascalCase(self.parameters['title']) + self.parameters["suffix"]
        })