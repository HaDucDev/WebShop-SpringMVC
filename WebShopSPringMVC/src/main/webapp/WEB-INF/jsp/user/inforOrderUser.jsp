<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 1/2/2023
  Time: 11:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/user" var="url"> </c:url>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Quản lí tài khoản</title>
    <link href="${url}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${url}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${url}/css/main.css" rel="stylesheet">
    <link href="${url}/css/responsive.css" rel="stylesheet">
</head>

<body>
<jsp:include page="a-header.jsp"></jsp:include>
<section id="cart_items">
    <div class="container">
        <div class="step-one">
            <h2 class="heading">Quản lí đơn hàng</h2>
        </div>
        <div class="review-payment">
            <h2>Lịch sử mua hàng</h2>
        </div>

        <div class="table-responsive cart_info">
            <table class="table table-condensed">
                <thead>
                <tr class="cart_menu">
                    <td class="image">ID đơn hàng</td>
                    <td class="description">Tình trạng</td>
                    <td class="price">Ngày mua</td>
                    <td class="quantity">Tổng thanh toán</td>
                    <td class="option_pay">Hình thức thanh toán</td>
                    <td class="total">Action</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="cart" items="${lstCart}">
                    <tr>
                        <td class="cart_product">
                            <h4>#${cart.id}</h4>
                        </td>
                        <td class="cart_description">
                            <c:if test="${cart.status==1}"><h4>Chưa duyệt</h4></c:if>
                            <c:if test="${cart.status==2}"><h4>Đã duyệt</h4></c:if>
                            <c:if test="${cart.status==3}"><h4>Đang giao</h4></c:if>
                            <c:if test="${cart.status==4}"><h4>Đã hoàn thành</h4></c:if>
                        </td>
                        <td class="cart_description">
                            <h4>${cart.buyDate}</h4>
                        </td>
                        <td class="cart_description">
                                <%--						<h4>${cart.totalPrice} VNĐ</h4>--%>
                            <h4><fmt:formatNumber type="number" value="${cart.totalPrice}" /> VNĐ</h4>

                        </td>
                        <td>
                            <c:if test="${cart.payments==0}">Trả tiền khi nhận hàng</c:if>
                            <c:if test="${cart.payments==1}">Thanh toán online</c:if>
                        </td>
                        <td class="cart_description">
                            <a class="center" data-toggle="modal"   data-target="#oderlist${cart.id}">Xem chi tiết</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <c:forEach items="${lstCart}" var="cart">
            <div class="modal fade" id="oderlist${cart.id}">
                <div class="modal-dialog modal-dialog-centered modal-lg" style="width: 50%;">
                    <div class="modal-content" >
                        <div class="modal-header">
                            <h4 class="modal-title">Chi  tiết đơn hàng</h4>
                        </div>
                        <div class="modal-body">
                            <table class="table table-condensed">
                                <thead>
                                <tr class="cart_menu">
                                    <td class="image">Ảnh</td>
                                    <td class="description">Tên Sản Phẩm</td>
                                    <td class="price">Giá</td>
                                    <td class="quantity">Số Lượng</td>
                                    <td class="total">Tổng Tiền</td>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${cart.getProductCartEntityList()}" var="item">
                                    <tr>
                                        <c:url value="/image/${item.getProductEntity().getImage()}" var="imgUrl"></c:url>
                                        <td class="cart_product" style="margin: 0px;	">

                                            <img width="50px" height="50px" src="${imgUrl}" alt="#">
                                        </td>
                                        <td class="description">${item.getProductEntity().getProName()}</td>
                                            <%--										<td class="price">${item.getUnitPrice()}<span>VNĐ</span></td>--%>
                                        <td class="price"><fmt:formatNumber type="number" value="${item.getUnitPrice()}" /> VNĐ</td>

                                        <td class="quantity">${item.getQuantity()}</td>
                                            <%--										<td class="total">${item.getUnitPrice()*item.getQuantity()}<span>VNĐ</span></td>--%>
                                        <td class="total"><fmt:formatNumber type="number" value="${item.getUnitPrice()*item.getQuantity()}" /> VNĐ</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" data-dismiss="modal">OK</button>
                        </div>
                    </div>
                </div>
            </div> <!-- end modal -->
        </c:forEach>
    </div>

    <jsp:include page="a-footer.jsp"></jsp:include>
</section> <!--/#cart_items-->
<script src="${url}/js/jquery.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<script src="${url}/js/jquery.scrollUp.min.js"></script>
<script src="${url}/js/jquery.prettyPhoto.js"></script>
<script src="${url}/js/main.js"></script>
<%--<script>--%>
<%--	function changePassword() {--%>
<%--		var oldPassword =$('#oldPassword').val();--%>
<%--		var newPassword =$('#newPassword').val();--%>
<%--		var confirmPassword =$('#confirmPassword').val();--%>
<%--		var notify= document.querySelector('#notification')--%>
<%--		if (newPassword != confirmPassword) {--%>
<%--			console.log("Notify")--%>
<%--			notify.innerHTML="<label style=\"color: red\">Mật khẩu xác thực không chính xác</label>";--%>
<%--			return ;--%>
<%--		}--%>
<%--		else if (newPassword.length < 1 || confirmPassword.length < 1) {--%>
<%--			notify.innerHTML="<label style=\"color: red\">Mật khẩu mới không được để trống</label>";--%>
<%--			return ;--%>
<%--		}--%>
<%--		else if (newPassword.length < 6 || confirmPassword.length < 6) {--%>
<%--			notify.innerHTML="<label style=\"color: red\">Độ dài mật khẩu phải ít nhất 6 ký tự</label>";--%>
<%--			return ;--%>
<%--		} else if (oldPassword.length < 1) {--%>
<%--			notify.innerHTML="<label style=\"color: red\">Vui lòng nhật mật khẩu</label>";--%>
<%--			return ;--%>
<%--		}--%>
<%--		var data ={--%>
<%--			oldPassword:oldPassword,--%>
<%--			password:newPassword,--%>
<%--		}--%>
<%--		console.log(data)--%>
<%--		$.ajax({--%>
<%--			url: '${APIurl}',--%>
<%--			type: 'PUT',--%>
<%--			enctype: 'multipart/form-data',--%>
<%--			processData:false,--%>
<%--			contentType: 'application/json',--%>
<%--			data:JSON.stringify(data),--%>
<%--			dataType: 'json',--%>
<%--			success: function (result){--%>
<%--				notify.innerHTML="<label style=\"color: green\">Đổi mật khẩu thành công</label>";--%>
<%--				console.log("Success");--%>
<%--			},--%>
<%--			error: function (error){--%>
<%--				notify.innerHTML="<label style=\"color: red\">Mật khẩu không chính xác</label>";--%>
<%--				console.log("Error");--%>
<%--			}--%>

<%--		})--%>

<%--	}--%>

<%--</script>--%>


<%--<script src='${pageContext.request.contextPath }/Validation.js'></script>--%>
<%--<script>--%>
<%--	Validator({--%>
<%--		form: '#info',--%>
<%--		formGroupSelector: '.',--%>
<%--		errorSelector : '.form-message',--%>
<%--		rules: [--%>
<%--			Validator.isRequired('#fullname'),--%>
<%--			Validator.isRequired('#email'),--%>
<%--			Validator.isRequired('#address'),--%>

<%--		]--%>
<%--	});--%>

<%--</script>--%>

</body>
</html>
>
