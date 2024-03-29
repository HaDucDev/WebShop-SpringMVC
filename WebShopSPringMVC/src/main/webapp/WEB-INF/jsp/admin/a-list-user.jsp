<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<c:url value="/admin" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>List User</title>
	<!-- BOOTSTRAP STYLES-->
	<link href="${url}/css/bootstrap.css" rel="stylesheet" />
	<!-- FONTAWESOME STYLES-->
	<link href="${url}/css/font-awesome.css" rel="stylesheet" />
	<!-- MORRIS CHART STYLES-->
	<!-- CUSTOM STYLES-->
	<link href="${url}/css/custom.css" rel="stylesheet" />
	<!-- GOOGLE FONTS-->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans'
		  rel='stylesheet' type='text/css' />
	<!-- TABLE STYLES-->
	<link href="${url}/js/dataTables/dataTables.bootstrap.css"
		  rel="stylesheet" />
</head>
<body>
<div id="wrapper">

	<jsp:include page="nav-bar.jsp"></jsp:include>

	<jsp:include page="slide-bar.jsp"></jsp:include>

	<div id="page-wrapper">
		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<h2>Danh sách tài khoản</h2>
				</div>
			</div>
			<!-- /. ROW  -->
			<hr />
			<div class="row">
				<div class="col-md-12">
					<div>
						<button class="btn btn-danger square-btn-adjust" style="margin-bottom: 5px"><a href='<c:url value="/admin/add-user"/>' style="color: white">Thêm người dùng</a></button>
					</div>
					<div>
						<label style="color: green">${success}</label>
					</div>
					<!-- Advanced Tables -->
					<div class="panel panel-default">
						<div class="panel-heading"></div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover"
									   id="dataTables-example">
									<thead>
									<tr>
										<th>Mã người dùng</th>
										<th>Ảnh đại diện</th>
										<th>Họ và tên</th>
										<th>Email</th>
										<th>Địa chỉ mặc định</th>
										<th>Số điện thoại</th>
										<th>Tên đăng nhập</th>
<%--										<th>Mật khẩu</th>--%>
										<th>Chức vụ</th>
										<th></th>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${userList}" var="user">
										<tr class="odd gradeX">
											<td>${user.id}</td>
											<td>
												<c:choose>
													<c:when test="${user.avatar != null}">
														<img style="width: 50px;height: 50px;object-fit: cover"
															 src="<c:url value="${user.avatar}"/>"
															 alt="${user.fullName}">
													</c:when>
													<c:otherwise>
														<img style="width:50px;height:50px;object-fit: cover"
															 src="<c:url value="/images/Rayquaza.png"/>"
															 alt="${user.fullName}">
													</c:otherwise>
												</c:choose>

											</td>
											<td>${user.fullName}</td>
											<td>${user.email}</td>
											<td>${user.addressDefault}</td>
											<td>${user.phone}</td>
											<td>${user.username}</td>
<%--											<td>${user.password}</td>--%>
											<td class="center">
												<c:if test="${user.role.id == 1}">
												Quản trị viên</c:if>
												<c:if test="${user.role.id == 2}">
												Khách hàng</c:if>
												<c:if test="${user.role.id == 3}">
													Nhân viên giao hàng</c:if>
											</td>
											<td>
												<button style="width: 70px;">
													<a href="<c:url value="/admin/user/edit/${user.id}"/>"
													   class="center">Xem/Sửa</a>
												</button>
												|
												<button id="btnDelete" type ="button" class="center">
													<a href="<c:url value="/admin/user/delete/${user.id}"/>"
													   class="center">Xóa</a>
												</button>
											</td>

										</tr>
									</c:forEach>

									</tbody>
								</table>
							</div>

						</div>
					</div>
					<!--End Advanced Tables -->
				</div>
			</div>
		
		</div>
	</div>
	<!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER  -->
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="${url}/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="${url}/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="${url}/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="${url}/js/dataTables/jquery.dataTables.js"></script>
<script src="${url}/js/dataTables/dataTables.bootstrap.js"></script>
<script>
	$(document).ready(function() {
		$('#dataTables-example').dataTable();
	});
</script>

<script src="${url}/js/custom.js"></script>

</body>
</html>