package dao;

public class {{entity}} {
    private int {{primary_key}};
    {% for name, details in insert_columns.items() %}private {{details["type_min"]}} {{name}};
    {% endfor %}

    public int get{{pascal_primary_key}}()
    {
        return {{primary_key}};
    }

    public void set{{pascal_primary_key}}(int id)
    {
        this.{{primary_key}} = id;
    }

    {% for name, details in insert_columns.items() %}
    public {{details["type_min"]}} get{{details["pascal"]}}() {
        return {{name}};
    }

    public void set{{details["pascal"]}}({{details["type_min"]}} {{name}}) {
        this.{{name}} = {{name}};
    }
    {% endfor %}
}