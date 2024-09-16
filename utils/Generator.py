from constant.Constant import Constant

from utils.JavaFileSaver import JavaFileSaver
from utils.TablesModel import TablesModel

from utils.templates.TemplateDao import TemplateDao
from utils.templates.TemplatesLoader import TemplatesLoader

class Generator:
    def run(self):
        java_file_saver = JavaFileSaver("dao")
        
        table_model = TablesModel(Constant.file_path_data)
        tables_details = table_model.get_all()

        for template_class in TemplatesLoader.get_all():
            java_file_saver.set_file_folder(template_class.get_folder())
            for table_name, table_details in tables_details.items():
                generator = template_class(table_name, table_details)
                generator.render()
                
                java_file_saver.save_results(generator)
