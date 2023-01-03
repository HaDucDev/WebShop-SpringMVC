<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<c:url value="/user/account-user" var="APIu"> </c:url>
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
						<form:form action="${APIu}" method="post" id="info1" modelAttribute="userinfor" enctype="multipart/form-data">

							<div>
								<img class="form-one" style="width: 50px;height: 50px;object-fit: cover; display: block; margin-left: auto;
								 margin-right: 10px; margin-bottom: 20px"
									 src="<c:url value="${userinfor.avatar}"/>" alt="${userinfor.fullName}">
								<form:input path="avatarImage" class="form-one"  id="avatar" type="file" placeholder="Tên" name="avatar"/>
							</div>

							<form:input path="fullName" class="form-one"  id="fullname" type="text" placeholder="Tên" name="fullname" value="${userinfor.fullName}" style="margin-bottom: 5px"/>
							<label style="color: red; margin-bottom: 5px">${errFullName}</label>
							<form:input path="email" id="email" type="text" placeholder="Email" name="email" value="${userinfor.email}" style="margin-bottom: 5px"/>
							<label style="color: red;margin-bottom: 5px">${errEmail}</label>
							<form:input path="addressDefault" id="address" type="text" placeholder="Địa chỉ" name="address" value="${userinfor.addressDefault}"style="margin-bottom: 5px"/>
							<label style="color: red;margin-bottom: 5px">${errAddress}</label>
							<form:input path="phone" id="phonenumber" type="number" placeholder="Số điện thoại" name="phoneNumber" min="0" value="${userinfor.phone}"style="margin-bottom: 5px"/>
							<div>
								<label style="color: red;margin-bottom: 5px">${errPhone}</label>
							</div>
							<button type="submit" class="btn btn-primary">Thay đổi thông tin</button>
							<span class="form-message"></span>
							<div>
								<label style="color: green">${success}</label>
							</div>
						</form:form>
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
						<div id="showpassword">
							<input type="checkbox" onclick="myFunction()">Hiển thị mật khẩu</input>
						</div>
						<div>
							<button class="btn btn-primary" onclick="changePassword()" >Cập nhật mật khẩu</button>
						</div>
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

<script>
	function myFunction() {
		var x = document.getElementById("oldPassword");
		var y = document.getElementById("newPassword");
		var z = document.getElementById("confirmPassword");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
		if (y.type === "password") {
			y.type = "text";
		} else {
			y.type = "password";
		}
		if (z.type === "password") {
			z.type = "text";
		} else {
			z.type = "password";
		}
	}
</script>

<%--<c:url value="/user/account-user" var="APIu"> </c:url>--%>
<%--<script>--%>

<%--	$(document).ready(function() {--%>
<%--		$.ajax({--%>
<%--			url: '${APIu}'--%>
<%--		}).then(function(data) {--%>
<%--			$('#fullname').text(data.fullName);--%>
<%--			$('#email').text(data.email);--%>
<%--			$('#address').text(data.addressDefault);--%>
<%--			$('#phonenumber').text(data.phone);--%>
<%--		});--%>
<%--	});--%>
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
