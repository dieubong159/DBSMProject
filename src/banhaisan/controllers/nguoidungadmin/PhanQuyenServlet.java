package banhaisan.controllers.nguoidungadmin;

import banhaisan.models.datahandle.QuyenService;
import banhaisan.models.datamodels.Quyen;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "PhanQuyenServlet", urlPatterns = {"/Admin/PhanQuyen"})
public class PhanQuyenServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String ma = request.getParameter("txtMa");
            String[] quyens = request.getParameterValues("quyen");
            String maNghiepVu = request.getParameter("category");
            QuyenService quyenService = new QuyenService();
            ArrayList<Quyen> quyens1 = quyenService.LayQuyenCuaNghiepVu(Integer.parseInt(maNghiepVu));
            for (Quyen q : quyens1) {
                boolean flag = false;
                if (quyens != null)
                    for (String quyen : quyens) {
                        if (q.getMaQuyen().trim().equals(quyen)) {
                            flag = true;
                            break;
                        }
                    }
                if (flag) {
                    quyenService.ganQuyen(q.getMaQuyen(), ma);
                } else {
                    quyenService.xoaQuyen(q.getMaQuyen(), ma);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("/Admin/NguoiDungAdmin");
    }

}