"""
Class : TemplatesLoader
"""
class TemplatesLoader:
    list = ["TemplateDao", "TemplateEntity"]

    @classmethod
    def get_all(cls):
        classes = []

        for template_name in TemplatesLoader.list:
            module = __import__("utils.templates." + template_name, fromlist=[template_name])
            classes.append(getattr(module, template_name))
        return classes


    