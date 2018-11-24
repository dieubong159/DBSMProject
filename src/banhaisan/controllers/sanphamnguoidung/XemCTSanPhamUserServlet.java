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
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "XemCTSanPhamUserServlet",urlPatterns = {"/CTSanPham"})
public class XemCTSanPhamUserServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idSanPham = request.getParameter("idSP");
        if(idSanPham==null)
        {
            response.setStatus(400);
            return;
        }
        SanPham sp = null;
        try {
            sp= SanPhamService.getInstance().get(idSanPham);
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            ArrayList<SanPham> sanPhamLQ = SanPhamService.getInstance().getDataCategoryIndex(sp.getMaDanhMuc());
            ArrayList<BaiViet> baiViets= BaiVietService.getInstance().getData();
            request.setAttribute("sanPhamLQ",sanPhamLQ);
            request.setAttribute("danhMucs",danhMucs);
            request.setAttribute("baiViets",baiViets);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        if(sp==null)
        {
            response.setStatus(400);
            return;
        }
        request.setAttribute("sanPham",sp);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ChiTietSP.jsp");
        dispatcher.forward(request,response);
    }
}
