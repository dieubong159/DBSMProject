<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Xem Đơn hàng</title>
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
    <script src="vendors/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="/Admin/TrangChuAdmin">TieuDanSeaFood</a>
            <div class="nav-collapse collapse">
                <ul class="nav pull-right">
                    <li class="dropdown">
                        <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i>${currentSessionAdmin.hoTen}<i class="caret"></i>

                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a tabindex="-1" href="/Admin/Profile">Thông tin cá nhân</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a tabindex="-1" href="/LogoutAdmin">Đăng xuất</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav">
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">Quản lý Người dùng <b
                                class="caret"></b>
                        </a>
                        <ul class="dropdown-menu" id="menu2">
                            <li>
                                <a href="/Admin/NguoiDungThongThuong">Người dùng thông thường</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="/Admin/NguoiDungAdmin">Admin</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="/Admin/QLSanPham" data-toggle="dropdown" class="dropdown-toggle">Quản lý Sản phẩm
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu" id="menu1">
                            <c:forEach var="danhMuc" items="${requestScope.danhMucs}">
                                <li>
                                    <a href="QLSanPham?idDM=${danhMuc.maDanhmuc}">${danhMuc.tenDanhmuc}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li>
                        <a href="/Admin/QlyBaiViet">Quản lý Bài Viết</a>
                    </li>
                    <li>
                        <a href="/Admin/QLDanhMuc">Quản lý Danh mục</a>
                    </li>
                    <li>
                        <a href="/Admin/QLDonHang">Quản lý Đơn hàng</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="container">
        <div class="row-fluid">
            <!-- block -->
            <div class="block">
                <div class="navbar navbar-inner block-header" style="text-align:center">
                    <div class="muted pull-left">QUẢN LÍ ĐƠN HÀNG</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <form id="form_sample_1" class="form-horizontal" style="width:80%;margin:0 auto;"
                              method="post">
                            <div class="control-group">
                                <div style="float:left;width:50%;">
                                    <label class="control-label">Mã liên hệ:</label>
                                    <div class="controls">
                                        <input readonly id="txt-tinh-trang" type="text" name="txt-tinh-trang"
                                               data-required="1" class="span6 m-wrap"
                                               style="width:285px !important;"/>

                                    </div>
                                </div>
                                <div style="float: right;width:50%;">
                                    <label class="control-label">Tên người dùng:</label>
                                    <div class="controls">
                                        <input readonly id="txt-ngay-dat-hang" type="text" name="txt-ngay-dat-hang"
                                               data-required="1" class="span6 m-wrap"
                                               style="width:250px !important;" value="# "/>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div style="float:left;width:50%;">
                                    <label class="control-label">Số điện thoại:</label>
                                    <div class="controls">
                                        <input readonly id="txt-ma" type="text" name="txt-ma" data-required="1"
                                               class="span6 m-wrap"
                                               style="width:285px !important;" value="# "/>
                                    </div>
                                </div>
                                <div style="float: right;width:50%;">
                                    <label class="control-label">Email người gửi:</label>
                                    <div class="controls">
                                        <input readonly id="txt-hinh-thuc" type="text" name="txt-hinh-thuc"
                                               data-required="1" class="span6 m-wrap"
                                               style="width:250px !important;"
                                               value="#"/>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div style="float:left;width:50%;">
                                    <label class="control-label">Nội dung:</label>
                                    <div class="controls">
                                        <textarea readonly id="ghi-chu" type="text" name="ghi-chu" data-required="1"
                                                  class="span6 m-wrap"
                                                  style="width:707px !important;" >${donHangs.ghiChu}</textarea>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                    <div style="text-align: center">
                        <a href="/Admin/QLDonHang" type="button" class="btn btn-success btn-large">Quay về trang chủ</a>
                    </div>
                </div>
                <!-- /block -->
            </div>
        </div>
    </div>
    <hr>
    <footer>
        <p>&copy; TieuDanSeaFood 2018</p>
    </footer>
</div>


</body>

</html>