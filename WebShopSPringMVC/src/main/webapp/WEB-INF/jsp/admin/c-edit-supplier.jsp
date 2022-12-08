<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/admin" var="url"></c:url>
<%--<c:url value="/admin-supplier-list" var="PCurl"></c:url>--%>
<!DOCTYPE html>
<html>
<head>
<%--<script src="<c:url value="/ckeditor/ckeditor.js" />"></script>--%>
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
						<h2>Cập nhật nhà cung cấp</h2>
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
										<h3>Nhập thông tin nhà cung cấp</h3>
										<c:url value="/admin/supplier/add" var="action"/>
										<form:form role="form" action="${action}" method="post" enctype="multipart/form-data" modelAttribute="supplier">
											<div class="form-group">
												<label for="id">Tên nhà cung cấp</label>
												<form:input id="id" class="form-control"
															placeholder="Mã nhà cung cấp" name="supplierName" path="id" readonly="true"/>
											</div>


											<div class="form-group">
												<label for="supplierName">Tên nhà cung cấp</label>
												<form:input path="supplierName" class="form-control"
													placeholder="Nhập tên nhà cung cấp" name="supplierName" id="supplierName" />
											</div>
											<div class="form-group">
												<label for="file">Logo nhà cung cấp</label>
												<form:input type="file" path="file" class="form-control"
																					   placeholder="Nhập SĐT nhà cung cấp" name="file" id="file" />
											</div>
											<div class="form-group">
												<c:choose>
													<c:when test="${supplier.logoImage != null}">
														<img style="width: 100px;height: 100px;object-fit: cover" src="<c:url value="${supplier.logoImage}"/>" alt="${supplier.supplierName}">
													</c:when>
													<c:otherwise>
														<img style="width: 100px;height: 100px;object-fit: cover" src="<c:url value="/images/logo.png"/>" alt="${supplier.supplierName}">
													</c:otherwise>
												</c:choose>
											</div>

											<input type="submit" id="btnAdd" class="btn btn-default" value="Cập nhật"/>
											<button type="reset" class="btn btn-primary" onclick="window.location.href ='${PCurl}'">Reset</button>
										</form:form>


									</div>
								</div>
							</div>
						</div>
						<!-- End Form Elements -->
					</div>
				</div>
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

	<script type="text/javascript" language="javascript">
   CKEDITOR.replace('editer', {width: '700px',height: '300px'});
</script>
</body>
</html>