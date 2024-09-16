from constant.Constant import Constant

from utils.JavaFileSaver import JavaFileSaver
from utils.TablesModel import TablesModel

from utils.templates.TemplateDao import TemplateDao


class Generator:
    def run(self):
        java_file_saver = JavaFileSaver("dao")
        
        table_model = TablesModel(Constant.file_path_data)
        table_model.open()

        tables_details = table_model.get_all()

        for table_name, table_details in tables_details.items():
            # (?) Charger dynamiquement l'ensemble des classes à modifier
            generator = TemplateDao(table_name, table_details)
            generator.render()

            java_file_saver.save_results(generator)
