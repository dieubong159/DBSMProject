<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chỉnh sửa thông tin admin</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
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
                        <div class="muted pull-left">Chỉnh sửa thông tin admin</div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                            <!-- BEGIN FORM-->
                            <form action="/Admin/ChinhSuaAdmin" id="form_sample_1" class="form-horizontal" style="width:70%;margin:0 auto;" method="post">
                                <input type="hidden" value="${nguoiDung.maNguoiDung}" name="txtMaNguoiDung">
                                <div class="control-group">
                                    <div style="float:left;width:50%;">
                                        <label class="control-label">Họ tên<span class="required">*</span></label>
                                        <div class="controls">
                                            <input id="txt-ten" type="text" name="txt-ten" data-required="1"
                                                   class="span6 m-wrap" style="width:500px !important;" value= "${nguoiDung.hoTen} "/>
                                            <br><small class="text-danger" id="validate-txt-ten"></small>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Giới tính<span class="required">*</span></label>
                                    <div class="controls">
                                        <select class="span6 m-wrap" name="txt-gioi-tinh" style="width:500px !important;">
                                            <option value="1" <c:if test="${nguoiDung.gioiTinh}">selected</c:if>>Nam</option>
                                            <option value="0" <c:if test="${nguoiDung.gioiTinh ne true}">selected</c:if>>Nữ</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Địa chỉ email<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="txt-email" name="txt-email" type="text" class="span6 m-wrap" style="width:500px !important;"
                                               value="${nguoiDung.email}" />
                                        <br><small class="text-danger" id="validate-txt-email"></small>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Số điện thoại<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="txt-dien-thoai" type="text" name="txt-dien-thoai" data-required="1"
                                               class="span6 m-wrap" style="width:500px !important;" value="${nguoiDung.sdt} " />
                                        <br><small class="text-danger" id="validate-txt-dien-thoai"></small>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Địa chỉ<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="txt-dia-chi" type="text" name="txt-dia-chi" data-required="1"
                                               class="span6 m-wrap" style="width:500px !important;" value="${nguoiDung.diaChi}" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Ngày sinh<span class="required">*</span></label>
                                    <div class="controls">
                                        <input type="date" name="dt-ngay-sinh" class="input-xlarge datepicker" id="date01" value="${nguoiDung.ngaySinh}"
                                               style="width:486px !important;">
                                        <br><small class="text-danger" id="validate-dt-ngay-sinh"></small>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Mật khẩu<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="txt-mat-khau" type="text" name="txt-mat-khau" data-required="1"
                                               class="span6 m-wrap" style="width:500px !important;" value="${nguoiDung.matKhau}" />
                                        <br><small class="text-danger" id="validate-txt-mat-khau"></small>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Xác nhận mật khẩu<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="txt-xac-nhan-mat-khau" type="text" name="name" data-required="1"
                                               class="span6 m-wrap" style="width:500px!important;" value="${nguoiDung.matKhau} " />
                                        <br><small class="text-danger" id="validate-txt-xac-nhan-mat-khau"></small>
                                    </div>
                                </div>
                                <div style="text-align: center">
                                    <div style="text-align:center;">
                                        <button type="submit" id="btn-them" class="btn btn-primary">Hoàn tất</button>
                                        <button type="button" class="btn">Hủy bỏ</button>
                                    </div>
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

    <link href="vendors/datepicker.css" rel="stylesheet" media="screen">
    <link href="vendors/uniform.default.css" rel="stylesheet" media="screen">
    <link href="vendors/chosen.min.css" rel="stylesheet" media="screen">

    <link href="vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">

    <script src="vendors/jquery-1.9.1.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="vendors/jquery.uniform.min.js"></script>
    <script src="vendors/chosen.jquery.min.js"></script>
    <script src="vendors/bootstrap-datepicker.js"></script>

    <script src="vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
    <script src="vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

    <script src="vendors/wizard/jquery.bootstrap.wizard.min.js"></script>

    <script type="text/javascript" src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="assets/form-validation.js"></script>

    <script src="assets/scripts.js"></script>
    <script>

        jQuery(document).ready(function () {
            FormValidation.init();
        });


        $(function () {
            $(".datepicker").datepicker();
            $(".uniform_on").uniform();
            $(".chzn-select").chosen();
            $('.textarea').wysihtml5();

            $('#rootwizard').bootstrapWizard({
                onTabShow: function (tab, navigation, index) {
                    var $total = navigation.find('li').length;
                    var $current = index + 1;
                    var $percent = ($current / $total) * 100;
                    $('#rootwizard').find('.bar').css({ width: $percent + '%' });
                    // If it's the last tab then hide the last button and show the finish instead
                    if ($current >= $total) {
                        $('#rootwizard').find('.pager .next').hide();
                        $('#rootwizard').find('.pager .finish').show();
                        $('#rootwizard').find('.pager .finish').removeClass('disabled');
                    } else {
                        $('#rootwizard').find('.pager .next').show();
                        $('#rootwizard').find('.pager .finish').hide();
                    }
                }
            });
            $('#rootwizard .finish').click(function () {
                alert('Finished!, Starting over!');
                $('#rootwizard').find("a[href*='tab1']").trigger('click');
            });
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
        function kiemTraTxtMatKhau() {
            let value = $("#txt-mat-khau").val();
            if (value === "") {
                $("#validate-txt-mat-khau").html("Bạn chưa nhập mật khẩu");
                $("#txt-mat-khau").css("border", "solid 1px red");
                return false;
            }
            if (value.length <= 8) {
                $("#validate-txt-mat-khau").html("Mật khẩu phải lớn hơn 8 ký tự");
                $("#txt-mat-khau").css("border", "solid 1px red");
                return false;
            }
            $("#validate-txt-mat-khau").html("");
            $("#txt-mat-khau").css("border", "solid 1px #ccc");
            return true;
        }
        function kiemTraTxtXacNhanMatKhau() {
            let mk = $("#txt-mat-khau").val();
            let value = $("#txt-xac-nhan-mat-khau").val();
            if (value !== mk) {
                $("#validate-txt-xac-nhan-mat-khau").html("Mật khẩu không chính xác");
                $("#txt-xac-nhan-mat-khau").css("border", "solid 1px red");
                return false;
            }
            $("#validate-txt-xac-nhan-mat-khau").html("");
            $("#txt-xac-nhan-mat-khau").css("border", "solid 1px #ccc");
            return true;
        }
        $("#btn-them").click(() => {
            let kq = kiemTraTxtTen() & kiemTraTxtEmail() & KiemTraTxtDienThoai() & kiemTraTxtNgaySinh() & kiemTraTxtMatKhau() & kiemTraTxtXacNhanMatKhau();
        if (kq === 0) {
            return false;
        }
        return true;
        });
    </script>
</body>

</html>