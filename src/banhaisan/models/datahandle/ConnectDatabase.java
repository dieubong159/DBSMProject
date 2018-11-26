package banhaisan.models.datahandle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class ConnectDatabase {
    protected String IP;
    protected String serverName;
    protected String passWord;

    private final String connectionString = "jdbc:sqlserver://localhost:1433;database=WebHaiSanTuoiSong;username=sa;password=12345";

    protected Connection connection = null;

    public void openConnection() throws SQLException, ClassNotFoundException {
//        String connectionString = "jdbc:sqlserver://"+ IP +";database=WebHaiSanTuoiSong;username="+ serverName +";password="+ passWord +"";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        connection = DriverManager.getConnection(connectionString);
    }

    public void closeConnection() throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }
}
