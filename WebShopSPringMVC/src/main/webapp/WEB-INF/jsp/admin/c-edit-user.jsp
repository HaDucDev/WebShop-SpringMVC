<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/admin" var="url"></c:url>
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
					<h2>Chỉnh sửa người dùng</h2>
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
									<h3>Thông tin người dùng</h3>
									<c:url value="/admin/user/edit-user" var="action"></c:url>
									<form:form role="form"  id="edit-user" action="${action}" modelAttribute="user">
										<div class="form-group">
											<label>Mã người dùng</label>
											<form:input class="form-control" name="id" id="id" path="id" readonly="true"/>
										</div>
										<div class="form-group">
											<label>Tên người dùng</label>
											<form:input class="form-control"  placeholder="Nhập tên người dùng" name="fullname" id="fullName" path="fullName"/>
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Tên đăng nhập</label>
											<form:input class="form-control" placeholder="Tên đăng nhập" name="username" id="username" path="username"/>
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Mật khẩu</label>
											<form:input class="form-control" placeholder="Nhập mật khẩu" type="password" name="password" id="password" path="oldPassword"/>
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Email</label>
											<form:input class="form-control" name="email" id="email" path="email" />
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Số điện thoại</label>
											<form:input class="form-control" path="phone" type="number" min="0" placeholder="Please enter phone number" name="phonenumber" id="phonenumber" />
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Địa chỉ</label>
											<form:input path="addressDefault" class="form-control" placeholder="Nhập địa chỉ" name="address" id="address" />
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label for="role">Chọn vai trò</label>
												<div class="checkbox">
													<form:select path="role" name="roleId" id="role">
														<option value="${user.role.id}">${user.role.name.toString()}</option>
														<c:forEach items="${roleList}" var="c">
															<c:if test = "${user.role.id != c.id}">
																<option value="${c.id}">${c.name}</option>
															</c:if>
														</c:forEach>
													</form:select>
												</div>
										</div>
										<button type="submit" class="btn btn-default" id="btnEdit">Cập nhật</button>
									</form:form>
								</div>
							</div>
						</div>
					</div>
					<!-- End Form Elements -->
				</div>
			</div>
			<!-- /. ROW  -->
			<div class="row">
				<div class="col-md-12"></div>
			</div>
			<!-- /. ROW  -->
		</div>
		<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="${url}/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="${url}/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="${url}/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="${url}/js/custom.js"></script>
</body>
</html>