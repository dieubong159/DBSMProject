package banhaisan.models.datahandle;

import banhaisan.models.datamodels.LienHe;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class LienHeService extends ConnectDatabase implements Business<LienHe>{
    private static final LienHeService instance = new LienHeService();
    private LienHeService(){}
    public static LienHeService getInstance(){
        return instance;
    }
    @Override
    public ArrayList<LienHe> getData() throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public LienHe get(Object... keys) throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public int add(LienHe lienHe) throws SQLException, ClassNotFoundException {
        openConnection();
        String query = "exec ThemLienHe ?,?,?,?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);
        statement.setString(1,lienHe.getTenNguoiDung());
        statement.setString(2,lienHe.getEmail());
        statement.setString(3,lienHe.getSdt());
        statement.setString(4,lienHe.getNoiDung());

        int RowAffected = statement.executeUpdate();
        closeConnection();
        return RowAffected;
    }

    @Override
    public int delete(LienHe model) throws SQLException, ClassNotFoundException {
        return 0;
    }

    @Override
    public int modify(LienHe model) throws SQLException, ClassNotFoundException {
        return 0;
    }
}
