"""
Class : TemplatesLoader
Description : used to return the set of
classes stored into the folder utils/template
"""
class TemplatesLoader:
    list = ["TemplateDao", "TemplateEntity", "TemplateRead"]

    @classmethod
    def get_classes(cls):
        classes = []

        for template_name in TemplatesLoader.list:
            module = __import__("utils.templates." + template_name, fromlist=[template_name])
            classes.append(getattr(module, template_name))
        return classes


    