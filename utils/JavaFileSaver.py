from constant.Constant import Constant


class JavaFileSaver:

    def __init__(self, folder=""):
        self.foldder = folder
        self.parameters = {
        }

    def set_folder(self, folder):
        self.folder = folder

    def set_parameters(self, parameters):
        self.parameters = parameters

    def save_output(self, generator):
        parameters = generator.parameters

        extension = f".{parameters["extension"]}" if parameters["extension"] != "" else ""

        saved_file_path = Constant.output_folder + "/" + parameters["folder"] + "/" + parameters["preffix"] + \
            parameters["title"] + parameters["suffix"] + \
            extension

        contentOutput = generator.get_output()

        fileOuput = open(saved_file_path, "a")
        fileOuput.write(contentOutput)
        fileOuput.close()
