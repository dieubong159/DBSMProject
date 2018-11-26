package banhaisan.controllers.quyen;

import banhaisan.models.datahandle.QuyenService;
import banhaisan.models.datamodels.Quyen;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SuaQuyenServlet" ,urlPatterns = "/Admin/ChinhSuaQuyen")
public class SuaQuyenServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        Quyen quyen= new Quyen();
        quyen.setMaQuyen(request.getParameter("txt-ma-quyen"));
        quyen.setTenQuyen(request.getParameter("txt-ten-quyen"));

        QuyenService service= new QuyenService();
        try {
            service.modify(quyen);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/Admin/ChinhSuaQuyen");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idQuyen= request.getParameter("id");
        if(idQuyen==null){
            response.setStatus(400);
            return;
        }
        QuyenService service= new QuyenService();

    }
}
