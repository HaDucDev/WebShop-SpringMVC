<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/admin" var="url"></c:url>
<c:url value="/admin/product/edit/${product.id}" var="PCurl"></c:url>
<!DOCTYPE html>
<html>
<head>
<script src="<c:url value="${url}/ckeditor/ckeditor.js" />"></script>
<meta charset="utf-8"/>
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
										<c:url value="/admin/product/add" var="action"></c:url>
										<form:form role="form" action="${action}" method="post" modelAttribute="product"
											enctype="multipart/form-data">
											<form:input id="id" name="id"  hidden="" path="id" readonly="true"/>

											<div class="form-group">
												<label for="logo">Ảnh sản phẩm:</label>
												<form:input type="file" path="productFile" class="form-control"
															name="image" id="logo"/>
											</div>
											<div class="form-group">
												<c:choose>
													<c:when test="${product.productImage != null}">
														<img style="width: 100px;height: 100px;object-fit: cover" src="<c:url value="${product.productImage}"/>" alt="${product.productName}">
													</c:when>
													<c:otherwise>
														<img style="width: 100px;height: 100px;object-fit: cover" src="<c:url value="/images/logo.png"/>" alt="${product.productName}">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="form-group">
												<label for="productName">Tên sản phẩm</label>
												<form:input path="productName" class="form-control"
															placeholder="Nhập tên sản phẩm" name="productName"
															id="productName"/>
											</div>
											<div class="form-group">
												<label for="quantity">Số lượng</label>
												<form:input path="quantity"  class="form-control" min="0"
															onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
															placeholder="Nhập số lượng sản phẩm"
															type="number" name="quantity" id="quantity"/>
											</div>
											<div class="form-group">
												<label for="price">Giá (VNĐ)</label>
												<form:input path="unitPrice" value="${price}" class="form-control" min="0"
															onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
															placeholder="Nhập giá sản phẩm" type="number" name="price"
															id="price"/>
											</div>
											<div class="form-group">
												<label for="discount">Giảm giá (%)</label>
												<form:input path="discount" value="${price}" class="form-control" min="0"
															onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
															placeholder="Nhập giá sản phẩm" type="number" name="discount"
															id="discount"/>
											</div>

											<div class="form-group">
												<label>Mô tả sản phẩm </label>
												<br>
												<form:textarea path="descriptionProduct" rows="4" cols="50" name="ckeditor" id="ckeditor"></form:textarea>
											</div>

											<div class="form-group">
												<label for="cate">Loại sản phẩm</label>
												<div class="checkbox">
													<form:select path="category" name="detailCateId" id="cate">
														<option value="${product.category.id}">${product.category.name}</option>
														<c:forEach items="${cateList}" var="c">
															<c:if test = "${product.category.id != c.id}">
																<option value="${c.id}">${c.name}</option>
															</c:if>
														</c:forEach>
													</form:select>
												</div>

											</div>
											<div class="form-group">
												<label for="su">Nhà sản xuất</label>
												<div class="checkbox">
													<form:select path="supplier" name="brandId" id="su">
														<option value="${product.supplier.id}">${product.supplier.supplierName}</option>
														<c:forEach items="${supplierList}" var="s">
															<c:if test = "${product.supplier.id != s.id}">
																<option value="${s.id}">${s.supplierName}</option>
															</c:if>
														</c:forEach>
													</form:select>
												</div>
											</div>

											<div class="form-group">
												<label for="su1">Trạng thái sản phẩm</label>
												<div class="checkbox">
													<form:select path="productstatus" name="productStatust" id="su1">
														<c:if test = "${product.productstatus.id == 1}">
															<option value="${product.productstatus.id}">Còn hàng</option>
														</c:if>
														<c:if test = "${product.productstatus.id == 2}">
															<option value="${product.productstatus.id}">Hết hàng</option>
														</c:if>
														<c:forEach items="${productStatusList}" var="ps">
															<c:if test = "${product.productstatus.id != ps.id}">
																<c:if test = "${ps.id == 1}">
																	<option value="${ps.id}">Còn hàng</option>
																</c:if>
																<c:if test = "${ps.id == 2}">
																	<option value="${ps.id}">Hết hàng</option>
																</c:if>
															</c:if>
														</c:forEach>
													</form:select>
												</div>
											</div>
											<input type="submit" id="btnEdit"  class="btn btn-default" value="Cập nhật"/>
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