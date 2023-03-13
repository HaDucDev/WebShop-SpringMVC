<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/admin" var="url"></c:url>
<%--<c:url value="/api-admin-user" var="APIurl"></c:url>--%>
<%--<c:url value="/admin-user-list" var="ACurl"></c:url>--%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Edit User</title>
	<!-- BOOTSTRAP STYLES-->
	<link href="${url}/css/bootstrap.css" rel="stylesheet" />
	<!-- FONTAWESOME STYLES-->
	<link href="${url}/css/font-awesome.css" rel="stylesheet" />
	<!-- CUSTOM STYLES-->
	<link href="${url}/css/custom.css" rel="stylesheet" />
	<!-- GOOGLE FONTS-->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans'
		  rel='stylesheet' type='text/css' />
	<!-- JQUERY SCRIPTS -->
	<script src="${url}/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="${url}/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="${url}/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="${url}/js/custom.js"></script>
</head>
<body>
<div id="wrapper">
	<jsp:include page="nav-bar.jsp"></jsp:include>
	<!-- /. NAV TOP  -->
	<jsp:include page="slide-bar.jsp"></jsp:include>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<h2>Thêm người dùng</h2>
				</div>
			</div>
			<!-- /. ROW  -->
			<hr />
			<div class="row">
				<div class="col-md-12">
					<!-- Form Elements -->
					<div class="panel panel-default">
						<div class="panel-heading"></div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-6">
									<h3>Thông tin chi tiết người dùng</h3>

									<form:form role="form"  id="add-user" method="post" modelAttribute="accountNew" action="">
										<div class="form-group">
											<label>Tên người dùng</label>
											<form:input class="form-control" placeholder="Nhập tên người dùng" name="fullName" id="fullname" path="fullName"/>
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Tên đăng nhập</label>
											<form:input class="form-control" placeholder="Tên đăng nhập" name="username" id="username" path="username"/>
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Mật khẩu</label>
											<form:input class="form-control" placeholder="Nhập mật khẩu" type="text" name="password" id="password" path="newPassword"/>
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Email</label>
											<form:input class="form-control" placeholder="Nhập email" name="email" id="email" path="email"/>
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Số điện thoại</label>
											<form:input path="phone" class="form-control" min="0" type="number" placeholder="Nhập số điện thoại" name="phonenumber" id="phonenumber" />
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Địa chỉ</label>
											<form:input path="addressDefault" class="form-control" placeholder="Nhập địa chỉ" name="address" id="address" />
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Chức vụ</label>
											<div class="form-group">
												<label for="role">Chọn vai trò</label>
												<div class="checkbox">
													<form:select path="role" name="roleId" id="role">
														<c:forEach items="${roleList}" var="c">
															<option value="${c.id}">${c.name}</option>
														</c:forEach>
													</form:select>
												</div>
											</div>
										</div>

										<button type="submit" class="btn btn-default" id="btnAdd">Thêm</button>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
</body>
</html>