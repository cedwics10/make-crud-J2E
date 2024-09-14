class TextParser():
    @staticmethod
    def toPascalCase(snake_case_text):
        words = snake_case_text.split("_")
        words = [word.title() for word in words]
        
        camel_case_text = "" . join(words)
        return camel_case_text
    
    @staticmethod
    def toCamelCase(snake_case_text):
        words = snake_case_text.split("_")
        words = [words[index].title() if index > 0 else words[index] for index in range(0, len(words))] 

        camel_case_text = "" . join(words)
        return camel_case_text