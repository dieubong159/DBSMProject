package banhaisan.controllers.baiviet;

import banhaisan.models.datahandle.BaiVietService;
import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datamodels.BaiViet;
import banhaisan.models.datamodels.DanhMuc;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "ThemBaiVietServlet" , urlPatterns = "/Admin/TMBaiViet")
public class ThemBaiVietServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        BaiViet baiViet= new BaiViet();
        baiViet.setMaBaiViet(request.getParameter("txt-ma-bai-viet"));
        baiViet.setTieuDe(request.getParameter("txt-tieu-de"));
        baiViet.setMaDanhMuc(request.getParameter("txtMaDanhMuc"));
        baiViet.setNoiDung(request.getParameter("text-noi-dung"));
        Date ngayDangBai= new Date();
        baiViet.setNgayDang(new java.sql.Date(ngayDangBai.getTime()));


        try {
            BaiVietService.getInstance().add(baiViet);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        response.sendRedirect("/Admin/QlyBaiViet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher =  getServletContext().getRequestDispatcher("/Admin/TMBaiViet.jsp");
        dispatcher.forward(request,response);
    }
}
