package banhaisan.controllers.nguoidungthongthuong;

import banhaisan.models.datahandle.NguoiDungThongThuongService;
import banhaisan.models.datamodels.NguoiDung;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "XemNguoiDungThongThuongServlet", urlPatterns = {"/Admin/ChiTietNguoiDung"})
public class XemNguoiDungThongThuongServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idNguoiDung = request.getParameter("id");
        if(idNguoiDung == null){
            response.setStatus(400);
            return;
        }
        NguoiDungThongThuongService nguoiDung = new NguoiDungThongThuongService();
        NguoiDung nd = null;
        try {
            nd = nguoiDung.get(idNguoiDung);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        if(nd == null){
            response.setStatus(400);
            return;
        }
        request.setAttribute("nguoiDung", nd);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/ChiTietNguoiDung.jsp");
        dispatcher.forward(request, response);
    }
}
