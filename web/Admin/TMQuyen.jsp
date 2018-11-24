<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thêm quyền</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
    <script src="vendors/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
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
                            <ul class="dropdown-menu" id="menu1">
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
                            <a href="QlyBaiViet.jsp">Quản lý Bài Viết</a>
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
                    <div class="navbar navbar-inner block-header">
                        <div class="muted pull-left">Thêm quyền</div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                            <!-- BEGIN FORM-->
                            <form action="/Admin/TMQuyen" id="form_sample_1" class="form-horizontal" style="width:70%;margin:0 auto;" method="post">
                                <div class="control-group">
                                    <label class="control-label">Mã quyền<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="txt-ma-quyen" type="text" name="txt-ma-quyen" data-required="1" class="span6 m-wrap"
                                            style="width:500px !important;"/>
                                        <br><small class="text-danger" id="validate-txt-ma-quyen"></small>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Tên quyền<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="txt-ten-quyen" name="txt-ten-quyen" type="text" class="span6 m-wrap"
                                            style="width:500px !important;"/>
                                        <br><small class="text-danger" id="validate-txt-ten-quyen"></small>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Chọn nghiệp vụ</label>
                                    <div class="controls">
                                        <select class="span6 m-wrap" name="nghiep-vu" id="nghiep-vu" style="width:500px !important;">
                                            <option value="-1" selected>chọn nghiệp vụ</option>
                                            <c:forEach var="nghiepVu" items="${nghiepvus}">
                                                <option value="${nghiepVu.maNghiepVu}">${nghiepVu.tenNghiepVu}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div style="text-align:center;">
                                    <button id="btn-them" type="submit" class="btn btn-primary">Hoàn thành</button>
                                    <button type="button" class="btn">Hủy bỏ</button>
                                </div>
                            </form>

                            <!-- END FORM-->
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
    <script>
        function kiemTraTxtMaQuyen() {
            let value = $("#txt-ma-quyen").val();
            if (value === "") {
                $("#validate-txt-ma-quyen").html("Bạn phải điền vào ô nhập mã quyền");
                $("#txt-ma-quyen").css("border", "solid 1px red");
                return false;
            }
            $("#validate-txt-ma-quyen").html("");
            $("#txt-ma-quyen").css("border", "solid 1px #ccc");
            return true;
        }
        function kiemTraTxtTenQuyen() {
            let value = $("#txt-ten-quyen").val();
            if (value === "") {
                $("#validate-txt-ten-quyen").html("Bạn phải điền vào ô nhập tên quyền");
                $("#txt-ten-quyen").css("border", "solid 1px red");
                return false;
            }
            $("#validate-txt-ten-quyen").html("");
            $("#txt-ten-quyen").css("border", "solid 1px #ccc");
            return true;
        }
        $("#btn-them").click(() => {
            let kq = kiemTraTxtMaQuyen() & kiemTraTxtTenQuyen();
            if (kq === 0) {
                return false;
            }
            return true;
        });
    </script>
</body>

</html>