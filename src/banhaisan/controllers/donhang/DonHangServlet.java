package banhaisan.controllers.donhang;

import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.DonHangService;
import banhaisan.models.datamodels.DanhMuc;
import banhaisan.models.datamodels.DonHang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "DonHangServlet", urlPatterns = {"/Admin/QLDonHang"})
public class DonHangServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            ArrayList<DonHang> donHangs = DonHangService.getInstance().getData();
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);
            request.setAttribute("donHangs",donHangs);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher =getServletContext().getRequestDispatcher("/Admin/QlyDonHang.jsp");
        dispatcher.forward(request,response);
    }
}
