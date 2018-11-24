<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đơn hàng</title>
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
                <a class="brand" href="index.html">TieuDanSeaFood</a>
                <div class="nav-collapse collapse">
                    <ul class="nav pull-right">
                        <li class="dropdown">
                            <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="icon-user"></i> Tan Nguyen <i class="caret"></i>

                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a tabindex="-1" href="ThongTinCaNhan.jsp">Thông tin cá nhân</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a tabindex="-1" href="login.jsp">Đăng xuất</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav">
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">Quản lý Người dùng <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu" id="menu">
                                <li>
                                    <a href="QlyNguoiDungThongThuong.jsp">Người dùng thông thường</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="QlyAdmin.jsp">Admin</a>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="QLySanPham.jsp" data-toggle="dropdown" class="dropdown-toggle">Quản lý Sản phẩm
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
                            <a href="QlyBaiViet.jsp">Quản lý Bài Viết</a>
                        </li>
                        <li>
                            <a href="/Admin/QLDanhMuc">Quản lý Danh mục</a>
                        </li>
                        <li>
                            <a href="/Admin/QLDonHang">Quản lý Đơn hàng</a>
                        </li>
                        <li>
                            <a href="QlyQuyen.jsp">Quản lý quyền</a>
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
                            <div class="table-toolbar">
                                <div>
                                    <div style="float:right;">
                                        <label>Search: <input type="text" aria-controls="example2"></label>
                                    </div>
                                </div>
                            </div>
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"
                                id="example2">
                                <tr>
                                    <th>Tình trạng</th>
                                    <th>Mã đơn hàng</th>
                                    <th>Mã người dùng</th>
                                    <th>Tổng giá</th>
                                    <th>Địa chỉ giao hàng</th>
                                    <th>Hình thức thanh toán</th>
                                    <th>Ngày đặt hàng</th>
                                    <th width="75">Chi tiết</th>
                                    <th width="85">Xóa</th>
                                </tr>
                                <c:forEach var="donHang" items="${requestScope.donHangs}">
                                <tr>
                                    <td>${donHang.tinhTrang}</td>
                                    <td>${donHang.maDonHang}</td>
                                    <td>${donHang.maNguoiDung}</td>
                                    <td>${donHang.tongTien}</td>
                                    <td>${donHang.diaChiGiaoHang}</td>
                                    <td>${donHang.hinhThucThanhToan}</td>
                                    <td>${donHang.ngayDatHang}</td>
                                    <td>
                                        <a href="/Admin/XemCTDonHang?idDH=${donHang.maDonHang}" class="btn"><i class="icon-eye-open"></i> View</a>
                                    </td>
                                    <td>
                                        <a href="/Admin/XoaDonHang?idDH=${donHang.maDonHang}" onclick="return confirm('Are you sure?')" class="btn btn-danger"><i class="icon-remove icon-white"></i> Delete</a>
                                    </td>
                                </tr>
                                </c:forEach>

                            </table>
                            <div class="dataTables_paginate paging_bootstrap pagination" style="text-align:center">
                                <ul>
                                    <li class="prev"><a href="#">← Previous</a></li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li class="next"><a href="#">Next → </a></li>
                                </ul>
                            </div>
                        </div>
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