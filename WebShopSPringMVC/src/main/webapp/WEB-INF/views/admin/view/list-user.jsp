<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<c:url value="/views/admin/static" var="url"></c:url>
<c:url value="/api-admin-user" var="APIurl"></c:url>
<c:url value="/admin-user-list" var="ACurl"></c:url>
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

	<jsp:include page="/views/admin/view/nav-bar.jsp"></jsp:include>

	<!-- /. NAV TOP  -->
	<jsp:include page="/views/admin/view/slide-bar.jsp"></jsp:include>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<h2>Danh sách sản phẩm</h2>
				</div>
			</div>
			<!-- /. ROW  -->
			<hr />
			<div class="row">
				<div class="col-md-12">
					<div>
						<button class="btn btn-danger square-btn-adjust" style="margin-bottom: 5px"><a href='<c:url value="/admin-user-list?type=add"/>' style="color: white">Thêm người dùng</a></button>
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
										<th>ID</th>
										<th>Email</th>
										<th>Tên người dùng</th>
										<th>Địa chỉ</th>
										<th>Tên đăng nhập</th>
										<th>Mật khẩu</th>
										<th>Trạng thái</th>
										<th>Chức vụ</th>
										<th></th>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${lstUser }" var="user">
										<tr class="odd gradeX">
											<td>${user.id}</td>
											<td>${user.email }</td>
											<td>${user.fullname }</td>
											<td>${user.address }</td>
											<td>${user.username }</td>
											<td>${user.passWord }</td>
											<td class="center">Active</td>
											<td class="center"><c:choose>
												<c:when test="${user.role ==1 }">
													Admin
												</c:when>
                                                <c:when test="${user.role ==2 }">
                                                    Shipper
                                                </c:when>
												<c:when test="${user.role ==3 }">
													Employee
												</c:when>
												<c:otherwise>Client</c:otherwise>
											</c:choose></td>
											<td>
												<button style="width: 70px;">
													<a href="<c:url value="/admin-user-list?type=edit&id=${user.id }"/>"
													   class="center">Xem/Sửa</a>
												</button>
												|
												<button id="btnDelete" type ="button" onclick = "deleteUser(${user.id})"
														class="center">Xóa
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

<%--DeleteUser--%>
<script>

	function deleteUser(data){
		console.log(typeof (data.id))
		$.ajax({
			url: '${APIurl}',
			type: 'DELETE',
			contentType: 'application/json',
			data:JSON.stringify(data),
			dataType: 'json',
			success: function (result){
				console.log("Success");
				window.location.href = "${ACurl}?type=list";
			},
			errMode: function (error){
				console.log("Error");
			}
		})
	}
</script>
<!-- CUSTOM SCRIPTS -->
<script src="${url}/js/custom.js"></script>

</body>
</html>