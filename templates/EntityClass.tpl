package dao;

public class {{entity}} {
    private int {{primary_key}};
    {% for name, details in insert_columns.items() %}private {{details["type"]}} {{name}};
    {% endfor %}
    {% for name, details in insert_columns.items() %}
    public {{details["type"] | lower}} get{{details["pascal"]}}() {
        return this.{{name}}
    }

    public void set{{details["pascal"]}}({{details["type"]}} {{name}}) {
        this.{{name}} = {{name}}
    }
    {% endfor %}
}