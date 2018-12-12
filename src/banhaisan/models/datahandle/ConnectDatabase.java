package banhaisan.models.datahandle;

import banhaisan.models.datamodels.DangNhap_KetNoi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class ConnectDatabase {
    protected static String IP="localhost";
    protected static String serverName="sa";
    protected static String passWord="12345";



    protected Connection connection = null;

    public void openConnection() throws SQLException, ClassNotFoundException {
            String connectionString = "jdbc:sqlserver://"+IP+":1433;database=WebHaiSanTuoiSong;username="+serverName+";password="+passWord;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(connectionString);
    }

    public void closeConnection() throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }
}
