<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<c:url value="/views/admin/static" var="url"></c:url>
<c:url value="/api-admin-comment" var="APIUrl" ></c:url>
<c:url value="/admin-comment-list" var="CCUrl"></c:url>
<c:url value="/client-product-list" var="PCUrl"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Order Management</title>
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
						<h2>Quản lí bình luận</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						<div class="panel panel-default">
							<div class="panel-heading">Danh sách bình luận</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>ID</th>
												<th>Người viết</th>
												<th>Sản phẩm</th>
												<<%--th>Người bán</th>
												<th>Shipper</th>--%>
												<th>Nội dung bình luận</th>
												<th>Ngày viết</th>
<%--												<th>Hình thức thanh toán</th>--%>
<%--												<th>Tình trạng</th>--%>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											</a>
											<%--xác ??nh gi? hàng --%>
											<c:forEach items="${lstComment}" var="comment">
												<tr>
													<td>${comment.id}</td>
													<td>${comment.userEntity.fullname}</td>
													<td width="100px">${comment.productEntity.proName}</td>
													<td>${comment.content}</td>
													<td>
														<fmt:formatDate  value = "${comment.writeDate}" var = "parsedMyDate" dateStyle="short" type="both" pattern = "MM-dd-yyyy hh:mm:ss a"  />
														<p style="color: #000;"><c:out value = "${parsedMyDate}" /></p>
													</td>
													<td>
														<a id="btnDelete" onclick="deleteComment(${comment.id})" class="center">Xóa</a> |
														<a class="center" onclick="replyComment(${comment.id},${comment.productEntity.id},${comment.userEntity.id},'${comment.userEntity.fullname}')" >Trả lời</a>
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
		<!-- /. PAGE INNER  -->
	</div>
	<!-- JQUERY SCRIPTS -->
	<script src="${url}/js/jquery-1.10.2.js"></script>
	<script src="${url}/js/jquery-3.3.1.min.js"></script>
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
	<!-- CUSTOM SCRIPTS -->
	<script src="${url}/js/custom.js"></script>
	<script>

		function deleteComment(data){
			$.ajax({
				url: '${APIUrl}',
				type: 'DELETE',
				enctype: 'multipart/form-data',
				processData:false,
				contentType: 'application/json',
				data:JSON.stringify(data),
				dataType: 'json',
				success: function (result){
					console.log("Success");
					window.location.href = "${CCUrl}?type=list";
				},
				error: function (error){
					console.log("Error");
				}
			})
		}

		function replyComment(data,proId,userReplyId,nameOfUser){
			$.ajax({
				url: '${APIUrl}',
				type: 'PUT',
				enctype: 'multipart/form-data',
				processData:false,
				contentType: 'application/json',
				data:JSON.stringify(data),
				dataType: 'json',
				success: function (result){
					console.log("Success");
					var x = screen.width;
					var y = screen.height;
					myWindow= window.open('http://www.google.com/','mywindow','width='+x+',height='+y).location.href = "${PCUrl}?type=detail_product&id="+proId+"&quantity=1&page_type=adminReply&parent_id="+userReplyId+"&name="+nameOfUser;
					myWindow.moveTo(0,0);
				},
				error: function (error){
					console.log("Error");
				}
			})
		}
	</script>
		</div>
</body>
</html>