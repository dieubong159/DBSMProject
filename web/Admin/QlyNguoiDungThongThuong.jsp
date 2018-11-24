<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Người Dùng</title>
    <!-- Bootstrap -->
    <link href="/Admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/Admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="/Admin/assets/styles.css" rel="stylesheet" media="screen">
    <script src="/Admin/vendors/jquery-1.9.1.min.js"></script>
    <script src="/Admin/bootstrap/js/bootstrap.min.js"></script>
    <script>
        function confirmDelete(obj) {
            if (confirm("Bạn có chắc chắn muốn xóa người dùng này không?")) {
                $.post("/Admin/XoaNguoiDung",{ txtMaNguoiDung : $(obj).attr("manguoidung").trim() }, content => location.href="/Admin/NguoiDungThongThuong");
            }
        }
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
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">Quản lý Người dùng <b
                                class="caret"></b>
                        </a>
                        <ul class="dropdown-menu" id="menu1">
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
                        <a href="QLySanPham.jsp" data-toggle="dropdown" class="dropdown-toggle">Quản lý Sản phẩm
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu" id="menu1">
                            <li>
                                <a href="QLySanPham.jsp">Tôm</a>
                            </li>
                            <li>
                                <a href="QLySanPham.jsp">Cua</a>
                            </li>
                            <li>
                                <a href="QLySanPham.jsp">Cá</a>
                            </li>
                            <li>
                                <a href="QLySanPham.jsp">Mực</a>
                            </li>
                            <li>
                                <a href="QLySanPham.jsp">Ngao-Sò-Ốc</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="/Admin/QlyBaiViet">Quản lý Bài Viết</a>
                    </li>
                    <li>
                        <a href="QLyDanhMuc.jsp">Quản lý Danh mục</a>
                    </li>
                    <li>
                        <a href="QlyDonHang.jsp">Quản lý Đơn hàng</a>
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
                    <div class="muted pull-left">QUẢN LÍ NGƯỜI DÙNG</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <div class="table-toolbar">
                            <div>
                                <div style="float:left;">
                                    <a href="/Admin/TMNguoiDung">
                                        <button class="btn btn-success">Thêm mới <i class="icon-plus icon-white"></i>
                                        </button>
                                    </a>
                                </div>
                                <div style="float:right;">
                                    <label>Search: <input type="text" aria-controls="example2"></label>
                                </div>
                            </div>
                        </div>
                        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"
                               id="example2">
                            <thead>
                            <tr>
                                <th width="75">Kích hoạt</th>
                                <th >Mã</th>
                                <th >Họ tên</th>
                                <th >Email</th>
                                <th >Số điện thoại</th>
                                <th width="75">Chi tiết</th>
                                <th width="70">Chỉnh sửa</th>
                                <th width="85">Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="nguoiDung" items="${requestScope.nguoiDungs}">
                                <tr class="odd gradeX">
                                    <td><input type="checkbox" name="chkKichHoat" class="form-control"
                                               <c:if test="${nguoiDung.kichHoat}">checked</c:if> /></td>
                                    <td>${nguoiDung.maNguoiDung}</td>
                                    <td>${nguoiDung.hoTen}</td>
                                    <td class="center">${nguoiDung.email}</td>
                                    <td class="center">${nguoiDung.sdt} </td>
                                    <td><a href="/Admin/ChiTietNguoiDung?id=${nguoiDung.maNguoiDung}" class="btn"><i
                                            class="icon-eye-open"></i>View</a></td>
                                    <td>
                                        <a href="/Admin/ChinhSuaNguoiDung?id=${nguoiDung.maNguoiDung}"
                                           class="btn btn-primary"><i class="icon-pencil icon-white"></i>
                                            Edit</a>
                                    </td>
                                    <td>
                                        <button class="btn btn-danger" maNguoiDung="${nguoiDung.maNguoiDung}" onclick="confirmDelete(this);"><i
                                                class="icon-remove icon-white"></i>
                                            Delete</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
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