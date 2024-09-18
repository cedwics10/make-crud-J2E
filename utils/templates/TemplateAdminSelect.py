from utils.templates.Template import Template
from utils.TextParser import TextParser


class TemplateAdminSelect(Template):
    folder = "controller"
    suffix = ""

    def __init__(self, table_name, table_details):
        super().__init__(table_name, table_details)

        self.template_path = "EntitySelect.tpl"

    def set_custom_parameters(self):
        super().set_custom_parameters()
        self.template_parameters.update({
            "attributes": self.column_insert_details
        })
