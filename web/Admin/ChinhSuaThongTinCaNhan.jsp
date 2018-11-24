<!-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> -->
<!DOCTYPE html>
<html lang="vi">

<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thông tin</title>
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
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
        <div class="row-fluid">
            <div class="span3" id="sidebar" style="width: 200px;">
                <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                    <li class="active">
                        <a href="ThongTinCaNhan.jsp"><i class="icon-chevron-right"></i>Hồ sơ</a>
                    </li>
                    <li>
                        <a href="DoiMatKhau.jsp"><i class="icon-chevron-right"></i>Đổi mật khẩu</a>
                    </li>
                    <li>
                        <a href="ThongTinQuyen_Info.jsp"><i class="icon-chevron-right"></i>Quyền</a>
                    </li>
                </ul>
            </div>
            <!--/span-->
            <div class="span9">
                <div class="container-fluid">
                    <div class="container">
                        <div class="row-fluid">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Thông tin cá nhân</div>
                                </div>
                                <div class="block-content collapse in">
                                    <!-- BEGIN FORM-->
                                    <form action="#" id="form_sample_1" class="form-horizontal" style="width:70%;margin:0 auto;">
                                        <div class="control-group">
                                            <div style="float:left;width:50%;">
                                                <label class="control-label">Họ tên(bắt buộc)<span class="required">*</span></label>
                                                <div class="controls">
                                                    <input id="txt-ten" type="text" name="name" data-required="1" class="span6 m-wrap"
                                                        style="width:500px !important;" value="Nguyễn Thanh Tân" />
                                                    <br><small class="text-danger" id="validate-txt-ten"></small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Giới tính<span class="required">*</span></label>
                                            <div class="controls">
                                                <input id="txt-ten" type="text" name="name" data-required="1" class="span6 m-wrap"
                                                    style="width:500px !important;" value="Nam" />
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Địa chỉ email(bắt buộc):<span class="required">*</span></label>
                                            <div class="controls">
                                                <input id="txt-email" name="email" type="text" class="span6 m-wrap"
                                                    style="width:500px !important;" value="nguyentan.dc25@gmail.com" />
                                                <br><small class="text-danger" id="validate-txt-email"></small>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Số điện thoại(bắt buộc)<span class="required">*</span></label>
                                            <div class="controls">
                                                <input id="txt-dien-thoai" type="text" name="name" data-required="1"
                                                    class="span6 m-wrap" style="width:500px !important;" value="0828088818" />
                                                <br><small class="text-danger" id="validate-txt-dien-thoai"></small>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Địa chỉ<span class="required">*</span></label>
                                            <div class="controls">
                                                <input id="txt-dia-chi" type="text" name="name" data-required="1" class="span6 m-wrap"
                                                    style="width:500px !important;" value="75/6 Trương Văn Hải, Quận 9, TP HCM" />
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Ngày sinh<span class="required">*</span></label>
                                            <div class="controls">
                                                <input type="text" class="input-xlarge datepicker" id="date01" value="07/27/2018"
                                                    style="width:500px !important;">
                                                <br><small class="text-danger" id="validate-dt-ngay-sinh"></small>
                                            </div>
                                        </div>
                                        <div style="text-align: right">
                                            <button type="submit" id="btn-them" class="btn btn-primary">Hoàn tất</button>
                                            <button type="button" class="btn">Hủy bỏ</button>
                                        </div>
                                    </form>

                                    <!-- END FORM-->
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <p>&copy; TieuDanSeaFood 2018</p>
    </footer>
    </div>
    <script src="vendors/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
    <script src="assets/scripts.js"></script>
    <script>
        $(function () {
            // Easy pie charts
            $('.chart').easyPieChart({ animate: 1000 });
        });
    </script>
    <script>
            function kiemTraTxtTen() {
                let value = $("#txt-ten").val();
                if (value === "") {
                    $("#validate-txt-ten").html("Bạn chưa nhập tên");
                    $("#txt-ten").css("border", "solid 1px red");
                    return false;
                }
                $("#validate-txt-ten").html("");
                $("#txt-ten").css("border", "solid 1px #ccc");
                return true;
            }
            function kiemTraTxtEmail() {
                let reg = /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/;
                let value = $("#txt-email").val();
                if (value === "") {
                    $("#validate-txt-email").html("Bạn chưa nhập email");
                    $("#txt-email").css("border", "solid 1px red");
                    return false;
                }
                if (!reg.test(value)) {
                    $("#validate-txt-email").html("Email không hợp lệ");
                    $("#txt-email").css("border", "solid 1px red");
                    return false;
                }
                $("#validate-txt-email").html("");
                $("#txt-email").css("border", "solid 1px #ccc");
                return true;
            }
            function KiemTraTxtDienThoai() {
                let reg = /^\+?\d{1,3}?[- .]?\(?(?:\d{2,3})\)?[- .]?\d\d\d[- .]?\d\d\d\d$/;
                let value = $("#txt-dien-thoai").val();
                if (value === "") {
                    $("#validate-txt-dien-thoai").html("Bạn chưa nhập số điện thoại");
                    $("#txt-dien-thoai").css("border", "solid 1px red");
                    return false;
                }
                if (!reg.test(value)) {
                    $("#validate-txt-dien-thoai").html("Số điện thoại không hợp lệ");
                    $("#txt-dien-thoai").css("border", "solid 1px red");
                    return false;
                }
                $("#validate-txt-dien-thoai").html("");
                $("#txt-dien-thoai").css("border", "solid 1px #ccc");
                return true;
            }
            function kiemTraTxtNgaySinh() {
                let value = $("#dt-ngay-sinh").val();
                if (value === "") {
                    $("#validate-dt-ngay-sinh").html("Bạn chưa chọn ngày tháng năm sinh");
                    $("#dt-ngay-sinh").css("border", "solid 1px red");
                    return false;
                }
                $("#validate-dt-ngay-sinh").html("");
                $("#dt-ngay-sinh").css("border", "solid 1px #ccc");
                return true;
            }
            $("#btn-them").click(() => {
                let kq = kiemTraTxtTen() & kiemTraTxtEmail() & KiemTraTxtDienThoai() & kiemTraTxtNgaySinh() ;
                if (kq === 0) {
                    return false;
                }
                return true;
            });
        </script>


</body>

</html>