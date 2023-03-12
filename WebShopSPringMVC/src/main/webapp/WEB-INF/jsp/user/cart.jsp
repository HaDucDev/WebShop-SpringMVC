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
</head>

<body>
<jsp:include page="a-header.jsp"></jsp:include>
<br>
<h1 class="text-center">Giỏ hàng của bạn</h1>
<section id="cart_items">
    <div class="container">
        <div class="table-responsive table-wrapper-scroll-y my-custom-scrollbar" >
            <table class="table table-hover table-fixed table-bordered table-striped mb-0">
                <thead>
                <tr class="cart_menu">
                    <th class="id" scope="col">Mã sản phẩm</th>
                    <th class="image" scope="col">Ảnh sản phẩm</th>
                    <th class="name" scope="col">Tên sản phẩm</th>
                    <th class="price" scope="col">Giá</th>
                    <th class="quantity" scope="col">Số lượng</th>
                    <th class="total" scope="col">Tổng cộng</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${cartList}" var="cart">
                    <tr class="table-info ">
                        <th scope="row">
                            <h4>${cart.product.id}</h4>
                        </th>
                        <td>
                            <c:choose>
                                <c:when test="${cart.product.productImage != null}">
                                    <img style="width: 60px;height: 60px;object-fit: cover"
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
                        <td>
                            <p><a href="<c:url value="/product/${p.id}"/>">${cart.product.productName}</a></p>
                        </td>
                        <td>
                            <p>${Math.round(cart.product.unitPrice-cart.product.unitPrice*cart.product.discount/100)} VNĐ</p>
                            <p><s>${(cart.product.unitPrice)}VNĐ</s></p>
                        </td>
                        <td>
                            <div class="cart_quantity_button">
                                <a class="cart_quantity_up" onclick="updateCartAdd(${cart.product.id})"
                                   href=""> + </a>
                                <input class="cart_quantity_input" type="number" name="quantity" id="cart_quantity_input"
                                       value="${cart.quantity}" autocomplete="off" size="2" min="1" style="width: 60px" readonly>
                                <a class="cart_quantity_down"
                                   onclick="updateCartSub(${cart.product.id})" href=""> - </a>
                            </div>
                        </td>
                        <td>
                            <p id="total"><fmt:formatNumber type="number" value="${cart.product.unitPrice*cart.quantity}"/> VNĐ</p>
                        </td>
                        <td class="cart_delete">
                            <a class="cart_quantity_delete"
                               href="<c:url value="/user/delete-cart/${cart.id}"/>"><i class="fa fa-times"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div style="float:right"><a href="<c:url value="/user/order-confirmation/api"/>" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Xác nhận</a></div>
    </div>
</section> <!--/#cart_items-->


<br>
<jsp:include page="a-footer.jsp"></jsp:include>
<c:url value="/user/cart-list" var="APIurl"> </c:url>
<script>
    function updateCartAdd(productId){
        fetch("/WebShopSPringMVC_war/api/cart/add",{
            method:'put',
            body: JSON.stringify({
                "productId":productId,
            }),
            headers:{
                "Content-Type":"application/json"
            }
        }).then(function (res){
            return res.json();
        }).then(function (data){
            console.log("9999999");
            <%--window.location.href = "${APIurl}";--%>
            location.reload();
        })
    }


    function updateCartSub(productId){
        fetch("/WebShopSPringMVC_war/api/cart/sub",{
            method:'put',
            body: JSON.stringify({
                "productId":productId,
            }),
            headers:{
                "Content-Type":"application/json"
            }
        }).then(function (res){
            console.log(res)
            return res.json(); // do mminh lam tra ve so nguyen nen can path sang json
        }).then(function (data){
            console.log("9999999");
            window.location.href = "${APIurl}";
        })
    }
</script>
</body>
</html>
