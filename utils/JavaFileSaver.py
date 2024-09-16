from constant.Constant import Constant

class JavaFileSaver:
    def __init__(self, file_folder = "dao"):
        self.file_extension = "java"
        self.file_title = None
        self.file_content = None
        
        self.set_file_folder(file_folder)
    
    def set_file_folder(self, file_folder):
        self.file_folder = file_folder

    def set_file_title(self, file_title):
        self.file_title = file_title + "Dao"
    
    def set_file_content(self, file_content):
        self.file_content = file_content
    
    def save_file(self):
        suffix = "." + self.file_extension if self.file_extension != "" else ""
        saved_file_path = Constant.output_folder + "/" + self.file_folder + "/" + self.file_title + suffix
        
        file_to_save = open(saved_file_path, "w")
        file_to_save.write(self.file_content)
        
        file_to_save.close()
        
    def save_results(self,generattor):
        dao_filename = generattor.get_file_name()
        dao_content = generattor.get_content()
        
        self.set_file_title(dao_filename)
        self.set_file_content(dao_content)
        
        self.save_file()
