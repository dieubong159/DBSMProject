package banhaisan.controllers.KiemTraDangNhap;

import banhaisan.models.datahandle.DangNhapService;
import banhaisan.models.datamodels.DangNhap_KetNoi;
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

@WebServlet(name = "DangNhapServlet", urlPatterns = "/Login")
public class DangNhapServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("utf-8");
//        response.setContentType("text/html;charset=UTF-8");
//        DangNhap_KetNoi ketNoi= new DangNhap_KetNoi();
//        ketNoi.setIpAddress(request.getParameter("txt-ip"));
//        ketNoi.setEmail(request.getParameter("txt-email"));
//        ketNoi.setPassWord(request.getParameter("txt-password"));
//
//
////        DangNhapService service= new DangNhapService(ketNoi);
////        try {
//////            service.openConnection();
////        } catch (SQLException | ClassNotFoundException e) {
////            e.printStackTrace();
////        }
//
//
//    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            DangNhap_KetNoi user = new DangNhap_KetNoi();
            user.setEmail(request.getParameter("email"));
            user.setPassWord(request.getParameter("password"));
            String backrefresh = request.getHeader("referer");
            DangNhapService.getInstance().IsLogin(user);

            if(user.isValid())
            {
                if(user.isAdmin())
                {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("currentSessionAdmin",user);
                    session.setAttribute("idcurrentSession",user.getMaNguoiDung());
                    request.setAttribute("loginResult",true);
                    response.sendRedirect("/Admin/QLDanhMuc");
                }
                else
                {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("currentSessionUser",user);
                    session.setAttribute("idcurrentSession",user.getMaNguoiDung());
                    request.setAttribute("loginResult",true);
                    response.sendRedirect(request.getContextPath()+backrefresh);
                }
            }
            else {
                request.setAttribute("loginResult", false);
                response.sendRedirect(request.getContextPath()+backrefresh);
            }
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
    }
}
