package banhaisan.models.datahandle;

import banhaisan.models.datamodels.DangNhap_KetNoi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class ConnectDatabase {
    protected static String serverName="sa";
    protected static String passWord="12345";



    protected Connection connection = null;

    public void openConnection() throws SQLException, ClassNotFoundException {
            String connectionString = "jdbc:sqlserver://buon-ban-hai-san.database.windows.net:1433;database=HaiSanTuoiSong;user=dieutan1998@buon-ban-hai-san;password=Dieu123456;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(connectionString);
    }

    public void closeConnection() throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }
}
