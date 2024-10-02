package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class {{class_name}} 
{
  int ITEM_PER_PAGE = 20;

  public ArrayList<{{entity}}> getAll() throws SQLException 
  {
    Database.makeConnection();
    Connection connectionDatabase = Database.getConnection();

    ArrayList<{{entity}}> recordings = new ArrayList<{{entity}}>();
    Statement queryAll = connectionDatabase.createStatement();
    ResultSet results = queryAll.executeQuery("SELECT * FROM {{table_name}}");

    boolean noResultExists = !results.next();

    if (noResultExists)
      return new ArrayList<{{entity}}>();

    do {
      {{entity}} recording = new {{entity}}();

      recording.set{{pascal_primary_key}}(results.getInt("{{primary_key}}"));
      {% set index = 1 %}
      {% for name, details in insert_columns.items() %}recording.set{{details["pascal"]}}(results.get{{details["type_pascal"]}}("{{name}}"));
      {% set index = index + 1 %}{% endfor %}
      recordings.add(recording);
    } while (results.next());
    return recordings;
  }

  public ArrayList<{{entity}}> getPage(int page) throws SQLException 
  {
    Database.makeConnection();
    Connection connectionDatabase = Database.getConnection();

    ArrayList<{{entity}}> recordings = new ArrayList<{{entity}}>();
    Statement queryAll = connectionDatabase.createStatement();
    ResultSet results = queryAll.executeQuery("SELECT * FROM {{table_name}} ORDER BY id ASC LIMIT " + (page * ITEM_PER_PAGE) + ", " + ITEM_PER_PAGE);

    boolean noResultExists = !results.next();

    if (noResultExists)
      return new ArrayList<{{entity}}>();

    do {
      {{entity}} recording = new {{entity}}();

      recording.set{{pascal_primary_key}}(results.getInt("{{primary_key}}"));
      {% set index = 1 %}
      {% for name, details in insert_columns.items() %}recording.set{{details["pascal"]}}(results.get{{details["type_pascal"]}}("{{name}}"));
      {% set index = index + 1 %}{% endfor %}
      recordings.add(recording);
    } while (results.next());
    return recordings;
  }

  public {{entity}} getById(int id) throws SQLException {
    Connection connectionDatabase = Database.getConnection();

    PreparedStatement queryById = connectionDatabase.prepareStatement(
      "SELECT * FROM {{table_name}} WHERE {{primary_key}} = ?"
    );
    
    queryById.setInt(1, id);

    ResultSet recordings = queryById.executeQuery();

    boolean noRecordingFound = !recordings.next();

    {{entity}} recording = new {{entity}}();

    if (noRecordingFound) return recording;

    recording.set{{pascal_primary_key}}(recordings.getInt("{{primary_key}}"));
    
    {% for  name, details in insert_columns.items() %}recording.set{{details["pascal"]}}(recordings.get{{details["type_pascal"]}}("{{name}}"));
    {% endfor %}
    return recording;
  }

  public void save({{entity}} recording) throws SQLException {
    Connection connectionDatabase = Database.getConnection();

    boolean weEditRecording = recording.get{{pascal_primary_key}}() != 0;

    String queryToExecute = weEditRecording
      ? "UPDATE {{table_name}} SET {{update_elements}} WHERE {{primary_key}} = ?"
      : "INSERT INTO {{table_name}}({{update_columns}}) VALUES({{update_question_marks}})";

    PreparedStatement querySave = connectionDatabase.prepareStatement(queryToExecute);
    {% for  name, details in insert_columns.items() %}querySave.set{{details["type_pascal"]}}({{loop.index}}, recording.get{{details["pascal"]}}());
    {% endfor %}
    if (weEditRecording)
      querySave.setInt({{insert_columns|length + 1}}, recording.get{{pascal_primary_key}}());

    querySave.executeUpdate();
  }

  public void delete(int id) throws SQLException {
    Connection connectionDatabase = Database.getConnection();

    PreparedStatement query = connectionDatabase.prepareStatement(
      "DELETE FROM {{table_name}} WHERE {{primary_key}} = ?"
    );

    query.setInt(1, id); 

    query.executeUpdate();
  }
}
