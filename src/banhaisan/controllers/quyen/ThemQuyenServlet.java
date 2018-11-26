package banhaisan.controllers.quyen;

import banhaisan.models.datahandle.QuyenService;
import banhaisan.models.datamodels.Quyen;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ThemQuyenServlet" , urlPatterns = { "/Admin/TMQuyen" })
public class ThemQuyenServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        Quyen quyens= new Quyen();
        quyens.setMaQuyen(request.getParameter("txt-ma-quyen"));
        quyens.setTenQuyen(request.getParameter("txt-ten-quyen"));

        QuyenService quyenservice= new QuyenService();
        Quyen quyen= null;
        try {
            quyenservice.add(quyens);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/Admin/TMQuyen");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/TMQuyen.jsp");
        dispatcher.forward(request, response);
    }
}
