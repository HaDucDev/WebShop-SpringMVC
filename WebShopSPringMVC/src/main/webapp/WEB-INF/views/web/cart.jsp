<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/views/web/static" var="url"> </c:url>
<c:url value="/api-user-cart" var="APIurl"> </c:url>
<c:url value="/api-user-order" var="APIOrderUrl"> </c:url>
<c:url value="/client-order" var="APIOrderDoneUrl"></c:url>
<c:url value="/paySuccess" var="PaySuccess"></c:url>


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
<jsp:include page="header.jsp"></jsp:include>
<section id="cart_items">
	<div class="container">
		<div class="table-responsive cart_info">
			<table class="table table-condensed">
				<thead>
				<tr class="cart_menu">
					<td class="image"></td>
					<td class="description"></td>
					<td class="price">Giá</td>
					<td class="quantity">Số lượng</td>
					<td class="total">Tổng cộng</td>
					<td></td>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="i" items="${cartItemModelList}">
					<c:url value="/image/${i.getProductEntity().getImage()}" var="imgUrl"></c:url>
					<tr>
					<td class="cart_product">
						<a href=""><img style="height: 100px;width: auto;" class="hoverimg" src="${imgUrl}" alt=""></a>
					</td>
					<td class="cart_description" style="padding-left: 50px;">
						<h4><a href="">${i.getProductEntity().getProName()}</a></h4>
						<p>Web ID: 1089772</p>
					</td>
					<td class="cart_price" >
<%--						<p>${i.getProduct().getPrice()}</p>--%>
						<h2 value="${i.getProductEntity().getPrice()}" > VNĐ</h2>

					</td>
					<td class="cart_quantity" style="width: 150px">
						<div class="cart_quantity_button">
							<a class="cart_quantity_up" onclick="updateCart(${i.getProductEntity().getId()},'add')"  href=""> + </a>
							<input class="cart_quantity_input" type="text" name="quantity" value="${i.getQuantity()}" autocomplete="off" size="2" readonly>
							<a class="cart_quantity_down" onclick="updateCart(${i.getProductEntity().getId()},'sub')" href=""> - </a>
						</div>
					</td>
					<td class="cart_total" >
<%--						<p class="cart_total_price">${i.getProduct().getPrice()*i.getQuantity()} ₫</p>--%>
						<h2><fmt:formatNumber type="number" value="${i.getProductEntity().getPrice()*i.getQuantity()}" /> VNĐ</h2>
					</td>
					<td class="cart_delete">
						<a class="cart_quantity_delete" onclick="updateCart(${i.getProductEntity().getId()},'del')" href=""><i class="fa fa-times"></i></a>
					</td>
				</tr>
				</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
</section> <!--/#cart_items-->

<section>
	<div class="container">
		<div class="step-one">
			<h2 class="heading">Tiến hành đặt hàng</h2>
		</div>
		<div class="shopper-informations">
			<div class="row">
				<div class="col-sm-7">
					<div class="shopper-info">
						<p>Thông tin cá nhân</p>
						<form>
							<input id="fullname" type="text" placeholder="Tên" value="${user.getFullname()}">
							<label style="color: red">${errUserName}</label>
							<input id="email" type="text" placeholder="Email" value="${user.getEmail()}">
							<label style="color: red">${errEmail}</label>
							<input id="address" type="text" placeholder="Địa chỉ" value="${user.getAddress()}">
							<label style="color: red">${errAddress}</label>
							<input id="phonenumber" type="text" placeholder="Số điện thoại" value="${user.getPhone_number()}">
							<label style="color: red">${errPhone}</label>
						</form>
					</div>
				</div>
				<div class="col-sm-1">
				</div>
				<div class="col-sm-4">
					<div class="shopper-info">
						<h2 style="color: #696763">Tổng thanh toán</h2>
<%--						<label style="font-size: 19px; font-weight: 500; color: #696763">${totalPrice}</label>--%>
						<label  style="font-size: 19px; font-weight: 500; color: #696763">${totalPrice} VNĐ</label>
<%--						<span style="font-size: 19px; color: #696763">VNĐ</span>--%>
						<hr>
						<p>Hình thức thanh toán</p>
						<div>
							<input type="radio" id="online" name="check" value="online">
							<label for="online" style="color: #696763">Trực tuyến</label>
						</div>
						<div>
							<input type="radio" checked id="offline" name="check" value="offline">
							<label for="offline" style="color: #696763">Trả khi nhận hàng</label>
						</div>
				</div>
			</div>
		</div>
		<a class="btn btn-primary" onclick="payCart()" <%--href="${pageContext.request.contextPath}/payment?check=offline"--%> >Đặt hàng</a>
	</div>
	</div>
</section>

<br>
<jsp:include page="footer.jsp"></jsp:include>
<script src="${url}/js/jquery.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<script src="${url}/js/jquery.scrollUp.min.js"></script>
<script src="${url}/js/jquery.prettyPhoto.js"></script>
<script src="${url}/js/main.js"></script>
<script>
	/*$('.cart_quantity_down').click(function (e){
		e.preventDefault();
		e.valueOf()
		console.log("Hello");
		updateCart("sub")
	});
	$('.cart_quantity_up').click(function (e){
		e.preventDefault();
		console.log("Hello");
		updateCart("add")
	});*/

	function updateCart(productId,type){
		$.ajax({

			url: '${APIurl}?type='+type,
			type: 'PUT',
			enctype: 'multipart/form-data',
			processData:false,
			contentType: 'application/json',
			data:JSON.stringify(productId),
			dataType: 'json',
			success: function (result){
				console.log("Success");
				console.log(data);
				<%--window.location.href = "${PCurl}?type=list&message=insert_success";--%>
			},
			errMode: function (error){
				console.log("Error");
			}
		})
	}


	function addOrder(){
		var fullname= $('#fullname').val();
		var email= $('#email').val();
		var phonenumber= $('#phonenumber').val();
		var address= $('#address').val();

		var data={
			"fullname":fullname,
			"email":email,
			"phonenumber":phonenumber,
			"address":address
		}
		$.ajax({
			url: '${APIOrderUrl}',
			type: 'POST',
			enctype: 'multipart/form-data',
			processData:false,
			contentType: 'application/json',
			data:JSON.stringify(data),
			dataType: 'json',
			success: function (result){
				console.log("Success");
				window.location.href = "${PaySuccess}";
			},
			errMode: function (error){
				console.log("Error");
			}
		})
	}
	function payCart(){
		var isOnline = document.getElementById("online").checked;
		if (isOnline) {
			var fullname= $('#fullname').val();
			var email= $('#email').val();
			var phonenumber= $('#phonenumber').val();
			var address= $('#address').val();

			window.location.href="${pageContext.request.contextPath}/payment?fullname="+fullname+"&email="+email+"&phonenumber="+phonenumber+"&address="+address
		}
		else {
			addOrder();
		}
	}
</script>

</body>
</html>
