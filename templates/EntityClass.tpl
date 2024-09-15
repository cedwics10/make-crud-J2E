package dao;

public class <<entity>> {
    {% for attribute, details in entities.items() %}
    private {{details["type"}}} {{attribute}};
    {% endfor %}

    {% for attribute, details in entities.items() %}
    public {{details["type"]}} get{{details["pascal"]}}() {
        return this.{{attribute}}
    }

    public void set{{details["pascal"]}}({{details["type"]}} {{attribute}}) {
        this.{{attribute}} = {{attribute}}
    }
    {% endfor %}

}