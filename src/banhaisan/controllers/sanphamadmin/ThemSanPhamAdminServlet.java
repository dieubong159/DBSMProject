package banhaisan.controllers.sanphamadmin;

import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.SanPhamService;
import banhaisan.models.datamodels.DanhMuc;
import banhaisan.models.datamodels.SanPham;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
@WebServlet(name = "ThemSanPhamAdminServlet", urlPatterns = {"/Admin/THMSanPham"})
public class ThemSanPhamAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            SanPham sanPham = new SanPham();
            sanPham.setMaSP(request.getParameter("txtMaSP"));
            sanPham.setTenSP(request.getParameter("txtTenSP"));
            sanPham.setGiaSP(Double.parseDouble(request.getParameter("txtGiaSP")));
            sanPham.setPhanTramKhuyenMai(Integer.parseInt(request.getParameter("txtPhanTramKhuyenMai")));
            sanPham.setXuatXu(request.getParameter("txtXuatXu"));
            sanPham.setMoTa(request.getParameter("txtMoTa"));
            sanPham.setMaDanhMuc(request.getParameter("txtMaDanhMuc"));

            SanPhamService.getInstance().add(sanPham);
        }catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        HttpSession session = request.getSession(false);
        response.sendRedirect("/Admin/QLSanPham?idDM="+session.getAttribute("maDanhMuc"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher =  getServletContext().getRequestDispatcher("/Admin/TMSanPham.jsp");
        dispatcher.forward(request,response);
    }
}
