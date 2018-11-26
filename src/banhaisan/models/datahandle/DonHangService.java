package banhaisan.models.datahandle;

import banhaisan.models.datamodels.DonHang;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DonHangService extends ConnectDatabase implements Business<DonHang>{
    private static final DonHangService instance = new DonHangService();
    private DonHangService(){}
    public static DonHangService getInstance(){
        return instance;
    }
    @Override
    public ArrayList<DonHang> getData() throws SQLException, ClassNotFoundException {
        ArrayList<DonHang> donHangs = new ArrayList<>();
        openConnection();

        String query = "EXEC DonHangBaoGomTongTien";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next())
        {
            DonHang donHang = new DonHang();
            donHang.setMaDonHang(resultSet.getString(1));
            donHang.setDiaChiGiaoHang(resultSet.getString(2));
            donHang.setGhiChu(resultSet.getString(3));
            donHang.setHinhThucThanhToan(resultSet.getBoolean(4));
            donHang.setNgayDatHang(resultSet.getDate(5));
            donHang.setTinhTrang(resultSet.getString(6));
            donHang.setMaNguoiDung(resultSet.getString(7));
            donHang.setTongTien(Double.parseDouble(resultSet.getString(8)));

            donHangs.add(donHang);
        }
        closeConnection();
        return donHangs;
    }

    @Override
    public DonHang get(Object... keys) throws SQLException, ClassNotFoundException {
        return null;
    }
    public ArrayList<DonHang> getDSDonHang(Object... keys) throws SQLException, ClassNotFoundException{
        if(keys.length<=0){
            return null;
        }
        ArrayList<DonHang> donHangs = new ArrayList<>();
        openConnection();
        String query = "EXEC LayMotDonHang ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1,keys[0].toString());

        ResultSet resultSet= statement.executeQuery();
        while (resultSet.next())
        {
            DonHang donHang = new DonHang();
            donHang.setMaDonHang(resultSet.getString(1));
            donHang.setMaSP(resultSet.getString(2));
            donHang.setTenSP(resultSet.getString(3));
            donHang.setSoLuong(Integer.parseInt(resultSet.getString(4)));
            donHang.setGia(Double.parseDouble(resultSet.getString(5)));
            donHangs.add(donHang);
        }
        closeConnection();
        return donHangs;
    }
    @Override
    public int add(DonHang model) throws SQLException, ClassNotFoundException {
        return 0;
    }

    @Override
    public int delete(DonHang donHang) throws SQLException, ClassNotFoundException {
        openConnection();

        String query = "EXEC XoaDonHang ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1,donHang.getMaDonHang());

        int RowAffected = statement.executeUpdate();
        closeConnection();
        return RowAffected;
    }

    @Override
    public int modify(DonHang model) throws SQLException, ClassNotFoundException {
        return 0;
    }
}
