<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<c:url value="/api-admin-product" var="APIurl"></c:url>
<c:url value="/views/admin/static" var="url"></c:url>
<c:url value="/admin-product-list" var="PCurl"></c:url>
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
						<h2>Thông tin sản phẩm</h2>
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
										<h3>Thông tin chi tiết</h3>
										<%--<c:url value="/admin/product/edit" var="edit"></c:url>--%>
										<form role="form" <%--action="${edit }" method="post"--%>
											enctype="multipart/form-data">
											<input id="id" name="id" value="${product.id }" hidden="">
											<div class="form-group">
												<label>Tên sản phẩm</label> <input id="productName" class="form-control"
													value="${product.proName}" name="productName" />
											</div>
											<div class="form-group">
												<label>Giá(VNĐ)</label> <input id="price" class="form-control"
													value="${product.price }" type="number" name="price" />
											</div>
											<div class="form-group">
												<label>Số lượng</label> <input class="form-control"
																			   value="${product.quantity}" placeholder="Nhập số lượng sản phẩm" type="number" name="quantity" id="quantity" />
											</div>
											<div class="form-group">
												<label>Mô tả </label> <br>
												<textarea rows="4" cols="50" name="editer" id="editer" >${product.describePro}</textarea>
											</div>

											<div class="form-group">
												<label>Chi tiết loại sản phẩm</label>
												<div class="checkbox">
													<select id="detailCateId" name="detailCateId">

														<c:forEach  var="c" items="${lstDetailCate}" >
															<option value="${c.id}"
																	<c:if test="${c.id==product.detailCategoryEntity.id}">
																		<c:out value="selected"/>
																	</c:if>
															>
																	${c.detailCateName}
															</option>
														</c:forEach>
													</select>
												</div>

											</div>
											<div class="form-group">
												<label>Thương hiệu sản phẩm</label>
												<div class="checkbox">
													<select name="brandId" id="brandId">
														<c:forEach items="${lstBrand}" var="c">
															<option value='${c.id}'>${c.brandName}</option>
															<c:if test="${c.id==product.id}">
																<c:out value="selected"/>
															</c:if>
														</c:forEach>
													</select>
												</div>

											</div>
											<div class="form-group">
												<label>Ảnh sản phẩm</label> <input type="file" name="image" value="${product.getImage()}" />
											</div>
											<button id="btnEdit"  class="btn btn-default">Cập nhật</button>
											<button type="reset" class="btn btn-primary" onclick="window.location.href ='${PCurl}?type=edit&id=${product.id}'">Reset</button>
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
	<script type="text/javascript" language="javascript">
	   CKEDITOR.replace('editer', {width: '700px',height: '300px'});
	</script>



	<script>
		$('#btnEdit').click(function (e){
			e.preventDefault();
			var productName= $('#productName').val();
			var price= parseFloat($('#price').val());
			var quantity = parseInt($('#quantity').val());
			var describePro= CKEDITOR.instances.editer.getData();
			var id= parseInt($('#id').val()) ;
			var detailCateId=parseInt($('#detailCateId').val());
			// var image= $('#image').val();
			var image = $('input[type=file]').val().split('\\').pop();
			var brandId=parseInt($('#brandId').val())
			var data={
				"id":id,
				"proName":productName,
				"price":price,
				"quantity":quantity,
				"describePro":describePro,
				// "image":image,
				"detailCategoryEntity": {
					"id":detailCateId,
				},
				"brandEntity":{
					"id":brandId
				}
			}
			updateProduct(data)

		});
		function updateProduct(data){
			console.log(typeof (data.id))
			$.ajax({
				url: '${APIurl}',
				type: 'PUT',
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






</body>
</html>