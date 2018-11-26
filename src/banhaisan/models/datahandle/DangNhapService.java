package banhaisan.models.datahandle;

import banhaisan.models.datahandle.ConnectDatabase;
import banhaisan.models.datamodels.DangNhap_KetNoi;
import banhaisan.models.datamodels.NguoiDung;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DangNhapService extends ConnectDatabase {
    private static final DangNhapService instance = new DangNhapService();
    private DangNhapService(){}
    public static DangNhapService getInstance(){
        return instance;
    }

    public DangNhap_KetNoi IsLogin(DangNhap_KetNoi dangNhap_ketNoi) throws SQLException,ClassNotFoundException {
        openConnection();
        String email = dangNhap_ketNoi.getEmail();
        String password = dangNhap_ketNoi.getPassWord();
        String query = "SELECT * FROM dbo.fc_KiemTraDangNhap(?,?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1,email);
        statement.setString(2,password);

        ResultSet resultSet = statement.executeQuery();
        if(resultSet.next())
        {
            dangNhap_ketNoi.setMaNguoiDung(resultSet.getString(1));
            dangNhap_ketNoi.setHoTen(resultSet.getString(2));
            dangNhap_ketNoi.setEmail(resultSet.getString(3));
            dangNhap_ketNoi.setPassWord(resultSet.getString(4));
            dangNhap_ketNoi.setAdmin(resultSet.getBoolean(5));
            dangNhap_ketNoi.setValid(true);
        }
        else{
            System.out.println("Xin loi, hinh nhu ban chua co tai khoan!");
            dangNhap_ketNoi.setValid(false);
        }
        closeConnection();
        return dangNhap_ketNoi;
    }
}
