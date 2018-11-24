package banhaisan.controllers.KiemTraDangNhap;

import banhaisan.models.datahandle.DangNhapService;
import banhaisan.models.datamodels.DangNhap_KetNoi;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DangNhapServlet", urlPatterns = "/KetNoi")
public class DangNhapServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        DangNhap_KetNoi ketNoi= new DangNhap_KetNoi();
        ketNoi.setIpAddress(request.getParameter("txt-ip"));
        ketNoi.setEmail(request.getParameter("txt-email"));
        ketNoi.setPassWord(request.getParameter("txt-password"));


        DangNhapService service= new DangNhapService(ketNoi);
        try {
            service.openConnection();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
