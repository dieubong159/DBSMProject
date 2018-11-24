<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html lang="vi">

<head>
    <title>Giỏ hàng của bạn - Tiêu Dân Seafood</title>
    <!--meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="resources/js/jquery-2.2.3.min.js"></script>
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!--//meta tags ends here-->
    <!--booststrap-->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" id="bootstrap-css">
    <link href="resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <!--//booststrap end-->
    <!-- font-awesome icons -->
    <link href="resources/css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
    <!-- //font-awesome icons -->
    <link href="resources/css/JiSlider.css" rel="stylesheet">
    <!--stylesheets-->
    <link href="resources/css/style.css" rel='stylesheet' type='text/css' media="all">
    <!--//stylesheets-->
    <link href="//fonts.googleapis.com/css?family=Sunflower:500,700" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <!--js working-->

    <script src="resources/js/minicart.js"></script>
    <!-- //cart-js -->
    <!-- start-smoth-scrolling -->
    <script src="resources/js/move-top.js"></script>
    <script src="resources/js/easing.js"></script>
    <script>
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 900);
            });
        });
    </script>
    <!-- start-smoth-scrolling -->
    <!-- here stars scrolling icon -->
    <script>
        $(document).ready(function () {

            var defaults = {
                containerID: 'toTop', // fading element id
                containerHoverID: 'toTopHover', // fading element hover id
                scrollSpeed: 1200,
                easingType: 'linear'
            };
            $().UItoTop({
                easingType: 'easeOutQuart'
            });

        });
    </script>
    <!-- //here ends scrolling icon -->
    <!--bootstrap working-->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- //bootstrap working-->
    <script>
        $('.btn_plus').on('click', function () {
            var quan = $(this).siblings('.quantity').val();
            quan++;
            $(this).siblings('.quantity').val(quan);

            var item_price = $(this).siblings('.quantity').attr('data-price');
            var item_id = $(this).siblings('.quantity').attr('data-id');
            var total = quan * item_price;
            var alert = "Đảo Hải Sản chỉ chấp nhận cho đơn hàng 200,000đ trở lên. Giỏ hàng bạn hiện chưa đạt mức tối thiểu để giao hàng";
            $(this).parents('.line_item').find('.item-price').html(Haravan.formatMoney(total, "{{amount}} đ"));
            var params = {
                type: 'POST',
                url: '/cart/change.js',
                data: 'quantity=' + quan + '&id=' + item_id,
                dataType: 'json',
                success: function (cart) {
                    $.getJSON('/cart.js', function (cart, textStatus) {
                        $('.cart-count').html('' + cart.item_count + '');
                        if (cart.total_price < 19900000) {
                            $("#modal-checkout-button").attr("disabled", "disabled");
                            $('.button-default').addClass("disabled");
                            $('.item-total').html(Haravan.formatMoney('' + cart.total_price + '', "{{amount}} đ"));
                            $('.row_alert_warning').html("<div class='alert-warning'>" + alert + "</div>");
                        } else {
                            $("#modal-checkout-button").removeAttr("disabled");
                            $('.button-default').removeClass("disabled");
                            $('.item-total').html(Haravan.formatMoney('' + cart.total_price + '', "{{amount}} đ"));
                            $('.row_alert_warning').html('');
                        }
                    });
                },
                error: function (XMLHttpRequest, textStatus) {
                    Haravan.onError(XMLHttpRequest, textStatus);
                }
            };
            jQuery.ajax(params);
        })
        $('.btn_minus').on('click', function () {
            var quan = $(this).siblings('.quantity').val();
            quan--;
            (quan <= 0) ? quan = 1 : quan;
            $(this).siblings('.quantity').val(quan);

            var item_price = $(this).siblings('.quantity').attr('data-price');
            var item_id = $(this).siblings('.quantity').attr('data-id');
            var total = quan * item_price;
            var alert = "Đảo Hải Sản chỉ chấp nhận cho đơn hàng 200,000đ trở lên. Giỏ hàng bạn hiện chưa đạt mức tối thiểu để giao hàng";
            $(this).parents('.line_item').find('.item-price').html(Haravan.formatMoney(total, "{{amount}} đ"));
            var params = {
                type: 'POST',
                url: '/cart/change.js',
                data: 'quantity=' + quan + '&id=' + item_id,
                dataType: 'json',
                success: function (cart) {
                    $.getJSON('/cart.js', function (cart, textStatus) {
                        $('.cart-count').html('' + cart.item_count + '');
                        if (cart.total_price < 19900000) {
                            $("#modal-checkout-button").attr("disabled", "disabled");
                            $('.button-default').addClass("disabled");
                            $('.item-total').html(Haravan.formatMoney('' + cart.total_price + '', "{{amount}} đ"));
                            $('.row_alert_warning').html("<div class='alert-warning'>" + alert + "</div>");
                        } else {
                            $("#modal-checkout-button").removeAttr("disabled");
                            $('.button-default').removeClass("disabled");
                            $('.item-total').html(Haravan.formatMoney('' + cart.total_price + '', "{{amount}} đ"));
                            $('.row_alert_warning').html('');
                        }
                    });
                },
                error: function (XMLHttpRequest, textStatus) {
                    Haravan.onError(XMLHttpRequest, textStatus);
                }
            };
            jQuery.ajax(params);
        })
        $('input.quantity').change(function () {
            var q = $(this).val();
            console.log(q);
            var item_price = $(this).attr('data-price');
            var item_id = $(this).attr('data-id');
            console.log(item_price);
            var total = q * item_price;
            console.log(total);
            var alert = "Đảo Hải Sản chỉ chấp nhận cho đơn hàng 200,000đ trở lên. Giỏ hàng bạn hiện chưa đạt mức tối thiểu để giao hàng";
            $(this).parents('.line_item').find('.item-price').html(Haravan.formatMoney(total, "{{amount}} đ"));
            var params = {
                type: 'POST',
                url: '/cart/change.js',
                data: 'quantity=' + q + '&id=' + item_id,
                dataType: 'json',
                success: function (cart) {
                    $.getJSON('/cart.js', function (cart, textStatus) {
                        $('.cart-count').html('' + cart.item_count + '');
                        if (cart.total_price < 19900000) {
                            $("#modal-checkout-button").attr("disabled", "disabled");
                            $('.button-default').addClass("disabled");
                            $('.item-total').html(Haravan.formatMoney('' + cart.total_price + '', "{{amount}} đ"));
                            $('.row_alert_warning').html("<div class='alert-warning'>" + alert + "</div>");
                        } else {
                            $("#modal-checkout-button").removeAttr("disabled");
                            $('.button-default').removeClass("disabled");
                            $('.item-total').html(Haravan.formatMoney('' + cart.total_price + '', "{{amount}} đ"));
                            $('.row_alert_warning').html('');
                        }
                    });
                },
                error: function (XMLHttpRequest, textStatus) {
                    Haravan.onError(XMLHttpRequest, textStatus);
                }
            };
            jQuery.ajax(params);
        });

    </script>
</head>

<body>
    <header>
        <div class="header-outs" id="home">
            <div class="header-bar">
                <div class="info-top-grid">
                    <div class="info-contact-agile">
                        <ul>
                            <li>
                                <span class="fas fa-phone-volume"></span>
                                <p>+(058) 606 0734</p>
                            </li>
                            <li>
                                <span class="fas fa-envelope"></span>
                                <p><a href="mailto:info@example.com">tieudanseafood@gmail.com</a></p>
                            </li>
                            <li class="float-md-right">
                                <span class="fas fa-user"></span>
                                <p><a data-toggle="modal" href="#LoginModal">Đăng nhập</a></p>
                                <p>|</p>
                                <p><a href="DangKi.jsp">Đăng ký</a></p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="hedder-up row">
                        <div style="width:70%" class="col-lg-3 col-md-3 logo-head">
                            <li>
                                <a class="navbar-brand" href="TrangChu.jsp" style="margin-left: 31%">
                                    <div class="logo"><img src="resources/images/CrabICO.png" alt=""> </div>
                                </a>
                                <h4 style="display:inline-block"><strong><a href="TrangChu.jsp">Tiêu Dân Seafood</strong></a></h4>
                            </li>
                        </div>
                        <div class="col-lg-5 col-md-6 search-right">
                            <form style="padding-top:6%" class="form-inline my-lg-0">
                                <input class="form-control mr-sm-2" type="search" placeholder="Bạn muốn tìm kiếm...">
                                <button class="btn" type="submit">Search</button>
                            </form>
                        </div>
                        <div class="col-lg-4 col-md-3 right-side-cart">
                            <div style="margin-top:2%" class="cart-icons">
                                <ul style="text-align:start">
                                    <li style="padding-right: 15pt">
                                        <p style="padding-bottom: 15pt"><strong><a href="tel:+01269220162">0168 xxxx
                                                    xxx</a></strong></p>
                                        <p>Tổng đài miễn phí</a></p>
                                    </li>
                                    <li style="padding-right: 15pt">
                                        <p style="padding-bottom: 15pt"><strong><a href="#">CÔNG THỨC</a></strong></p>
                                        <p>Đảm đang - Khéo léo</a></p>
                                    </li>
                                    <li style="position:relative" class="toyscart toyscart2 cart cart box_1">
                                        <form action="#" method="post" class="last">
                                            <input type="hidden" name="cmd" value="_cart">
                                            <input type="hidden" name="display" value="1">
                                            <p style="display:inline-block"><strong><a href="#">GIỎ HÀNG</a></strong></p>
                                            <button class="top_toys_cart" type="submit" name="submit" value="">
                                                <span class="fas fa-cart-arrow-down"></span>
                                            </button>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <nav class="navbar navbar-expand-lg navbar-light">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                        <ul class="navbar-nav ">
                            <li class="nav-item active">
                                <a class="nav-link" href="TrangChu.jsp">Trang chủ <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a href="about.jsp" class="nav-link">Giới thiệu</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Sản phẩm
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="nav-link" href="Products.jsp">Cá</a>
                                    <a class="nav-link " href="#!">Tôm</a>
                                    <a class="nav-link " href="#!">Mực</a>
                                    <a class="nav-link " href="#!">Cua - ghẹ</a>
                                    <a class="nav-link " href="#!">Ngao - Sò - Ốc</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a href="#!" class="nav-link">Công thức chế biến</a>
                            </li>
                            <li class="nav-item">
                                <a href="LienHe.jsp" class="nav-link">Liên hệ</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
    </header>
    <!-- Banner -->
    <div class="inner_page-banner one-img">
    </div>
    <!-- Banner -->
<!-- Modal 1-->
<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="LoginModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="LoginModalLabel">Đăng nhập</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="register-form">
                        <form action="#" method="post" onsubmit="return checkForm(this)">
                            <div class="fields-grid">
                                <div class="styled-input">
                                    <input type="email" placeholder="Email của bạn" name="Your Email" required="">
                                </div>
                                <div class="styled-input">
                                    <input type="password" placeholder="Nhập password" name="password" required="">
                                </div>
                                <button type="submit" class="btn subscrib-btnn">Đăng nhập</button>
                            </div>
                        </form>
                        <label>
                            <input type="checkbox" checked="checked" name="remember"> Remember me
                        </label>
                    </div>
                </div>
                <div class="container" style="padding: 11px; background-color:beige">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <span style="padding-top: 5px; float: right">Forgot <a data-toggle="modal" data-target="#ForgetPasswordModal">password?</a></span>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ForgetPasswordModal" role="dialog" aria-labelledby="ForgetPasswordModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <form action="#" method="post">
                    <div class="modal-header" style="display: block;">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" id="ForgetPasswordModalLabel">Quên mật khẩu?</h2>
                        <span>Vui lòng cung cấp email hoặc số điện thoại đăng nhập để lấy lại mật khẩu.</span>
                    </div>
                    <div class="modal-body">
                        <input type="email" name="email" id="email-forgot" class="form-control" value="" placeholder="Nhập email hoặc số điện thoại"
                            data-bv-field="email" required>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-secondary">Gửi</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- //Modal 1-->
    <ul class="breadcrumb">
        <div class="container">
            <li><a href="TrangChu.jsp">Trang chủ</a></li>
            <li>Giỏ hàng</li>
        </div>
    </ul>

    <div class="gap-element" style="display:block; height:auto; padding-top:30px"></div>
    <main class="page-content">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-md-10 col-lg-push-1 col-md-push-1 col-sm-12 col-xs-12">
                    <div class="main-product container-fluid">
                        <div class="row cate-title">
                            <span class="title-r">Giỏ hàng của bạn</span>
                        </div>
                        <div class="row user-wrapper">
                            <!--Form cart-->

                            <form action="/cart" method="post">
                                <div class="table-responsive">
                                    <p class="cart_freeship">
                                        <img src="resources/images/icon_free.png" width="50">
                                        <span>MIỄN PHÍ giao hàng nội thành TPHCM cho đơn hàng 500,000đ.</span>
                                    </p>
                                    <table class="cart table">
                                        <tbody>
                                            <tr>
                                                <th colspan="2">Tên sản phẩm</th>
                                                <th class="text-center" width="150px">Giá</th>
                                                <th class="text-center" width="100px">Số lượng</th>
                                                <th class="text-center" width="100px">Tổng</th>
                                            </tr>

                                            <tr class="line_item" style="">
                                                <td class="item-image" colspan="2">
                                                    <img src="resources/images/Cuttle/ghe-xanh-01.jpg">
                                                    <div class="item-title">
                                                        <a href="!#">
                                                            <strong>Crawfish Sống (Tôm Hùm Đất)</strong>

                                                        </a>
                                                        <p class="item-delete">
                                                            <a href="/cart/change?line=1&amp;quantity=0">
                                                                <img class="delete-cart" src="resources/images/icon-delelte.png">
                                                                Bỏ sản phẩm
                                                            </a>
                                                        </p>
                                                    </div>
                                                </td>
                                                <td class="text-center">
                                                    <div class="item-one-price">670,000 đ</div>
                                                </td>
                                                <td class="text-center">
                                                    <span class="btn_quan btn_minus">-</span>
                                                    <input type="text" min="1" data-price="67000000" data-id="1033641790"
                                                        class="quantity" name="updates[]" id="updates_1033641790" value="1">
                                                    <span class="btn_quan btn_plus">+</span>
                                                </td>
                                                <td class="item-price">670,000 đ</td>
                                            </tr>

                                            <tr class="line_item" style="border-bottom: 1px solid #ccc;">
                                                <td class="item-image" colspan="2">
                                                    <img src="resources/images/Shrmip/tom-cang-xanh01.jpg">
                                                    <div class="item-title">
                                                        <a href="/products/tom-hum-canada">
                                                            <strong>Tôm Hùm Alaska Sống</strong>
                                                        </a>
                                                        <p class="item-delete">
                                                            <a href="/cart/change?line=2&amp;quantity=0">
                                                                <img class="delete-cart" src="resources/images/icon-delelte.png">
                                                                Bỏ sản phẩm
                                                            </a>
                                                        </p>
                                                    </div>
                                                </td>
                                                <td class="text-center">
                                                    <div class="item-one-price">1,090,000 đ</div>
                                                </td>
                                                <td class="text-center">
                                                    <span class="btn_quan btn_minus">-</span>
                                                    <input type="text" min="1" data-price="109000000" data-id="1004258118"
                                                        class="quantity" name="updates[]" id="updates_1004258118" value="1">
                                                    <span class="btn_quan btn_plus">+</span>
                                                </td>
                                                <td class="item-price">1,090,000 đ</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                    <div class="clearfix">
                                        <div class="col-lg-6 col-xs-12">
                                            <div class="cart_note text-left">
                                                <label class="control-label" for="note">Chú Thích</label>
                                                <textarea name="note" id="note" placeholder="Viết ghi chú" class="form-control"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 pull-right">
                                            <div class="total-price-modal text-right">
                                                Thành tiền : <span class="item-total">1,760,000 đ</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row_alert_warning" style="margin-top: 10px">

                                        <p class="note_cart alert-info">Tiêu Dân Seafood chỉ nhận đơn hàng có địa chỉ tại
                                            TPHCM. Nếu khách hàng ở các tỉnh thành khác vui lòng liên hệ số Hotline
                                            1900.0098 để được phục vụ!</p>
                                    </div>
                                    <div class="clearfix">
                                        <div class="col-lg-6 col-xs-12">
                                            <div class="comeback pull-left">
                                                <a href="TrangChu.jsp">
                                                    <i class="fa fa-caret-left" aria-hidden="true"></i>Tiếp tục mua
                                                    hàng
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-xs-12">
                                            <div class="buttons btn-modal-cart">
                                                <input value="Tiến hành thanh toán" type="button" class="buttonorange"
                                                    id="modal-checkout-button" name="checkout" style="float:right"
                                                    onclick="window.location.href='Thanhtoandonhang.jsp'">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!--/Form cart-->
                            <div class="gap-element" style="display:block; height:auto; padding-top:30px"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- footer -->
    <div class="gap-element" style="display:block; height:auto; padding-top:15px"></div>
    <footer class="page-footer font-small mdb-color pt-4">

        <!-- Footer Links -->
        <div class="container text-center text-md-left">

            <!-- Footer links -->
            <div class="row text-center text-md-left mt-3 pb-3">

                <!-- Grid column -->
                <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                    <h6 class="text-uppercase mb-4 font-weight-bold">Tiêu Dân</h6>
                    <p>Hân hạnh phục vụ bạn.</p>
                </div>
                <!-- Grid column -->

                <hr class="w-100 clearfix d-md-none">

                <!-- Grid column -->
                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                    <h6 class="text-uppercase mb-4 font-weight-bold">MENU</h6>
                    <p>
                        <a href="TrangChu.jsp">Trang chủ</a>
                    </p>
                    <p>
                        <a href="About.jsp">Giới thiệu</a>
                    </p>
                    <p>
                        <a href="LienHe.jsp">Liên hệ</a>
                    </p>
                    <p>
                        <a href="DSCongthucchebien.jsp">Món ngon</a>
                    </p>
                </div>
                <!-- Grid column -->

                <hr class="w-100 clearfix d-md-none">

                <!-- Grid column -->
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                    <h6 class="text-uppercase mb-4 font-weight-bold">Thông tin hữu ích</h6>
                    <p>
                        <a href="">Giao nhận hàng</a>
                    </p>
                    <p>
                        <a href="#!">Chính sách đổi trả hàng</a>
                    </p>
                    <p>
                        <a href="#!">Chính sách Giải quyết khiếu nại</a>
                    </p>
                    <p>
                        <a href="#!">Cam kết chất lượng</a>
                    </p>
                </div>

                <!-- Grid column -->
                <hr class="w-100 clearfix d-md-none">

                <!-- Grid column -->
                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                    <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
                    <p>
                        <i class="fa fa-home mr-3"></i> 01 Võ Văn Ngân</p>
                    <p>
                        <i class="fa fa-envelope mr-3"></i> tieudanseafood@gmail.com</p>
                    <p>
                        <i class="fa fa-phone mr-3"></i> + 01 234 567 88</p>
                    <p>
                        <i class="fa fa-print mr-3"></i> + 01 234 567 89</p>
                </div>
                <!-- Grid column -->

            </div>
            <!-- Footer links -->

            <hr>

            <!-- Grid row -->
            <div class="row d-flex align-items-center">

                <!-- Grid column -->
                <div class="col-md-7 col-lg-8">

                    <!--Copyright-->
                    <p class="text-center text-md-left">© 2018 Copyright:
                            <strong> tieudanseafood</strong>
                        </a>
                    </p>

                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-5 col-lg-4 ml-lg-0">

                    <!-- Social buttons -->
                    <div class="text-center text-md-right">
                        <ul class="list-unstyled list-inline">
                            <li class="list-inline-item">
                                <a class="btn-floating btn-sm rgba-white-slight mx-1">
                                    <i class="fab fa-facebook-square"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a class="btn-floating btn-sm rgba-white-slight mx-1">
                                    <i class="fab fa-twitter"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a class="btn-floating btn-sm rgba-white-slight mx-1">
                                    <i class="fab fa-google-plus-g"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a class="btn-floating btn-sm rgba-white-slight mx-1">
                                    <i class="fab fa-linkedin-in"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Grid column -->
            </div>
            <!-- Grid row -->
        </div>
        <!-- Footer Links -->
    </footer>
    <!-- footer -->
</body>

</html>