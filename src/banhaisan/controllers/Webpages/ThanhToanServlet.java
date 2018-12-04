package banhaisan.controllers.Webpages;

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

@WebServlet(name = "ThanhToanServlet",urlPatterns = {"/ThanhToanDonHang"})
public class ThanhToanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idNguoiDung = session.getAttribute("idcurrentSession").toString();
        if (session.getAttribute("idcurrentSession") != null) {
            NguoiDung nd = null;
            try {
                nd = NguoiDungThongThuongService.getInstance().get(idNguoiDung);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            if (nd == null) {
                response.setStatus(400);
                return;
            }
            request.setAttribute("nguoiDung", nd);
        }else {
            response.sendRedirect("/ShoppingCart?action=checkout");
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Thanhtoandonhang.jsp");
        dispatcher.forward(request,response);
    }
}
