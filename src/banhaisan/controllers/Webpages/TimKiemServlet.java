package banhaisan.controllers.Webpages;

import banhaisan.models.datahandle.SanPhamService;
import banhaisan.models.datamodels.SanPham;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "TimKiemServlet",urlPatterns = {"/TimKiem"})
public class TimKiemServlet extends HttpServlet {

    private static final Pattern inputPattern = Pattern.compile("^[a-zA-Z0-9_.-]*$");
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("search");
        if (keyword==null)
        {
            response.setStatus(400);
            return;
        }
        try {
            if(!inputPattern.matcher(keyword).matches()){
                keyword = "nọthing";
            }
            ArrayList<SanPham> sanPhams = SanPhamService.getInstance().timkiemSanPham(keyword);
            request.setAttribute("sanPhams",sanPhams);
            request.setAttribute("keyword",keyword);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/TimKiem.jsp");
        dispatcher.forward(request,response);
    }
}
