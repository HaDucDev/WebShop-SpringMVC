<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/trang-chu" var="HomeUrl"> </c:url>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hoàn tất đơn hàng</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12" style="margin: 20px 20px;"><a href="${HomeUrl}?action=home"><i style="color: black" class="fas fa-home fa-4x"></i></a></h1></div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-1"></div>
        <div class="col-5" style="border-right: solid 0.5px #333;">
            <div class="row">
                <h3><strong>4guysellinggear</strong></h3>
            </div>
            <div class="row" style="padding:30px 0px;">
                <div class="col-1">
                    <svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="green" class="bi bi-cart-check" viewBox="0 0 16 16">
                        <path d="M11.354 6.354a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
                        <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                    </svg>
                </div>
                <div class="col-6" style="padding-left: 50px;">
                    <h5 style="margin-bottom: 0px;">Đặt hàng thành công</h5>
                    <p>Mã đơn hàng #${cart.id} <br>Cảm ơn bạn đã mua hàng</p>
                </div>
            </div>
            <div class="row">
                <div class="col-10" style="padding: 15px 0px 0px 20px; border: solid 0.5px rgba(0,0,0,0.3); border-radius: 10px;">
                    <h5 style="margin-bottom: 0px;">Thông tin đơn hàng</h5>
                    <p style="padding: 10px 0px; margin: 0px;">Thông tin giao hàng</p>
                    ${user.getFullname()}
                    <br>${user.getPhone_number()}
                    <br>${user.getEmail()}
                    <br>${user.getAddress()}</p>
                    <h5 style="margin-bottom: 0px; padding: 0px 0px 10px 0px;">Phương thức thanh toán</h5>
                    <p>
                        ${payment}
                    </p>
                </div>
            </div>
            <div class="row" style="padding: 10px 0px;">
                <div class="col-10 d-grid gap-2 d-md-flex justify-content-md-end " style="padding: 10px 0px;">
                    <button class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/client-product-list?type=list&page=1'" >Tiếp tục mua hàng</button>
                </div>
            </div>
        </div>
        <div class="col-5" style="padding-left: 100px;">
            <div class="row">
                <table class="table table-borderless">
                    <thead>
                    <th>Hình ảnh</th>
                    <th>Tên Sản Phẩm</th>
                    <th>Số lượng</th>
                    <th style="width: 100px">Thành Tiền</th>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${cart.getProductCartEntityList()}">
                        <tr>
                            <c:url value="/image/${item.getProductEntity().getImage()}" var="imgUrl"></c:url>
                            <td><img src="${imgUrl}" alt="" style="height: 50px; width: auto;"></td>
                            <td>${item.getProductEntity().getProName()}</td>
                            <td>${item.getQuantity()}</td>
<%--                            <td>${item.getQuantity()*item.getUnitPrice()}</td>--%>
                            <td ><fmt:formatNumber type="number" value="${item.getUnitPrice()*item.getQuantity()}" /> VNĐ</td>

                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
            <hr>
            <div class="row d-flex justify-content-between">
                <div class="col-12 d-flex justify-content-between">
                    <p>Tạm tính</p>

                    <p ><fmt:formatNumber type="number" value="${totalPrice}" /></p>
                    <p> VNĐ</p>

                </div>

            </div>
            <div class="row d-flex justify-content-between">
                <div class="col-12 d-flex justify-content-between">
                    <p>Phí vận chuyển</p>
                    <p>Miễn Phí</p>
                </div>
            </div>
            <hr>
            <div class="row d-flex justify-content-between">
                <div class="col-12 d-flex justify-content-between">
                    <h4>Tổng cộng  </h4>
<%--                    <h4>${totalPrice}</h4>--%>
                    <h4 ><fmt:formatNumber type="number" value="${totalPrice}" /> </h4>
                    <h4>VNĐ</h4>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
</body>
</html>