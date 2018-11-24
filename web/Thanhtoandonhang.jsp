<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Thanh toán đơn hàng</title>
    <!--meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>

    <!--//meta tags ends here-->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <!-- font-awesome icons -->
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!--//Shoping cart-->
    <link rel="stylesheet" href="resources/css/checkout.css" type="text/css" />
    <link rel="stylesheet" href="resources/css/style.css" type="text/css" />
    <!--js working-->
    <script src="resources/js/jquery-2.2.3.min.js"></script>
    <script src="resources/js/jquery-ui.js"></script>
    <!-- start-smoth-scrolling -->
    <script src="resources/js/move-top.js"></script>
    <script src="resources/js/easing.js"></script>
    <!--bootstrap working-->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- //bootstrap working-->
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
    <script type="text/javascript">
        var parseQueryString = function (url) {

            var str = url;
            var objURL = {};

            str.replace(
                new RegExp("([^?=&]+)(=([^&]*))?", "g"),
                function ($0, $1, $2, $3) {

                    if ($3 != undefined && $3 != null)
                        objURL[$1] = decodeURIComponent($3);
                    else
                        objURL[$1] = $3;
                });

            return objURL;
        }; 
    </script>
    <script type="text/javascript">
        window.onpageshow = function (event) {
            if (event.persisted) {
                var currentUrl = '';
                currentUrl = '/checkouts/b1ce2b39d36740a0a7cd7a3ef2078d73?step=1';
                if (currentUrl)
                    window.location = currentUrl;
            }
        };
        var isInit = false;

        function funcFormOnSubmit(e) {
            if (!isInit) {
                isInit = true;

                $.fn.tagName = function () {
                    return this.prop("tagName").toLowerCase();
                };
            }
            if (typeof (e) == 'string') {
                var element = $(e);
                var formData = e;
            } else {
                var element = this;
                var formData = this;
                e.preventDefault();
            }
            $(element).find('button:submit').addClass('btn-loading');
            var formId = $(element).attr('id'), replaceElement = [], funcCallback;
            if (formId == undefined || formId == null || formId == '')
                return;

            if (formId == 'form_next_step') {
                formData = '.step-sections';
                replaceElement.push('.step-sections');
            }

            else if (
                formId == 'form_discount_add'
                || formId == 'form_discount_remove'
                || formId == 'form_update_location'
                || formId == 'section-shipping-rate'
            ) {
                replaceElement.push('#form_update_location');
                replaceElement.push('#change_pick_location_or_shipping');
                replaceElement.push('.inventory_location_data');
                replaceElement.push('.order-summary-toggle-inner .order-summary-toggle-total-recap');
                replaceElement.push('.order-summary-sections');
                replaceElement.push('#section-shipping-rate');
            }

            if (!$(formData) || $(formData).length == 0) {
                window.location.reload();
                return false;
            }

            var inputurl = '';

            if (($(formData).tagName() != 'form' && $(formData).tagName() != 'input' && $(formData).tagName() != 'div')
                || ($(formData).tagName() == 'input' || $(formData).tagName() == 'div')) {

                formData += ' :input';
            }
            try {
                var listparameters = new URLSearchParams($(formData).serialize());
                var provincetmp = $('body').find('input[name$="selected_customer_shipping_province"]').val();
                if (provincetmp != '') listparameters.set('customer_shipping_province', provincetmp);

                var districttmp = $('body').find('input[name$="selected_customer_shipping_district"]').val();
                if (districttmp != '') listparameters.set('customer_shipping_district', districttmp);

                var wardtmp = $('body').find('input[name$="selected_customer_shipping_ward"]').val();
                if (wardtmp != '') listparameters.set('customer_shipping_ward', wardtmp);

                listparameters.delete('selected_customer_shipping_province');
                listparameters.delete('selected_customer_shipping_district');
                listparameters.delete('selected_customer_shipping_ward');
                inputurl = listparameters.toString();

            } catch (err) {

                // Older Browser URLSearchParams not support
                var listparameters = parseQueryString($(formData).serialize());
                var provincetmp = $('body').find('input[name$="selected_customer_shipping_province"]').val();
                if (provincetmp != '' && listparameters.customer_shipping_province) listparameters.customer_shipping_province = provincetmp;

                var districttmp = $('body').find('input[name$="selected_customer_shipping_district"]').val();
                if (districttmp != '' && listparameters.customer_shipping_district) listparameters.customer_shipping_district = districttmp;

                var wardtmp = $('body').find('input[name$="selected_customer_shipping_ward"]').val();
                if (wardtmp != '' && listparameters.customer_shipping_ward) listparameters.customer_shipping_ward = wardtmp;

                delete listparameters.selected_customer_shipping_province;
                delete listparameters.selected_customer_shipping_district;
                delete listparameters.selected_customer_shipping_ward;

                var listObject = '';
                for (var key in listparameters) {
                    listObject += '&' + key + '=' + encodeURIComponent(listparameters[key]);
                };
                inputurl = listObject.substring(1);

            }

            $.ajax({
                type: 'GET',
                url: window.location.origin + window.location.pathname + '?' + inputurl + encodeURI('&form_name=' + formId),
                success: function (html) {
                    if ($(html).attr('id') == 'redirect-url') {
                        window.location = $(html).val();
                    } else {
                        if (replaceElement.length > 0) {
                            for (var i = 0; i < replaceElement.length; i++) {
                                var tempElement = replaceElement[i];
                                var newElement = $(html).find(tempElement);

                                if (newElement.length > 0) {
                                    if (tempElement == '.step-sections')
                                        $(tempElement).attr('step', $(newElement).attr('step'));

                                    var listTempElement = $(tempElement);

                                    for (var j = 0; j < newElement.length; j++)
                                        if (j < listTempElement.length)
                                            $(listTempElement[j]).html($(newElement[j]).html());
                                }
                            }
                        }
                        $("#div_location_country_not_vietnam").hide();
                        var is_vietnam = $("#is_vietnam").val();
                        if (is_vietnam && is_vietnam == "true") {
                            $("#div_country_not_vietnam").hide();
                        }
                        else {
                            $("#div_country_not_vietnam").show();
                        }

                        $('body').attr('src', $(html).attr('src'));
                        $(element).find('button:submit').removeClass('btn-loading');

                        if (($('body').find('.field-error') && $('body').find('.field-error').length > 0)
                            || ($('body').find('.has-error') && $('body').find('.has-error').length > 0)) {
                            $("html, body").animate({ scrollTop: 0 }, "slow");
                        }
                        if (funcCallback)
                            funcCallback();
                    }
                }
            }).fail(function () {
                $(element).find('button:submit').removeClass('btn-loading');
            });

            return false;
        };
        function funcSetEvent() {
            var effectControlFieldClass = '.field input, .field select, .field textarea';

            $('body')
                .on('focus', effectControlFieldClass, function () {
                    funcFieldFocus($(this), true);
                })
                .on('blur', effectControlFieldClass, function () {
                    funcFieldFocus($(this), false);
                    funcFieldHasValue($(this), true);
                })
                .on('keyup input paste', effectControlFieldClass, function () {
                    funcFieldHasValue($(this), false);
                })
                .on('submit', 'form', funcFormOnSubmit);

            $("#div_location_country_not_vietnam").hide();
            $("#is_vietnam").val("true");
            $("#div_country_not_vietnam").hide();

            $('body')
                .on('change', '#form_update_location', function () {
                    $(this).submit();
                });

            $('body')

                .on('change', '#form_update_location select[name=customer_shipping_country]', function () {
                    var currentCountry = $(this).val();
                    if (currentCountry && currentCountry != "null" && currentCountry != 241) {
                        $("#is_vietnam").val("false");
                        $("#div_country_not_vietnam").show();
                    }
                    else {
                        $("#is_vietnam").val("true");
                        $("#div_country_not_vietnam").hide();
                    }
                })

                .on('change', '#form_update_location select[name=customer_shipping_district]', function () {
                    $('.section-customer-information input:hidden[name=customer_shipping_district]').val($(this).val());
                })
                .on('change', '#form_update_location select[name=customer_shipping_ward]', function () {
                    $('.section-customer-information input:hidden[name=customer_shipping_ward]').val($(this).val());
                });

            $('body')
                .on('change', '#form_update_shipping_method input:radio', function () {
                    $('#form_update_shipping_method .content-box-row.content-box-row-secondary').addClass('hidden');

                    var id = $(this).attr('id');

                    if (id) {
                        var sub = $('body').find('.content-box-row.content-box-row-secondary[for=' + id + ']')

                        if (sub && sub.length > 0) {
                            $(sub).removeClass('hidden');
                        }
                    }
                });

            $('body')
                .on('change', '#section-payment-method input:radio', function () {
                    $('#section-payment-method .content-box-row.content-box-row-secondary').addClass('hidden');

                    var id = $(this).attr('id');

                    if (id) {
                        var sub = $('body').find('.content-box-row.content-box-row-secondary[for=' + id + ']')

                        if (sub && sub.length > 0) {
                            $(sub).removeClass('hidden');
                        }
                    }
                });


            $('body')
                .on('change', '#section-shipping-rate input:radio[name=shipping_rate_id]', function () {
                    funcFormOnSubmit('#section-shipping-rate');
                });
        };
        function funcFieldFocus(fieldInputElement, isFocus) {
            if (fieldInputElement == undefined)
                return;

            var fieldElement = $(fieldInputElement).closest('.field');

            if (fieldElement == undefined)
                return;

            if (isFocus)
                $(fieldElement).addClass('field-active');
            else
                $(fieldElement).removeClass('field-active');
        };
        function funcFieldHasValue(fieldInputElement, isCheckRemove) {
            if (fieldInputElement == undefined)
                return;

            var fieldElement = $(fieldInputElement).closest('.field');

            if (fieldElement == undefined)
                return;

            if ($(fieldElement).find('.field-input-wrapper-select').length > 0) {
                var value = $(fieldInputElement).find(':selected').val();

                if (value == 'null')
                    value = undefined;
            } else {
                var value = $(fieldInputElement).val();
            }

            if (!isCheckRemove) {
                if (value != $(fieldInputElement).attr('value'))
                    $(fieldElement).removeClass('field-error');
            }

            var fieldInputBtnWrapperElement = $(fieldInputElement).closest('.field-input-btn-wrapper');

            if (value && value.trim() != '') {
                $(fieldElement).addClass('field-show-floating-label');
                $(fieldInputBtnWrapperElement).find('button:submit').removeClass('btn-disabled');
            }
            else if (isCheckRemove) {
                $(fieldElement).removeClass('field-show-floating-label');
                $(fieldInputBtnWrapperElement).find('button:submit').addClass('btn-disabled');
            }
            else {
                $(fieldInputBtnWrapperElement).find('button:submit').addClass('btn-disabled');
            }
        };
        function funcInit() {
            funcSetEvent();
        }
        $(document).ready(function () {
            funcInit();
        });
    </script>
    <script type="text/javascript">
        var toggleShowOrderSummary = false;
        $(document).ready(function () {
            var currentUrl = '';
            currentUrl = '/checkouts/b1ce2b39d36740a0a7cd7a3ef2078d73?step=1';

            if ($('#reloadValue').val().length == 0) {
                $('#reloadValue').val(currentUrl);
                $('body').show();
            }
            else {
                window.location = $('#reloadValue').val();
                $('#reloadValue').val('');
            }

            $('body')
                .on('click', '.order-summary-toggle', function () {
                    toggleShowOrderSummary = !toggleShowOrderSummary;

                    if (toggleShowOrderSummary) {
                        $('.order-summary-toggle')
                            .removeClass('order-summary-toggle-hide')
                            .addClass('order-summary-toggle-show');

                        $('.sidebar:not(".sidebar-second") .sidebar-content .order-summary')
                            .removeClass('order-summary-is-collapsed')
                            .addClass('order-summary-is-expanded');

                        $('.sidebar.sidebar-second .sidebar-content .order-summary')
                            .removeClass('order-summary-is-expanded')
                            .addClass('order-summary-is-collapsed');
                    } else {
                        $('.order-summary-toggle')
                            .removeClass('order-summary-toggle-show')
                            .addClass('order-summary-toggle-hide');

                        $('.sidebar:not(".sidebar-second") .sidebar-content .order-summary')
                            .removeClass('order-summary-is-expanded')
                            .addClass('order-summary-is-collapsed');

                        $('.sidebar.sidebar-second .sidebar-content .order-summary')
                            .removeClass('order-summary-is-collapsed')
                            .addClass('order-summary-is-expanded');
                    }
                });
        });
    </script>
    <script type="text/javascript">
        //<![CDATA[
        if ((typeof Haravan) === 'undefined') {
            Haravan = {};
        }
        Haravan.culture = 'vi-VN';
        Haravan.shop = 'daohaisan.myharavan.com';
        Haravan.theme = { "name": "update 02/07/2018__daohaisan", "id": 1000382425, "role": "main" };
        Haravan.domain = 'daohaisan.vn';
        //]]>
    </script>
    <script type="text/javascript">
        window.HaravanAnalytics = window.HaravanAnalytics || {};
        window.HaravanAnalytics.meta = window.HaravanAnalytics.meta || {};
        window.HaravanAnalytics.meta.currency = 'VND';
        var meta = { "page": { "pageType": "checkout", "resourceType": "checkout", "resourceId": "b1ce2b39d36740a0a7cd7a3ef2078d73" }, "cart": { "products": [{ "variantId": 1033641790, "productId": 1017420107, "price": 67000000.0, "name": "Crawfish Sống (Tôm Hùm Đất) - 1kg", "vendor": "Khác", "variant": "1kg", "type": "Khác", "quantity": 1 }, { "variantId": 1004258118, "productId": 1001098951, "price": 109000000.0, "name": "Tôm Hùm Alaska Sống - 1Kg (Size>600g/con)", "vendor": "Khác", "variant": "1Kg (Size>600g/con)", "type": "Khác", "quantity": 1 }], "item_count": 2, "total_price": 176000000.0 } };
        for (var attr in meta) {
            window.HaravanAnalytics.meta[attr] = meta[attr];
        }
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
                                <p>Chào <a href="Profile.jsp">Diêu</a></p>
                                <p>|</p>
                                <p><a href="TrangChu.jsp">Thoát</a></p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="hedder-up row">
                        <div style="max-width:20%" class="col-lg-3 col-md-3 logo-head">
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
            <li><a href="Cart.jsp">Giỏ hàng</a></li>
            <li>Thông tin giao hàng</li>
        </div>
    </ul>
    <div class="content">
        <div class="wrap">
            <div class="sidebar">
                <div class="sidebar-content">
                    <div class="order-summary order-summary-is-collapsed">
                        <h2 class="visually-hidden">Thông tin đơn hàng</h2>
                        <div class="order-summary-sections">
                            <div class="order-summary-section order-summary-section-product-list"
                                data-order-summary-section="line-items">
                                <table class="product-table">
                                    <thead>
                                        <tr>
                                            <th scope="col"><span class="visually-hidden">Hình ảnh</span></th>
                                            <th scope="col"><span class="visually-hidden">Mô tả</span></th>
                                            <th scope="col"><span class="visually-hidden">Số lượng</span></th>
                                            <th scope="col"><span class="visually-hidden">Giá</span></th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr class="product" data-product-id="1017420107" data-variant-id="1033641790">
                                            <td class="product-image">
                                                <div class="product-thumbnail">
                                                    <div class="product-thumbnail-wrapper">
                                                        <img class="product-thumbnail-image" alt="Crawfish Sống (Tôm Hùm Đất)"
                                                            src="resources/images/Shrmip/Lobster/tom-hum-tre-01.jpg">
                                                    </div>
                                                    <span class="product-thumbnail-quantity" aria-hidden="true">1</span>
                                                </div>
                                            </td>
                                            <td class="product-description">
                                                <span class="product-description-name order-summary-emphasis">Crawfish
                                                    Sống (Tôm Hùm Đất)</span>

                                                <span class="product-description-variant order-summary-small-text">
                                                    1kg
                                                </span>

                                            </td>
                                            <td class="product-quantity visually-hidden">1</td>
                                            <td class="product-price">
                                                <span class="order-summary-emphasis">670,000 đ</span>
                                            </td>
                                        </tr>

                                        <tr class="product" data-product-id="1001098951" data-variant-id="1004258118">
                                            <td class="product-image">
                                                <div class="product-thumbnail">
                                                    <div class="product-thumbnail-wrapper">
                                                        <img class="product-thumbnail-image" alt="Tôm Hùm Alaska Sống"
                                                            src="resources/images/Shrmip/Lobster/tom-hum-bong01.jpg">
                                                    </div>
                                                    <span class="product-thumbnail-quantity" aria-hidden="true">1</span>
                                                </div>
                                            </td>
                                            <td class="product-description">
                                                <span class="product-description-name order-summary-emphasis">Tôm Hùm
                                                    Alaska Sống</span>

                                                <span class="product-description-variant order-summary-small-text">
                                                    1Kg (Size&gt;600g/con)
                                                </span>

                                            </td>
                                            <td class="product-quantity visually-hidden">1</td>
                                            <td class="product-price">
                                                <span class="order-summary-emphasis">1,090,000 đ</span>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>

                            <div class="order-summary-section order-summary-section-total-lines"
                                data-order-summary-section="payment-lines">
                                <table class="total-line-table">
                                    <thead>
                                        <tr>
                                            <th scope="col"><span class="visually-hidden">Mô tả</span></th>
                                            <th scope="col"><span class="visually-hidden">Giá</span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="total-line total-line-subtotal">
                                            <td class="total-line-name">Tạm tính</td>
                                            <td class="total-line-price">
                                                <span class="order-summary-emphasis"
                                                    data-checkout-subtotal-price-target="176000000">
                                                    1,760,000 đ
                                                </span>
                                            </td>
                                        </tr>

                                        <tr class="total-line total-line-shipping">
                                            <td class="total-line-name">Phí vận chuyển</td>
                                            <td class="total-line-price">
                                                <span class="order-summary-emphasis"
                                                    data-checkout-total-shipping-target="0">
                                                    Miễn phí
                                                </span>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <tfoot class="total-line-table-footer">
                                        <tr class="total-line">
                                            <td class="total-line-name payment-due-label">
                                                <span class="payment-due-label-total">Tổng cộng</span>
                                            </td>
                                            <td class="total-line-name payment-due">
                                                <span class="payment-due-currency">VND</span>
                                                <span class="payment-due-price" data-checkout-payment-due-target="176000000">
                                                    1,760,000 đ
                                                </span>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main">
                <div class="main-content">
                    <div class="step">
                        <div class="step-sections steps-onepage" step="1">
                            <div class="section">
                                <div class="section-header">
                                    <h2 class="section-title">Thông tin giao hàng</h2>
                                </div>
                                <div class="section-content section-customer-information no-mb">
                                    <div class="fieldset">
                                        <div class="field    field-show-floating-label">
                                            <div class="field-input-wrapper">
                                                <label class="field-label" for="billing_address_full_name">Họ và tên</label>
                                                <input placeholder="Họ và tên" autocapitalize="off" spellcheck="false"
                                                    class="field-input" size="30" type="text" id="billing_address_full_name"
                                                    name="billing_address[full_name]" value="Jaxkie Phạm" disabled>
                                            </div>
                                        </div>
                                        <div class="field  field-two-thirds   field-show-floating-label">
                                            <div class="field-input-wrapper">
                                                <label class="field-label" for="checkout_user_email">Email</label>
                                                <input placeholder="Email" autocapitalize="off" spellcheck="false"
                                                    class="field-input" size="30" type="email" id="checkout_user_email"
                                                    name="checkout_user[email]" value="16110291@student.hcmute.edu.vn" disabled>
                                            </div>
                                        </div>
                                        <div class="field field-required field-third   field-show-floating-label">
                                            <div class="field-input-wrapper">
                                                <label class="field-label" for="billing_address_phone">Số điện thoại</label>
                                                <input placeholder="Số điện thoại" autocapitalize="off" spellcheck="false"
                                                    class="field-input" size="30" maxlength="11" type="tel" id="billing_address_phone"
                                                    name="billing_address[phone]" value="0586060734" disabled>
                                            </div>
                                        </div>
                                        <div class="field field-required   field-show-floating-label">
                                            <div class="field-input-wrapper">
                                                <label class="field-label" for="billing_address_address1">Địa chỉ</label>
                                                <input placeholder="Địa chỉ" autocapitalize="off" spellcheck="false"
                                                    class="field-input" size="30" type="text" id="billing_address_address1"
                                                    name="billing_address[address1]" value="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="section-content">
                                    <div class="fieldset">
                                        <form id="form_update_location" class="clearfix" accept-charset="UTF-8" method="post">
                                            <input name="selected_customer_shipping_province" type="hidden" value="">
                                            <input name="selected_customer_shipping_district" type="hidden" value="">
                                            <input name="selected_customer_shipping_ward" type="hidden" value="">
                                            <input name="utf8" type="hidden" value="✓">
                                            <div class="field field-show-floating-label field-required field-half ">
                                                <div class="field-input-wrapper field-input-wrapper-select">
                                                    <label class="field-label" for="customer_shipping_province"> Tỉnh /
                                                        thành </label>
                                                    <select class="field-input" id="customer_shipping_province" name="customer_shipping_province">
                                                        <option data-code="null" value="null"> Chọn tỉnh / thành
                                                        </option>
                                                        <option data-code="HC" value="50" selected="">Hồ Chí Minh</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="field field-show-floating-label field-required field-half ">
                                                <div class="field-input-wrapper field-input-wrapper-select">
                                                    <label class="field-label" for="customer_shipping_district">Quận /
                                                        huyện</label>
                                                    <select class="field-input" id="customer_shipping_district" name="customer_shipping_district">
                                                        <option data-code="null" value="null">Chọn quận / huyện</option>
                                                        <option data-code="HC466" value="466">Quận 1</option>
                                                        <option data-code="HC467" value="467">Quận 2</option>
                                                        <option data-code="HC468" value="468">Quận 3</option>
                                                        <option data-code="HC469" value="469">Quận 4</option>
                                                        <option data-code="HC470" value="470">Quận 5</option>
                                                        <option data-code="HC471" value="471">Quận 6</option>
                                                        <option data-code="HC472" value="472" selected="">Quận 7</option>
                                                        <option data-code="HC473" value="473">Quận 8</option>
                                                        <option data-code="HC474" value="474">Quận 9</option>
                                                        <option data-code="HC475" value="475">Quận 10</option>
                                                        <option data-code="HC476" value="476">Quận 11</option>
                                                        <option data-code="HC477" value="477">Quận 12</option>
                                                        <option data-code="HC478" value="478">Quận Gò Vấp</option>
                                                        <option data-code="HC479" value="479">Quận Tân Bình</option>
                                                        <option data-code="HC480" value="480">Quận Bình Thạnh</option>
                                                        <option data-code="HC481" value="481">Quận Phú Nhuận</option>
                                                        <option data-code="HC482" value="482">Quận Thủ Đức</option>
                                                        <option data-code="HC483" value="483">Huyện Củ Chi</option>
                                                        <option data-code="HC484" value="484">Huyện Hóc Môn</option>
                                                        <option data-code="HC485" value="485">Huyện Bình Chánh</option>
                                                        <option data-code="HC486" value="486">Huyện Nhà Bè</option>
                                                        <option data-code="HC487" value="487">Huyện Cần Giờ</option>
                                                        <option data-code="HC679" value="679">Quận Bình Tân</option>
                                                        <option data-code="HC680" value="680">Quận Tân Phú</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="section-content section-customer-information fieldset" id="div_country_not_vietnam"
                                        style="display: none;">
                                        <div class="field field-two-thirds">
                                            <div class="field-input-wrapper">
                                                <label class="field-label" for="billing_address_city">Thành phố</label>
                                                <input placeholder="Thành phố" autocapitalize="off" spellcheck="false"
                                                    class="field-input" size="30" type="text" id="billing_address_city"
                                                    name="billing_address[city]" value="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="change_pick_location_or_shipping">
                                    <div id="section-shipping-rate">
                                        <div class="section-header">
                                            <h2 class="section-title">Phương thức vận chuyển</h2>
                                        </div>
                                        <div class="section-content">
                                            <div class="content-box">
                                                <div class="content-box-row">
                                                    <div class="radio-wrapper">
                                                        <label class="radio-label" for="shipping_rate_id_429651">
                                                            <div class="radio-input">
                                                                <input id="shipping_rate_id_429651" class="input-radio"
                                                                    type="radio" name="shipping_rate_id" value="429651"
                                                                    checked="">
                                                            </div>
                                                            <span class="radio-label-primary">Freeship từ 500,000đ. Nội
                                                                thành &amp; giờ hành chính</span>
                                                            <span class="radio-accessory content-box-emphasis">
                                                                0 đ
                                                            </span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="section-payment-method" class="section">
                                        <div class="section-header">
                                            <h2 class="section-title">Phương thức thanh toán</h2>
                                        </div>
                                        <div class="section-content">
                                            <div class="content-box">
                                                <div class="radio-wrapper content-box-row">
                                                    <label class="radio-label" for="payment_method_id_79912">
                                                        <div class="radio-input">
                                                            <input id="payment_method_id_79912" class="input-radio"
                                                                name="payment_method_id" type="radio" value="79912"
                                                                checked="">
                                                        </div>
                                                        <span class="radio-label-primary">Thanh toán khi giao hàng
                                                            (COD)</span>
                                                    </label>
                                                </div>
                                                <div class="radio-wrapper content-box-row content-box-row-secondary"
                                                    for="payment_method_id_79912">
                                                    <div class="blank-slate">
                                                        Tiêu Dân Seafood sẽ giao hàng và thu tiền tận nơi ngay khi bạn
                                                        nhận
                                                        được hàng tại khu vực TPHCM
                                                    </div>
                                                </div>
                                                <div class="radio-wrapper content-box-row">
                                                    <label class="radio-label" for="payment_method_id_79913">
                                                        <div class="radio-input">
                                                            <input id="payment_method_id_79913" class="input-radio"
                                                                name="payment_method_id" type="radio" value="79913">
                                                        </div>
                                                        <span class="radio-label-primary">Chuyển khoản qua ngân hàng</span>
                                                    </label>
                                                </div>

                                                <div class="radio-wrapper content-box-row content-box-row-secondary hidden"
                                                    for="payment_method_id_79913">
                                                    <div class="blank-slate">
                                                        Nếu bạn muốn thanh toán trước có thể chuyển khoản cho Tiêu Dân
                                                        Seafood qua tài khoản:
                                                        Ngân hàng : BIDV - CN Đông Sài Gòn,phường Bình Thọ, quận Thủ
                                                        Đức, Tp. Hồ Chí Minh.
                                                        Số TK : 01xxxxxxxxxxxx
                                                        Chủ TK : Nguyễn Thanh Tân.
                                                        Sau khi chuyển khoản vui lòng thông báo cho chúng tôi biết qua
                                                        Hotline : 1900.0098
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="step-footer">
                            <form id="form_next_step" accept-charset="UTF-8" method="post">
                                <input name="utf8" type="hidden" value="✓">
                                <button type="submit" class="step-footer-continue-btn btn" onclick="window.location.href='Hoadon.jsp'">
                                    <span class="btn-content">Hoàn tất đơn hàng</span>
                                    <i class="btn-spinner icon icon-button-spinner"></i>
                                </button>
                            </form>
                            <a class="step-footer-previous-link" href="Cart.jsp">
                                <svg class="previous-link-icon icon-chevron icon" xmlns="http://www.w3.org/2000/svg"
                                    width="6.7" height="11.3" viewBox="0 0 6.7 11.3">
                                    <path d="M6.7 1.1l-1-1.1-4.6 4.6-1.1 1.1 1.1 1 4.6 4.6 1-1-4.6-4.6z"></path>
                                </svg>
                                Giỏ hàng
                            </a>
                        </div>
                    </div>
                </div>
                <div class="main-footer">
                </div>
            </div>
        </div>
    </div>

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