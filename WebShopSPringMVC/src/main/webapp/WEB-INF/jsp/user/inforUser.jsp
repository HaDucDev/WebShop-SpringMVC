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
			<h2 class="heading">Quản lí toàn khoản</h2>
		</div>
		<div class="shopper-informations">
			<div class="row">
				<div class="col-sm-6">
					<div class="shopper-info">
						<p>Thông tin tài khoản</p>
						<form action="${pageContext.request.contextPath}/api-user-change-Inf" method="get" id="info1" >

							<input class="form-one"  id="fullname" type="text" placeholder="Tên" name="fullname"
								   value="${user.getFullname()}">
							<label style="color: red">${errFullName}</label>

							<input style="" id="email" type="text" placeholder="Email" name="email"
								   value="${user.getEmail()}">
							<label style="color: red">${errEmail}</label>
							<input id="address" type="text" placeholder="Địa chỉ" name="address"
								   value="${user.getAddress()}">
							<label style="color: red">${errAddress}</label>
							<input id="phonenumber" type="number" placeholder="Số điện thoại" name="phoneNumber" min="0"
								   value="${user.getPhone_number()}">
							<span class="form-message"></span>
							<div>
								<label style="color: red">${errPhone}</label>
							</div>

							<button type="submit" class="btn btn-primary">Thay đổi thông tin</button>
							<div>
								<label style="color: green">${success}</label>
							</div>

						</form>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="shopper-info">
						<p>Thay đổi mật khẩu</p>
						<form>
							<input id="oldPassword" type="password" placeholder="Mật khẩu " value="">
							<input id="newPassword" type="password" placeholder="Mật khẩu mới">
							<input id="confirmPassword" type="password" placeholder="Xác nhận mật khẩu">
						</form>
						<button class="btn btn-primary" onclick="changePassword()" >Cập nhật thông tin</button>

						<div id="notification"></div>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="a-footer.jsp"></jsp:include>
</section> <!--/#cart_items-->
<script src="${url}/js/jquery.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<script src="${url}/js/jquery.scrollUp.min.js"></script>
<script src="${url}/js/jquery.prettyPhoto.js"></script>
<script src="${url}/js/main.js"></script>


<c:url value="/user/account-manager-password" var="APIurl"> </c:url>
<script>
	function changePassword() {
		var oldPassword =$('#oldPassword').val();
		var newPassword =$('#newPassword').val();
		var confirmPassword =$('#confirmPassword').val();
		var notify= document.querySelector('#notification')
		if (newPassword != confirmPassword) {
			console.log("Notify")
			notify.innerHTML="<label style=\"color: red\">Mật khẩu xác thực không chính xác</label>";
			return ;
		}
		else if (newPassword.length < 1 || confirmPassword.length < 1) {
			notify.innerHTML="<label style=\"color: red\">Mật khẩu mới không được để trống</label>";
			return ;
		}
		else if (newPassword.length < 6 || confirmPassword.length < 6) {
			notify.innerHTML="<label style=\"color: red\">Độ dài mật khẩu phải ít nhất 6 ký tự</label>";
			return ;
		} else if (oldPassword.length < 1) {
			notify.innerHTML="<label style=\"color: red\">Vui lòng nhật mật khẩu</label>";
			return ;
		}
		var data ={
			oldPassword:oldPassword,
			newPassword:newPassword,
		}
		console.log(data)
		$.ajax({
			url: '${APIurl}',
			type: 'PUT',
			enctype: 'multipart/form-data',
			processData:false,
			contentType: 'application/json',
			data:JSON.stringify(data),
			dataType: 'json',
			success: function (result){

				if (result==1){
					notify.innerHTML="<label style=\"color: green\">Đổi mật khẩu thành công</label>";
					console.log("Success");
				}
				if (result==0){
					notify.innerHTML="<label style=\"color: red\">Mật khẩu không chính xác</label>";
					console.log("Error");
				}
			},
			error: function (error){
				notify.innerHTML="<label style=\"color: red\">Đã có lỗi xảy ra. ban vui lòng đổi lại sau</label>";
				console.log("Error");
			}

		})

	}

</script>


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
