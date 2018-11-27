package banhaisan.controllers.thongtinadmin;

import banhaisan.models.datahandle.NguoiDungAdminService;
import banhaisan.models.datahandle.NguoiDungThongThuongService;
import banhaisan.models.datamodels.NguoiDung;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "XemThongTinServlet",urlPatterns = {"/Admin/Profile"})
public class XemThongTinServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String idNguoiDung = session.getAttribute("idcurrentSession").toString();
        if(idNguoiDung == null){
            response.setStatus(400);
            return;
        }
        NguoiDung nd = null;
        NguoiDungAdminService service = new NguoiDungAdminService();
        try {
            nd= service.get(idNguoiDung);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        if(nd == null){
            response.setStatus(400);
            return;
        }
        request.setAttribute("admin", nd);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/ThongTinCaNhan.jsp");
        dispatcher.forward(request, response);
    }
}
