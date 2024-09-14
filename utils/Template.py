from jinja2 import Environment, FileSystemLoader

class Template():
    def __init__(self, table_name, table_details):
        self.env = Environment(loader=FileSystemLoader('templates'))
        
        self.table_name = table_name
        self.file_name = table_name
        
        self.primary_key = table_details["primary_key"]
        self.columns_table = table_details["columns"]
        
        self.template_path = ""
        self.template_parameters = {}
        
        self.template_content = ""
    
    def __set_template_parameters(self):
        pass
    
    def render(self):
        self.set_template_parameters()

        model_template = self.env.get_template(self.template_path)
        
        self.content = model_template.render(self.template_parameters);

    def get_content(self):
        return self.content