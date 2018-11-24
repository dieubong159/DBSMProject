package banhaisan.controllers.sanphamnguoidung;

import banhaisan.models.datahandle.BaiVietService;
import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.SanPhamService;
import banhaisan.models.datamodels.BaiViet;
import banhaisan.models.datamodels.DanhMuc;
import banhaisan.models.datamodels.SanPham;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "SanPhamUserServlet", urlPatterns = {"/Products"})
public class SanPhamUserServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idDanhMuc = request.getParameter("idDM");
        if(idDanhMuc==null)
        {
            response.setStatus(400);
            return;
        }
        ArrayList<SanPham> sanPhams = null;
        try {
            sanPhams = SanPhamService.getInstance().getDataCategory(idDanhMuc);
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            ArrayList<BaiViet> baiViets = BaiVietService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);
            request.setAttribute("baiViets",baiViets);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        if(sanPhams==null)
        {
            response.setStatus(400);
            return;
        }
        request.setAttribute("sanPhams",sanPhams);
        HttpSession session = request.getSession();
        session.setAttribute("maDanhMuc",idDanhMuc);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Products.jsp");
        dispatcher.forward(request,response);
    }
}
