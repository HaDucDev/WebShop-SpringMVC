<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<c:url value="/api-admin-category" var="APIurl"></c:url>
<c:url value="/views/admin/static" var="url"></c:url>
<c:url value="/admin-category-list" var="PCurl"></c:url>
<!DOCTYPE html>
<html>
<head>
<script src="<c:url value="/ckeditor/ckeditor.js" />"></script>
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
		<jsp:include page="/views/admin/view/nav-bar.jsp"></jsp:include>
		<!-- /. NAV TOP  -->
		<jsp:include page="/views/admin/view/slide-bar.jsp"></jsp:include>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Thêm loại hàng</h2>
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
										<h3>Nhập thông tin loại hàng</h3>

										<form role="form" action="api-admin-product" method="post" enctype="multipart/form-data">
											<div class="form-group">
												<label>Tên loại hàng</label> <input class="form-control"
													placeholder="Nhập tên loại hàng" name="cateName" id="cateName" />
											</div>
											<div class="form-group">
												<label>Ảnh sản phẩm</label> <input  type="file" name="image" id="image"/>
											</div>
											<button type="button" id="btnAdd" class="btn btn-default">Thêm</button>
											<button type="reset" class="btn btn-primary" onclick="window.location.href ='${PCurl}?type=add'">Reset</button>
										</form>


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

	<%--	Addition--%>
	<script>
		$('#btnAdd').click(function (e){
			e.preventDefault();
			var cateName= $('#cateName').val();
			var image = $('input[type=file]').val().split('\\').pop();
			var data={
				"cateName":cateName,
				"image":image
			}

			updateProduct(data)
		});
		function updateProduct(data){
			$.ajax({
				url: '${APIurl}',
				type: 'POST',
				enctype: 'multipart/form-data',
				processData:false,
				contentType: 'application/json',
				data:JSON.stringify(data),
				dataType: 'json',
				success: function (result){
					console.log("Success");
					window.location.href = "${PCurl}?type=list&message=insert_success";
				},
				errMode: function (error){
					console.log("Error");
				}
			})
		}
	</script>



	<script type="text/javascript" language="javascript">
   CKEDITOR.replace('editer', {width: '700px',height: '300px'});
</script>
</body>
</html>