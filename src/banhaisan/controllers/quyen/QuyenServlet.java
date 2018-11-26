package banhaisan.controllers.quyen;

import banhaisan.models.datahandle.QuyenService;
import banhaisan.models.datamodels.Quyen;
import banhaisan.models.viewmodels.QlyQuyen_ShowTable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "QuyenServlet" , urlPatterns = { "/Admin/QlyQuyen" })
public class QuyenServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            QuyenService service = new QuyenService();
            ArrayList<QlyQuyen_ShowTable> quyens = null;
            quyens = service.getDataTable();
            request.setAttribute("quyens", quyens);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/QlyQuyen.jsp");
        dispatcher.forward(request, response);
    }
}
