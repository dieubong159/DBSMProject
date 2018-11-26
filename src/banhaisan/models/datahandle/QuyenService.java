package banhaisan.models.datahandle;

import banhaisan.models.datamodels.PhanQuyen;
import banhaisan.models.datamodels.Quyen;
import banhaisan.models.viewmodels.QlyQuyen_ShowTable;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QuyenService extends ConnectDatabase implements Business<Quyen> {
    @Override
    public ArrayList<Quyen> getData() throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public Quyen get(Object... keys) throws SQLException, ClassNotFoundException {
        if(keys.length<=0){
            return null;
        }
        openConnection();

        String sql= "EXEC LayMotQuyen ?";
        PreparedStatement statement= connection.prepareStatement(sql);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1, keys[0].toString());

        ResultSet resultSet= statement.executeQuery();
        Quyen quyen= null;
        if(resultSet.next()){
            quyen=new Quyen();
            quyen.setMaQuyen(resultSet.getString(1));
            quyen.setTenQuyen(resultSet.getString(2));
            quyen.setMaNghiepVu(resultSet.getInt(3));
        }
        closeConnection();
        return quyen;
    }

    @Override
    public int add(Quyen model) throws SQLException, ClassNotFoundException {
        if (model == null) {
            return 0;
        }
        openConnection();

        String sql = "EXEC ThemQuyen ?,?,?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1, model.getMaQuyen());
        statement.setString(2, model.getTenQuyen());
        statement.setInt(3,model.getMaNghiepVu());

        int rowAffected = statement.executeUpdate();
        closeConnection();
        return rowAffected;
    }

    @Override
    public int delete(Quyen model) throws SQLException, ClassNotFoundException {
        return 0;
    }

    @Override
    public int modify(Quyen model) throws SQLException, ClassNotFoundException {
        if (model == null) {
            return 0;
        }
        openConnection();

        String sql = "EXEC SuaQuyen ?,?,?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1,model.getMaQuyen());
        statement.setString(2,model.getTenQuyen());
        statement.setInt(3,model.getMaNghiepVu());

        int rowAffected = statement.executeUpdate();
        closeConnection();
        return rowAffected;
    }

    public ArrayList<QlyQuyen_ShowTable> getDataTable() throws SQLException, ClassNotFoundException {
        ArrayList<QlyQuyen_ShowTable> quyens= new ArrayList<>();
        openConnection();

        String sql = "EXEC LayQuyen";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()){
            QlyQuyen_ShowTable quyen= new QlyQuyen_ShowTable();
            quyen.setMaQuyen(resultSet.getString(1));
            quyen.setTenQuyen(resultSet.getString(2));
            quyen.setTenNghiepVu(resultSet.getString(3));

            quyens.add(quyen);
        }
        closeConnection();
        return quyens;
    }
    public int CheckPhanQuyen(String maQuyen,String maNguoiDung, boolean check) throws SQLException, ClassNotFoundException {
        openConnection();
        String sql = "EXEC PhanQuyenAdmin ?,?,?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1,maQuyen);
        statement.setString(2,maNguoiDung);
        statement.setBoolean(3,check);

        PhanQuyen phanQuyen=new PhanQuyen();
        Integer res = statement.executeUpdate();
        closeConnection();
        return res;
    }

    public int ganQuyen(String maQuyen, String maNguoiDung) throws SQLException, ClassNotFoundException {
        openConnection();
        String sql = "EXEC GanQuyen ?,?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1,maQuyen);
        statement.setString(2,maNguoiDung);
        int res = statement.executeUpdate();
        closeConnection();
        return res;
    }

    public int xoaQuyen(String maQuyen, String manguoiDung) throws SQLException, ClassNotFoundException {
        openConnection();
        String sql = "EXEC XoaQuyen ?,?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, maQuyen);
        statement.setString(2, manguoiDung);
        int res = statement.executeUpdate();
        closeConnection();
        return res;
    }

    public ArrayList<Quyen> LayQuyenCuaNghiepVu(int manghiepvu) throws SQLException, ClassNotFoundException {
        openConnection();
        String sql = "select * from layQuyenCuanghiepVu(?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, manghiepvu);
        ResultSet res = statement.executeQuery();
        ArrayList<Quyen> quyens = new ArrayList<>();
        while (res.next()) {
            Quyen q = new Quyen();
            q.setMaQuyen(res.getString(1));
            quyens.add(q);
        }
        closeConnection();
        return quyens;
    }
}
