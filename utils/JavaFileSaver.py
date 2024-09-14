from constant.Constant import Constant

class JavaFileSaver:
    def __init__(self, file_folder = "dao"):
        self.file_extension = "java"
        self.file_title = None
        self.file_content = None
        
        self.file_folder = file_folder
    
    def set_file_folder(self, file_folder):
        self.file_folder = file_folder

    def set_file_title(self, file_title):
        self.file_title = file_title + "Dao"
    
    def set_file_content(self, file_content):
        self.file_content = file_content
    
    def save_file(self):
        suffix = "." + self.file_extension if self.file_extension != "" else ""
        
        output_folder = "output"

        saved_file_path = Constant.output_folder + "/" + self.file_folder + "/" + self.file_title + suffix
        
        file_to_save = open(saved_file_path, "w")
        file_to_save.write(self.file_content)
        
        file_to_save.close()