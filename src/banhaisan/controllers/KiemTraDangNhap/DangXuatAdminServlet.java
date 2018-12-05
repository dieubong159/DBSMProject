package banhaisan.controllers.KiemTraDangNhap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "DangXuatAdminServlet",urlPatterns = {"/LogoutAdmin"})
public class DangXuatAdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("idcurrentSession");
        session.removeAttribute("currentSessionUser");
        response.sendRedirect("/Index");
    }
}
