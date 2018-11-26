package banhaisan.controllers.nguoidungadmin;

import banhaisan.models.datahandle.NguoiDungAdminService;
import banhaisan.models.datamodels.NguoiDung;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "NguoiDungAdminServlet", urlPatterns = { "/Admin/NguoiDungAdmin" })
public class NguoiDungAdminServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            NguoiDungAdminService service= new NguoiDungAdminService();
            ArrayList<NguoiDung> nguoiDungs= service.getData();

            request.setAttribute("nguoiDungs" , nguoiDungs);

        } catch (SQLException | ClassNotFoundException e){

            e.printStackTrace();
        }

        RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/Admin/QlyAdmin.jsp");
        dispatcher.forward(request,response);
    }
}
