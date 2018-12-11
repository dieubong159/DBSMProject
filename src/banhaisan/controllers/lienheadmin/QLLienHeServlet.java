package banhaisan.controllers.lienheadmin;

import banhaisan.models.datahandle.LienHeService;
import banhaisan.models.datamodels.LienHe;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "QLLienHeServlet",urlPatterns = {"/Admin/QLLienHe"})
public class QLLienHeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try
        {
            ArrayList lienHes = LienHeService.getInstance().getData();
            request.setAttribute("lienHes",lienHes);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/QlyLienHe.jsp");
        dispatcher.forward(request,response);
    }
}
