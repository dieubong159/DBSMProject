package banhaisan.controllers.lienheadmin;

import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.LienHeService;
import banhaisan.models.datamodels.DanhMuc;
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
import java.util.List;

@WebServlet(name = "QLLienHeServlet",urlPatterns = {"/Admin/QLLienHe"})
public class QLLienHeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        int ipage = 1;
        if(page != null)
            ipage=Integer.parseInt(page);
        try
        {
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);
            //ArrayList lienHes = LienHeService.getInstance().getData();
            List<LienHe> lienHes = LienHeService.getInstance().getLienHe((ipage-1)*10);
            int numRecord = LienHeService.getInstance().getNumOfRecord();
            request.setAttribute("numOfRecord",numRecord);

            request.setAttribute("lienHes",lienHes);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/QlyLienHe.jsp?page=" + ipage);
        dispatcher.forward(request,response);
    }
}
