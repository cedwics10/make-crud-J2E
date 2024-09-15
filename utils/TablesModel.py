'''
/* Sert à séparer le contenu JSON de CHAQUE TABLE */
Class TablesModel
* attributs :
- file_content
- tables

+ __init(file_path) : TablesModel
+ open()  : void
+ getTables() : array
+ fermer()  : void
'''
import json

class TablesModel():
    def __init__(self):
        self.content = ""
    
    def open(self, json_file_path):
        with open(json_file_path, 'r') as file:
            self.content = json.load(file)
    
    def get_content_by_table(self):
        return self.content