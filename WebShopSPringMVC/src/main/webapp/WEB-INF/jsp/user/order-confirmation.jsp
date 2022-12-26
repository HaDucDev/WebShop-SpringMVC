<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/user" var="url"> </c:url>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cart | E-Shopper</title>
    <link href="${url}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${url}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${url}/css/main.css" rel="stylesheet">
    <link href="${url}/css/responsive.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <style>
        h5 {
            padding: 10px 0px;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
            integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
            integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
            crossorigin="anonymous"></script>
    <style>
        .invoice-title h2, .invoice-title h3 {
            display: inline-block;
        }

        .table > tbody > tr > .no-line {
            border-top: none;
        }

        .table > thead > tr > .no-line {
            border-bottom: none;
        }

        .table > tbody > tr > .thick-line {
            border-top: 2px solid;
        }
    </style>
</head>

<body>
<jsp:include page="a-header.jsp"></jsp:include>
<br>
<div class="container">
    <form action="${pageContext.request.contextPath }/validationlogin" method="post" id="login-form">
        <div class="row" style=" min-height: 100vh;">
            <div class="col-12">
                <div class="row" style=" margin-top: 100px;">
                    <div class="col-1"></div>
                    <div class="col-4">
                        <div class="login-form">

                            <div class="form-group">
                                <label for="name">Tên người nhận</label>
                                <input id="name" name="name" type="text" class="form-control"
                                       placeholder="Tên người nhận">
                                <span class="form-message"></span>
                            </div>
                            <div class="form-group">
                                <label for="address">Địa chỉ nhận</label>
                                <input id="address" name="address" type="password" class="form-control"
                                       placeholder="Đía chỉ nhận hàng">
                                <span class="form-message"></span>
                            </div>
                            <div class="form-group">
                                <label for="sdt">Số điện thoại</label>
                                <input id="sdt" name="address" type="password" class="form-control"
                                       placeholder="Số điện thoại">
                                <span class="form-message"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-1" style="border-left: solid 1px #333 "></div>
                    <div class="col-5">
                        <div class="col-8">
                            <h4>Chọn phương thức thanh toán</h4>
                                <div class="form-group">
                                    <div class="form-check">
                                        <input class="form-check-input form-control" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            Nhận hàng trả tiền
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input form-control" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            Thanh toán online với MoMo
                                        </label>
                                    </div>
                                </div>
                                <label style="color: green">${msg}</label><br>
                                <button type="submit" class="btn btn-success btn-primary "
                                        style="margin-top: 1px; color: white; background-color: #696763; border: none;">
                                    Xác nhận đặt đơn hàng
                                </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>Order summary</strong></h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive" style="width:100%; height:350px; overflow:auto; margin: auto">
                            <table class="table table-condensed">
                                <thead>
                                <tr>
                                    <td><strong>Mã sản phẩm</strong></td>
                                    <td class="text-center"><strong>Ảnh sản phẩm</strong></td>
                                    <td class="text-center"><strong>Tên sản phẩm</strong></td>
                                    <td class="text-center"><strong>Giá</strong></td>
                                    <td class="text-center"><strong>Số lượng</strong></td>
                                    <td class="text-right"><strong>Tổng cộng</strong></td>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${cartList}" var="cart">
                                    <tr>
                                        <th>
                                            <a href="">${cart.product.id}</a>
                                        </th>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${cart.product.productImage != null}">
                                                    <img style="width: 50px;height: 50px;object-fit: cover"
                                                         src="<c:url value="${cart.product.productImage}"/>"
                                                         alt="${cart.product.productName}">
                                                </c:when>
                                                <c:otherwise>
                                                    <img style="width: 100px;height: 100px;object-fit: cover"
                                                         src="<c:url value="/images/Rayquaza.png"/>"
                                                         alt="${cart.product.productName}">
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <p><a href="">${cart.product.productName}</a></p>
                                        </td>
                                        <td class="text-center">
                                            <p>${cart.product.unitPrice} VNĐ</p>
                                            <p>${(cart.product.unitPrice)} giam gia VNĐ</p>
                                        </td>
                                        <td class="text-center">
                                            <div class="cart_quantity_button">
                                                <input class="cart_quantity_input" readonly value="${cart.quantity}"
                                                       autocomplete="off" style="width: 60px">
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <p id="total"><fmt:formatNumber type="number"
                                                                            value="${cart.product.unitPrice*cart.quantity}"/>
                                                VNĐ</p>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td class="no-line"></td>
                                    <td class="no-line"></td>
                                    <td class="no-line"></td>
                                    <td class="no-line"></td>
                                    <td class="no-line text-center"><strong>Shipping</strong></td>
                                    <td class="no-line text-right">$15</td>
                                </tr>
                                <tr>
                                    <td class="no-line"></td>
                                    <td class="no-line"></td>
                                    <td class="no-line"></td>
                                    <td class="no-line"></td>
                                    <td class="no-line text-center"><strong>Total</strong></td>
                                    <td class="no-line text-right">$685.99</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<br>
<jsp:include page="a-footer.jsp"></jsp:include>
<script src="${url}/js/jquery.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<script src="${url}/js/jquery.scrollUp.min.js"></script>
<script src="${url}/js/jquery.prettyPhoto.js"></script>
<script src="${url}/js/main.js"></script>

</body>
</html>
