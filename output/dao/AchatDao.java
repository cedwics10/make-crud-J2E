package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class AchatDao {
    public ArrayList<Achat> getAll() throws SQLException {
      Database.makeConnection();
    Connection connectionDatabase = Database.getConnection();

    ArrayList<Achat> recordings = new ArrayList<Achat>();
    Statement queryAll = connectionDatabase.createStatement();
    ResultSet results = queryAll.executeQuery("SELECT * FROM achat");

    boolean noResultExists = !results.next();

    if (noResultExists)
      return new ArrayList<Achat>

    do {
      Achat recording = new Achat();

      recording.set(results.getach_id());
      
      recording.setAchMethode(results.getString("ach_methode"));
      recording.setAchDate(results.getString("ach_date"));
      recording.setAchUtilisateur(results.getInt("ach_utilisateur"));
      
      recordings.add(recording);
    } while (results.next());
    return recordings;
  }

  public Achat getById(int id) throws SQLException {
    Connection connectionDatabase = Database.getConnection();

    PreparedStatement queryById = connectionDatabase.prepareStatement(
      "SELECT * FROM achat WHERE ach_id = ?"
    );
    
    queryById.setInt(1, id);

    ResultSet recordings = queryById.executeQuery();

    boolean noRecording = !recordings.next();

    Inscription recording = new Inscription();

    if (noRecordingFound) return recording;

    recording.setId(recordings.getInt("ach_id"));
    
    recording.setAchMethode(recordings.setString("ach_methode"));
    recording.setAchDate(recordings.setString("ach_date"));
    recording.setAchUtilisateur(recordings.setInt("ach_utilisateur"));
    
    return recording;
  }

  public void save(Achat recording) throws SQLException {
    Connection connectionDatabase = Database.getConnection();

    boolean weEditRecording = recording.getId() != 0;

    String queryToExecute = weEditRecording
      ? "UPDATE achat SET ach_methode = ?, ach_date = ?, ach_utilisateur = ? WHERE ach_id = ?"
      : "INSERT INTO achat(ach_methode,ach_date,ach_utilisateur) VALUES(?,?,?)";

    PreparedStatement querySave = connectionDatabase.prepareStatement(queryToExecute);
    querySave.setString(1, recordng.getAchMethode());
    querySave.setString(2, recordng.getAchDate());
    querySave.setInt(3, recordng.getAchUtilisateur());
    
    if (weEditRecording)
      querySave.setInt(4, recording.getId());

    querySave.executeUpdate();
  }

  public void delete(int id) throws SQLException {
    Connection connectionDatabase = Database.getConnection();

    PreparedStatement queryDelete = connectionDatabase.prepareStatement(
      "DELETE FROM achat WHERE ach_id = ?"
    );

    queryDelete.setInt(1, id); 

    queryDelete.executeUpdate();
  }
}