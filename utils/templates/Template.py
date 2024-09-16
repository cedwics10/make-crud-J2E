from abc import ABC, abstractmethod

from jinja2 import Environment, FileSystemLoader
from utils.TextParser import TextParser

class Template(ABC):

    folder = ""

    @abstractmethod
    def __init__(self, table_name, table_details):
        self.env = Environment(loader=FileSystemLoader('templates'))

        self.template_path = ""
        self.template_parameters = {}

        self.output_folder = ""

        self.table_name = table_name
        self.file_name = table_name

        self.primary_key = table_details["primary_key"]
        self.columns = table_details["columns"]

    @classmethod
    def get_folder(cls):
        return cls.folder

    def __set_base_parameters(self):
        self.template_parameters.update({
            "entity": TextParser.toPascalCase(self.table_name),
            "class_name": TextParser.toPascalCase(self.table_name) + "Dao",

            "table_name": self.table_name,

            "primary_key": self.primary_key
        })

        self.column_insert_details = {
            column_name: {
                "pascal": TextParser.toPascalCase(column_name),
                "type": column_type.title(),
                "index": 1  # to edit
            } for column_name, column_type in self.columns.items()
        }

    @abstractmethod
    def set_custom_parameters(self):
        pass

    def get_content(self):
        return self.content

    def get_file_name(self):
        pascal_case_name = TextParser.toPascalCase(self.file_name)
        return pascal_case_name

    def render(self):
        self.__set_base_parameters()
        self.set_custom_parameters()

        model_template = self.env.get_template(self.template_path)

        self.content = model_template.render(self.template_parameters)
