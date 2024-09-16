import json

'''
Class : TableModel
Usage : used to open a JSON file
containing the data of all tables.
'''

class TablesModel():
    def __init__(self, file_path = ""):
        self.content = ""
        self.file_path = file_path
        if file_path != "":
            self.open()
    
    def open(self):
        with open(self.file_path, 'r') as file:
            self.content = json.load(file)
    
    def get_all(self):
        return self.content