from utils.JavaFileSaver import JavaFileSaver
from utils.TablesModel import TablesModel
from utils.templates.TemplateDao import TemplateDao

from constant.Constant import Constant

class Generator():
    def __init__(self) -> None:
        self.file_path_data = "input/tables.json"
        self.scripts_list = ["DaoTemplate"]

    def run(self):
        java_file_saver = JavaFileSaver()
        java_file_saver.set_file_folder("dao")
        
        table_file = TablesModel()
        table_file.open(self.file_path_data)
        
        tables_details = table_file.get_content_by_table()
        
        for table_name, table_details in tables_details.items():
            generator = TemplateDao(table_name, table_details)
            generator.render()
            
            java_file_saver.save_results(generator)