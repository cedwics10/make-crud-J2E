"""
Class : TemplatesLoader
Description : used to return the set of
classes stored into the folder utils/template
"""

from constant.Constant import Constant

class TemplatesLoader:
    list = Constant.scripts_list

    @classmethod
    def get_classes(cls):
        classes = []

        for template_name in TemplatesLoader.list:
            module = __import__(f"utils.templates.{template_name}", fromlist=[template_name])
            classes.append(getattr(module, template_name))
        return classes


    