package banhaisan.models.datahandle;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class SanPhamService extends ConnectDatabase implements Business<banhaisan.models.datamodels.SanPham>{
    private static final SanPhamService instance = new SanPhamService();
    private SanPhamService(){}
    public static SanPhamService getInstance()
    {
        return instance;
    }

    @Override
    public ArrayList<banhaisan.models.datamodels.SanPham> getData() throws SQLException, ClassNotFoundException {
        ArrayList<banhaisan.models.datamodels.SanPham> sanPhams = new ArrayList<>();
        openConnection();

        String query = "select  * from dbo.fc_DanhSachSanPhamTheoDanhMuc ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()){
            banhaisan.models.datamodels.SanPham sanPham = new banhaisan.models.datamodels.SanPham();
            sanPham.setMaSP(resultSet.getString(1));
            sanPham.setTenSP(resultSet.getString(2));
            sanPham.setGiaSP(Double.parseDouble(resultSet.getString(3)));
            sanPham.setPhanTramKhuyenMai(Integer.parseInt(resultSet.getString(4)));
            sanPham.setXuatXu(resultSet.getString(5));
            sanPham.setMaDanhMuc(resultSet.getString(7));
            sanPham.setNgayNhap(resultSet.getDate(8));

            sanPhams.add(sanPham);
        }
        closeConnection();
        return sanPhams;
    }

    public ArrayList<banhaisan.models.datamodels.SanPham> getDataCategory(Object... keys) throws SQLException, ClassNotFoundException{
        if(keys.length<=0)
        {
            return null;
        }
        ArrayList<banhaisan.models.datamodels.SanPham> sanPhams = new ArrayList<>();
        openConnection();
        String query = "select  * from dbo.fc_DanhSachSanPhamTheoDanhMuc(?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);
        statement.setString(1,keys[0].toString());

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next())
        {
            banhaisan.models.datamodels.SanPham sanPham = new banhaisan.models.datamodels.SanPham();
            sanPham.setMaDanhMuc(resultSet.getString(1));
            sanPham.setMaSP(resultSet.getString(2));
            sanPham.setTenSP(resultSet.getString(3));
            sanPham.setGiaSP(Double.parseDouble(resultSet.getString(4)));
            sanPham.setPhanTramKhuyenMai(Integer.parseInt(resultSet.getString(5)));
            sanPham.setXuatXu(resultSet.getString(6));
            sanPham.setNgayNhap(resultSet.getDate(7));

            sanPhams.add(sanPham);
        }
        closeConnection();
        return sanPhams;
    }
    public ArrayList<banhaisan.models.datamodels.SanPham> getDataCategoryIndex(Object... keys) throws SQLException, ClassNotFoundException{
        if(keys.length<=0)
        {
            return null;
        }
        ArrayList<banhaisan.models.datamodels.SanPham> sanPhams = new ArrayList<>();
        openConnection();
        String query = "select  * from dbo.fc_IndexDSSanPham(?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);
        statement.setString(1,keys[0].toString());

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next())
        {
            banhaisan.models.datamodels.SanPham sanPham = new banhaisan.models.datamodels.SanPham();
            sanPham.setMaSP(resultSet.getString(1));
            sanPham.setTenSP(resultSet.getString(2));
            sanPham.setGiaSP(Double.parseDouble(resultSet.getString(3)));

            sanPhams.add(sanPham);
        }
        closeConnection();
        return sanPhams;
    }
    @Override
    public banhaisan.models.datamodels.SanPham get(Object... keys) throws SQLException, ClassNotFoundException{
        if(keys.length<=0){
            return null;
        }
        openConnection();
        String query = "select * from dbo.fc_ChiTietSanPham(?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);
        statement.setString(1,keys[0].toString());

        ResultSet resultSet = statement.executeQuery();
        banhaisan.models.datamodels.SanPham sanPham = null;
        if(resultSet.next())
        {
            sanPham = new banhaisan.models.datamodels.SanPham();
            sanPham.setMaDanhMuc(resultSet.getString(1));
            sanPham.setMaSP(resultSet.getString(2));
            sanPham.setTenSP(resultSet.getString(3));
            sanPham.setGiaSP(Double.parseDouble(resultSet.getString(4)));
            sanPham.setPhanTramKhuyenMai(Float.parseFloat(resultSet.getString(5)));
            sanPham.setXuatXu(resultSet.getString(6));
            sanPham.setMoTa(resultSet.getString(7));

        }
        closeConnection();
        return sanPham;
    }


    @Override
    public int add(banhaisan.models.datamodels.SanPham sanPham) throws SQLException, ClassNotFoundException {
        openConnection();

        String query = "EXEC ThemSanPham ?,?,?,?,?,?,?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1,sanPham.getMaSP());
        statement.setString(2,sanPham.getTenSP());
        statement.setDouble(3,sanPham.getGiaSP());
        statement.setFloat(4,sanPham.getPhanTramKhuyenMai());
        statement.setString(5,sanPham.getXuatXu());
        statement.setString(6,sanPham.getMoTa());
        statement.setString(7,sanPham.getMaDanhMuc());

        int rowAffected = statement.executeUpdate();
        closeConnection();
        return rowAffected;
    }

    @Override
    public int delete(banhaisan.models.datamodels.SanPham sanPham) throws SQLException, ClassNotFoundException {
        openConnection();

        String query = "EXEC XoaSanPham ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1, sanPham.getMaSP());

        int rowAffected = statement.executeUpdate();
        closeConnection();
        return rowAffected;
    }

    @Override
    public int modify(banhaisan.models.datamodels.SanPham sanPham) throws SQLException, ClassNotFoundException {
        openConnection();

        String query = "EXEC SuaSanPham ?,?,?,?,?,?,?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1,sanPham.getMaSP());
        statement.setString(2,sanPham.getTenSP());
        statement.setDouble(3,sanPham.getGiaSP());
        statement.setFloat(4,sanPham.getPhanTramKhuyenMai());
        statement.setString(5,sanPham.getXuatXu());
        statement.setString(6,sanPham.getMoTa());
        statement.setString(7,sanPham.getMaDanhMuc());

        int rowAffected = statement.executeUpdate();
        closeConnection();
        return rowAffected;
    }

}
