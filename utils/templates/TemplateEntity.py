from utils.templates.Template import Template
from utils.TextParser import TextParser


class TemplateEntity(Template):

    folder = "entity"
    suffix = ""

    def __init__(self, table_name, table_details):
        super().__init__(table_name, table_details)

        self.template_path = "EntityClass.tpl"

    def set_custom_parameters(self):
        super().set_custom_parameters()
        self.output_parameters.update({
            "attributes": self.column_insert_details
        })
