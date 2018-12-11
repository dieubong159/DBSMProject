<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sản Phẩm</title>
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
    <script src="/Admin/vendors/jquery-1.9.1.min.js"></script>
    <script src="/Admin/bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#myInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
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
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">Quản lý Người dùng <b class="caret"></b>
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
                        <div class="muted pull-left">QUẢN LÍ SẢN PHẨM</div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                            <div class="table-toolbar">
                                <div>
                                    <div style="float:left;">
                                        <a href="/Admin/THMSanPham"><button class="btn btn-success">Thêm mới <i class="icon-plus icon-white"></i></button></a>
                                    </div>
                                    <div style="float:right;position: relative;">
                                        <!-- <button style="display:inline-block;position: absolute;top: 0;left:-70px;"
                                            class="btn"><i class="icon-filter"></i>Lọc</button> -->
                                        <label style="display:inline-block;">Search: <input id="myInput" type="text" aria-controls="example2"></label>
                                    </div>
                                </div>
                            </div>
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"
                                id="example2">
                                <thead>
                                    <tr>
                                        <th>Mã danh mục</th>
                                        <th>Mã sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá sản phẩm</th>
                                        <th>Khuyến mãi</th>
                                        <th>Xuất xứ</th>
                                        <th>Ngày nhập</th>
                                        <th width="75">Chi tiết</th>
                                        <th width="70">Chỉnh sửa</th>
                                        <th width="85">Xóa</th>
                                    </tr>
                                </thead>
                                <tbody id="myTable">
                                <c:forEach var="sanPham" items="${requestScope.sanPhams}">
                                    <tr class="odd gradeX">
                                        <td>${sanPham.maDanhMuc}</td>
                                        <td>${sanPham.maSP}</td>
                                        <td>${sanPham.tenSP}</td>
                                        <td>${sanPham.giaSP}</td>
                                        <td>${sanPham.phanTramKhuyenMai}</td>
                                        <td>${sanPham.xuatXu}</td>
                                        <td>${sanPham.ngayNhap}</td>
                                        <td>
                                            <a href="/Admin/CTSanPham?idSP=${sanPham.maSP}" class="btn"><i class="icon-eye-open"></i> View</a>
                                        </td>
                                        <td>
                                            <a href="/Admin/ChinhSuaSanPham?idSP=${sanPham.maSP}" class="btn btn-primary"><i class="icon-pencil icon-white"></i>
                                                Edit</a>
                                        </td>
                                        <td>
                                            <a href="/Admin/XoaSanPham?idSP=${sanPham.maSP}" onclick="return confirm('Are you sure?')" class="btn btn-danger"><i class="icon-remove icon-white"></i>
                                                Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <fmt:formatNumber var = "totalPage" value = "${requestScope.numOfRecord/10}" minFractionDigits="0" maxFractionDigits="0"/>
                            <c:if test="${(requestScope.numOfRecord mod 10) != 0}">

                                <fmt:formatNumber var = "totalPage" type = "number" value = "${(requestScope.numOfRecord/10 + 1)- ((requestScope.numOfRecord/10 + 1) % 1 == 0 ? 0 : 0.5)}" minFractionDigits="0" maxFractionDigits="0"/>
                            </c:if>
                            <div class="dataTables_paginate paging_bootstrap pagination" style="text-align:center">
                                <ul>
                                    <c:if test="${param.page != 1}">
                                        <li class="prev"><a href="/Admin/QLSanPham?idDM=${param.idDM}&page=${param.page - 1}">← Previous</a></li>
                                    </c:if>
                                    <c:forEach var="j" begin="1" end="${totalPage}">
                                        <c:if test="${param.page == j}">
                                            <li class="active"><a href="/Admin/QLSanPham?idDM=${param.idDM}&page=${j}">${j}</a></li>
                                        </c:if>
                                        <c:if test="${param.page != j}">
                                            <li><a href="/Admin/QLSanPham?idDM=${pram.idDM}&page=${j}">${j}</a></li>
                                        </c:if>
                                    </c:forEach>

                                    <c:if test="${param.page < totalPage}">
                                        <li class="next"><a href="/Admin/QLSanPham?idDM=${pram.idDM}&page=${param.page + 1}">Next → </a></li>
                                    </c:if>
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