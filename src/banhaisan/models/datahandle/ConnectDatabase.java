package banhaisan.models.datahandle;

import banhaisan.models.datamodels.DangNhap_KetNoi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class ConnectDatabase {
    protected static String serverName="sa";
    protected static String passWord="123456789";



    protected Connection connection = null;

    public void openConnection() throws SQLException, ClassNotFoundException {
            String connectionString = "jdbc:sqlserver://buonbanhaisan-webapp.clpluyptqi3c.us-east-1.rds.amazonaws.com:1433;databaseName=WebHaiSanTuoiSong-Restore;user=sa;password=123456789;useUnicode=true;characterEncoding=UTF-8";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(connectionString);
    }

    public void closeConnection() throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }
}
