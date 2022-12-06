<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:url value="/api-admin-product" var="APIurl"></c:url>
<c:url value="/views/admin/static" var="url"></c:url>
<c:url value="/admin-product-list" var="PCurl"></c:url>
<script src="./Validation.js"></script>
<!DOCTYPE html>
<html>
<head>
<script src="<c:url value="/ckeditor/ckeditor.js" />"></script>
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
	<link href="comp">
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
						<h2>Thêm sản phẩm</h2>
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
										<h3>Nhập thông tin sản phẩm</h3>

										<form role="form" action="api-admin-product" method="post" id="myform" enctype='multipart/form-data'>
											<div class="form-group">
												<label>Tên sản phẩm</label>
												<input class="form-control" value="${name_pro}" placeholder="Nhập tên sản phẩm" name="productName" id="productName" /> <span style="color: red">${error_name}</span>
											</div>
											<div class="form-group">
												<label>Giá (VNĐ)</label> <input value="${price}" class="form-control" min="0" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
													placeholder="Nhập giá sản phẩm" type="number" name="price" id="price" /> <span style="color: red">${error_price}</span>
											</div>
											<div class="form-group">
												<label>Số lượng</label> <input  value="${quantity}" class="form-control" min="0" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
																				placeholder="Nhập số lượng sản phẩm" type="number" name="quantity" id="quantity" /> <span style="color: red">${error_quantity}</span>
											</div>
											<div class="form-group">
												<label>Mô tả sản phẩm </label>
												<br>
												<textarea rows="4" cols="50" name="ckeditor" id="ckeditor" ></textarea>
											</div>

											<div class="form-group">
												<label>Chi tiết loại sản phẩm</label>
												<div class="checkbox">
													<select name="detailCateId" id="detailCateId">
														<c:forEach items="${lstDetailCate}" var="c">
															<option value='${c.getId()}'>${c.detailCateName}</option>
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
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<div class="btn">
													<%--										<span>File</span>--%>
													<input type="file" name="image" id="image">
												</div>
											</div>
											<%--<div class="form-group">
												<label>Ảnh sản phẩm</label> <input type="file" name="file" id="image"/>
											</div>--%>
											<button type="submit" id="btnAdd" class="btn btn-default">Thêm</button>
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
	<%--<script>
		$(document).ready(function () {
			$("#myform").on('submit',function (e) {
				e.preventDefault();
				/*let f = new FormData(this);
				$.ajax({
					url: '${APIurl}',
					type: 'POST',
					enctype: 'multipart/form-data',
					data : f,
					success : function (data){
						console.log(data);
						window.location.href = "${PCurl}?type=list&message=insert_success";
					},
					error : function (data){
						console.log(data);
					},
					processData: false,
					contentType: false
				})*/
			})
		});--%>
		<%--$('#btnAdd').click(function (e){
			e.preventDefault();
			var productName= $('#productName').val();
			var price= parseFloat($('#price').val());
			var quantity = parseInt($('#quantity').val());
			if (productName == ""){
				alert("Yêu cầu nhập tên sản phẩm !");
				return false;
			}
			if ($('#price').val() == ""){
				alert("Yêu cầu nhập giá sản phẩm !");
				return false;
			}
			if (price < 0 ){
				alert("Yêu cầu nhập giá sản phẩm không âm !");
				return false;
			}
			if ($('#quantity').val() == ""){
				alert("Yêu cầu nhập số lượng sản phẩm !");
				return false;
			}
			if (quantity < 0){
				alert("Yêu cầu nhập số lượng sản phẩm không âm !");
				return false;
			}
			var describePro= CKEDITOR.instances["ckeditor"].getData();
			var detailCateId=parseInt($('#detailCateId').val());
			var image = $('input[type=file]').val().split('\\').pop();
			var brandId=parseInt($('#brandId').val())
			var f = new FormData(this);

			var data={
				"proName":productName,
				"price":price,
				"quantity":quantity,
				"describePro":describePro,
				"image":image,
				"detailCategoryEntity": {
					"id":detailCateId,
				},
				"brandEntity":{
					"id":brandId
				}
			}

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
			});
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
	</script>--%>
	<%--<script>
		Validator({
			form: '#form',
			formGroupSelector: '.form-group',
			errorSelector: '.form-message',
			rule: [
					Validator.isRequired('#productName'),
			]
		})
	</script>
	<script type="text/javascript" language="javascript">
   CKEDITOR.replace('ckeditor', {width: '700px',height: '300px'});--%>
</script>
</body>
</html>