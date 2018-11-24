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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "SuaNguoiDungThongThuongServlet",urlPatterns = { "/Admin/ChinhSuaNguoiDung" })
public class SuaNguoiDungThongThuongServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        NguoiDung nguoiDung= new NguoiDung();
        nguoiDung.setMaNguoiDung(request.getParameter("txtMaNguoiDung"));
        nguoiDung.setHoTen(request.getParameter("txt-ten"));
        nguoiDung.setGioiTinh(request.getParameter("txt-gioi-tinh").trim().equals("1"));
        nguoiDung.setEmail(request.getParameter("txt-email"));
        nguoiDung.setSdt(request.getParameter("txt-dien-thoai"));
        nguoiDung.setDiaChi(request.getParameter("txt-dia-chi"));
        Date ngaySinh = null;
        if (request.getParameter("dt-ngay-sinh") != null) {
            try {
                ngaySinh = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dt-ngay-sinh"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        nguoiDung.setNgaySinh(new java.sql.Date(ngaySinh.getTime()));
        nguoiDung.setMatKhau(request.getParameter("txt-mat-khau"));

        NguoiDungThongThuongService nguoiDungThongThuongs= new NguoiDungThongThuongService();
        NguoiDung nd=null;
        try {
            nguoiDungThongThuongs.modify(nguoiDung);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/Admin/NguoiDungThongThuong");

    }

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
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        if(nd == null){
            response.setStatus(400);
            return;
        }
        request.setAttribute("nguoiDung", nd);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/ChinhSuaNguoiDung.jsp");
        dispatcher.forward(request, response);
    }
}
