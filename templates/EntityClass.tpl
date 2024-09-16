package dao;

public class {{entity}} {
    private int {{primary_key}};
    {% for name, details in attributes.items() %}private {{details["type"]}} {{name}};
    {% endfor %}
    {% for name, details in attributes.items() %}
    public {{details["type"]}} get{{details["pascal"]}}() {
        return this.{{name}}
    }

    public void set{{details["pascal"]}}({{details["type"]}} {{name}}) {
        this.{{name}} = {{name}}
    }
    {% endfor %}
}