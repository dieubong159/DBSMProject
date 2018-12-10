package banhaisan.models.datahandle;

import banhaisan.models.datamodels.HinhAnh;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class HinhAnhService extends ConnectDatabase implements Business<HinhAnh>{
    private static final HinhAnhService instance = new HinhAnhService();
    private HinhAnhService(){}
    public static HinhAnhService getInstance(){
        return instance;
    }
    @Override
    public ArrayList<HinhAnh> getData() throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public HinhAnh get(Object... keys) throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public int add(HinhAnh hinhAnh) throws SQLException, ClassNotFoundException {
        return 0;
    }

    @Override
    public int delete(HinhAnh model) throws SQLException, ClassNotFoundException {
        return 0;
    }

    @Override
    public int modify(HinhAnh model) throws SQLException, ClassNotFoundException {
        return 0;
    }
    public ArrayList<HinhAnh> LayTatCaHinhAnhSanPham (String maSP) throws SQLException, ClassNotFoundException {
        openConnection();
        String query = "select * from fc_LayTatCaHinhAnhSP (?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1, maSP);
        ArrayList<HinhAnh> hinhAnhs = new ArrayList<>();

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next())
        {
            HinhAnh hinhAnh = new HinhAnh();
            hinhAnh.setMaSP_BV(resultSet.getString(1));
            hinhAnh.setUrl(resultSet.getString(2));

            hinhAnhs.add(hinhAnh);
        }
        closeConnection();
        return hinhAnhs;
    }
    public ArrayList<HinhAnh> LayTatCaHinhAnhBaiViet (String maBV) throws SQLException, ClassNotFoundException {
        openConnection();
        String query = "select * from fc_LayTatCaHinhAnhBV (?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1, maBV);
        ArrayList<HinhAnh> hinhAnhs = new ArrayList<>();

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next())
        {
            HinhAnh hinhAnh = new HinhAnh();
            hinhAnh.setMaSP_BV(resultSet.getString(1));
            hinhAnh.setUrl(resultSet.getString(2));

            hinhAnhs.add(hinhAnh);
        }
        closeConnection();
        return hinhAnhs;
    }

    public HinhAnh LayMotHinhAnhBaiViet (String maBV) throws SQLException, ClassNotFoundException {
        openConnection();
        String query = "select * from fc_LayMotHinhAnhBV (?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1, maBV);

        ResultSet resultSet = statement.executeQuery();
        HinhAnh hinhAnh = null;
        if (resultSet.next())
        {
            hinhAnh = new HinhAnh();
            hinhAnh.setMaSP_BV(resultSet.getString(1));
            hinhAnh.setUrl(resultSet.getString(2));
        }
        closeConnection();
        return hinhAnh;
    }
    public HinhAnh LayMotHinhAnhSanPham (String maSP) throws SQLException, ClassNotFoundException {
        openConnection();
        String query = "select * from fc_LayMotHinhAnhSP (?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1, maSP);

        ResultSet resultSet = statement.executeQuery();
        HinhAnh hinhAnh = null;
        if (resultSet.next())
        {
            hinhAnh = new HinhAnh();
            hinhAnh.setMaSP_BV(resultSet.getString(1));
            hinhAnh.setUrl(resultSet.getString(2));
        }
        closeConnection();
        return hinhAnh;
    }
}
