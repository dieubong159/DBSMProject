package banhaisan.models.datahandle;

import banhaisan.models.datamodels.HinhAnh;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class HinhAnhService extends ConnectDatabase implements Business<HinhAnh>{


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
        openConnection();

        String query = "EXEC ThemHinhAnh ?,?,?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);
        statement.setString(1, hinhAnh.getMaSP_BV());
        statement.setString(2,String.valueOf(hinhAnh.isLoai()));
        statement.setString(3,hinhAnh.getUrl());

        int rowAffected = statement.executeUpdate();
        closeConnection();
        return rowAffected;
    }

    @Override
    public int delete(HinhAnh model) throws SQLException, ClassNotFoundException {
        return 0;
    }

    @Override
    public int modify(HinhAnh model) throws SQLException, ClassNotFoundException {
        return 0;
    }
}
