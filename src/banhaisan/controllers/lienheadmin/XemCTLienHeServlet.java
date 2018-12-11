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

@WebServlet(name = "XemCTLienHeServlet",urlPatterns = {"/Admin/XemCTLienHe"})
public class XemCTLienHeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LienHe lienHe = new LienHe();
        String idLienHe = request.getParameter("idLH");
        if(idLienHe==null)
        {
            response.setStatus(400);
            return;
        }
        lienHe.setMaLienHe(idLienHe);
        try {
            lienHe = LienHeService.getInstance().get(lienHe);
            request.setAttribute("CTLienHe",lienHe);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        if(lienHe==null)
        {
            response.setStatus(400);
            return;
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/ChiTietLienHe.jsp");
        dispatcher.forward(request,response);
    }
}
