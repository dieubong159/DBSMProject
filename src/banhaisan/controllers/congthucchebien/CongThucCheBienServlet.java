package banhaisan.controllers.congthucchebien;

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

@WebServlet(name = "CongThucCheBienServlet",urlPatterns = {"/DSBaiViet"})
public class CongThucCheBienServlet extends HttpServlet {
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      try {
          ArrayList<BaiViet> baiViets = BaiVietService.getInstance().getData();
          ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
          ArrayList<BaiViet> baiVietNoiBat = BaiVietService.getInstance().getTop4BaiViet();
          request.setAttribute("baiViets",baiViets);
          request.setAttribute("danhMucs",danhMucs);
          request.setAttribute("baiVietNoiBat",baiVietNoiBat);
      }catch (SQLException | ClassNotFoundException e)
      {
          e.printStackTrace();
      }
      RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DSCongthucchebien.jsp");
      dispatcher.forward(request,response);
    }
}
