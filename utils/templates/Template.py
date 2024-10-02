from abc import ABC, abstractmethod

from jinja2 import Environment, FileSystemLoader
from utils.TextParser import TextParser

'''
Class : Template
Description : this class is abstract.
It gives the base to set the details
of the template
'''
class Template(ABC):
    folder = ""

    @abstractmethod
    def __init__(self, table_name, table_details):
        self.env = Environment(loader=FileSystemLoader('templates'))

        self.parameters = {
            "table_name": table_name,

            "primary_key": table_details["primary_key"],
            "columns": table_details["columns"],
            "input" : table_details["input"]
        }

        self.output_parameters = {}
        self.column_insert_details = {}

        self.output = ""

    def get_output(self):
        return self.output

    def set_output(self, value):
        self.output = value

    def get_parameters(self):
        return self.parameters

    def set_parameters(self, parameters):
        self.parameters = parameters

    @classmethod
    def get_folder(cls):
        return cls.folder

    def __set_base_parameters(self):
        self.output_parameters.update({
            "table_name": self.parameters["table_name"],
            "entity": TextParser.toPascalCase(self.parameters["table_name"]),
            "class_name": self.parameters["preffix"] + TextParser.toPascalCase(self.parameters["table_name"]) + self.parameters["suffix"],

            "primary_key": self.parameters["primary_key"],
            "camel_primary_key" : TextParser.toCamelCase(self.parameters["primary_key"]),
            "pascal_primary_key": TextParser.toPascalCase(self.parameters["primary_key"])
        })

        self.output_parameters.update({
            "insert_columns": {
                column_name: {
                    "pascal": TextParser.toPascalCase(column_name),
                    "type": TextParser.toCamelCase(column_type),
                    "type_min" : TextParser.setTypeCase(column_type),
                    "type_pascal": TextParser.toPascalCase(column_type),
                    "index": 1
                } for column_name, column_type in self.parameters["columns"].items()
            },
            "input" : self.parameters["input"]
        })

    @abstractmethod
    def set_custom_parameters(self):
        pass

    def render(self):
        self.__set_base_parameters()
        self.set_custom_parameters()

        model_template = self.env.get_template(self.parameters["path"])

        try:
            self.output = model_template.render(self.output_parameters)
        except Exception as error:
            print("Couldn't generate the output of the template.")
            print(error)
