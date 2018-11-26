package banhaisan.controllers.KiemTraDangNhap;

import sun.plugin.com.Dispatcher;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "DangXuatServlet",urlPatterns = "/Logout")
public class DangXuatServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getHeader("referer");
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect(request.getContextPath()+url);
    }
}
