<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/views/web/static" var="url"> </c:url>
<c:url value="/api-user-cart" var="APIaurl"></c:url>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Trang chủ</title>
	<link href="${url}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${url}/css/font-awesome.min.css" rel="stylesheet">
	<link href="${url}/css/main.css" rel="stylesheet">
	<link href="${url}/css/responsive.css" rel="stylesheet">
	<!--  -->
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<section id="slider"><!--slider-->
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div id="slider-carousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators" style="z-index: 1">
						<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
						<li data-target="#slider-carousel" data-slide-to="1"></li>
						<li data-target="#slider-carousel" data-slide-to="2"></li>
					</ol>

					<div class="carousel-inner text-center">
						<div class="item active">
							<img src="https://xgear.vn/wp-content/uploads/2020/12/freebuild-slider_compressed.jpg" class="girl img-responsive"  alt=""/>
						</div>
						<div class="item">
							<img src="https://xgear.vn/wp-content/uploads/2021/01/T%E1%BA%BFt-gi%E1%BA%A3m-h%E1%BA%BFt-slider.jpg" class="girl img-responsive"   alt="" />
						</div>
						<div class="item">
							<img src="https://xgear.vn/wp-content/uploads/2020/12/Concept-D-Slider.jpg" class="girl img-responsive"  alt=""/>
						</div>

					</div>

					<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
						<i class="fa fa-angle-left"></i>
					</a>
					<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
						<i class="fa fa-angle-right"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
</section><!--/slider-->

<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 padding-right">
				<div class="features_items"><!--features_items-->
					<h1 style="color: red" class="title text-center">SẢN PHẨM</h1>
				</div><!--features_items-->
				
				<div class="row">
					<div class="col-lg-3">
						<img src="https://xgear.vn/wp-content/uploads/2020/02/Acer-Gaming.jpg">
					</div>
					<div class="col-lg-9">
						<div class="category-tab"><!--category-tab-->
							<div class="col-sm-12">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#tshirt" data-toggle="tab">Acer</a></li>
								</ul>
							</div>
							<div class="tab-content">
								<div class="tab-pane fade active in" id="tshirt" >
									<c:choose>
										<c:when test="${!empty lstACER}">
											<c:forEach var = "i" items="${lstACER}">
												<c:url value="/image/${i.getImage()}" var="imgUrl"></c:url>
												<div class="col-sm-4">
													<div class="product-image-wrapper">
														<div class="single-products">
															<div class="productinfo text-center">
																<a
																		href="${pageContext.request.contextPath }/client-product-list?type=detail_product&id=${i.getId()}&quantity=1">
																	<div class="c1">
																		<img  height="250" width="200" class="c2" src="${imgUrl}" alt="Fail" style="width: 300px;height: 200px;padding-left: 40px;"/>
																		<div class="c3">
																			<a  <%--href="${APIurl}?id=${i.getId()}"--%>
																					href="${pageContext.request.contextPath }/client-product-list?type=detail_product&id=${i.getId()}&quantity=1"
																					class="btn btn-default add-to-cart"><i
																					class="fa fa-shopping-cart"></i>Chi tiết sản phẩm</a>
																		</div>
																	</div>
																</a>
																<%--<h2>${i.getPrice()} ₫</h2>--%>
																<h2><fmt:formatNumber type="number" value="${i.getPrice()}" /> VNĐ</h2>
																<p>${i.getProName()}</p>
																<a onclick="addToCart(${i.getId()})" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:when>
										<c:otherwise>
<%--											<c:redirect url="/list-laptop?type=list&page=1"></c:redirect>--%>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-9">
						<div class="category-tab"><!--category-tab-->
							<div class="col-sm-12">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#tshirt" data-toggle="tab">Asus</a></li>
								</ul>
							</div>
							<div class="tab-content">
								<div class="tab-pane fade active in" id="tshirt" >
									<c:choose>
										<c:when test="${!empty lstASUS}">
											<c:forEach var = "i" items="${lstASUS}">
												<c:url value="/image/${i.getImage()}" var="imgUrl"></c:url>
												<div class="col-sm-4">
													<div class="product-image-wrapper">
														<div class="single-products">
															<div class="productinfo text-center">
																<a
																		href="${pageContext.request.contextPath }/client-product-list?type=detail_product&id=${i.getId()}&quantity=1">
																	<div class="c1">
																		<img height="250" width="200" class="c2" src="${imgUrl}" alt="Fail" style="width: 300px;height: 200px;padding-left: 40px;"/>
																		<div class="c3">
																			<a  <%--href="${APIurl}?id=${i.getId()}"--%>
																					href="${pageContext.request.contextPath }/client-product-list?type=detail_product&id=${i.getId()}&quantity=1"
																					class="btn btn-default add-to-cart"><i
																					class="fa fa-shopping-cart"></i>Chi tiết sản phẩm</a>
																		</div>
																	</div>
																</a>
																<%--<h2>${i.getPrice()} ₫</h2>--%>
																<h2><fmt:formatNumber type="number" value="${i.getPrice()}" /></h2>
																<p>${i.getProName()}</p>
																<a  <%--href="${APIurl}?id=${i.getId()}"--%> onclick="addToCart(${i.getId()})" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
																	<%--												<button onclick="addToCart(1)" class="btn btn-default add-to-cart"><i  class="fa fa-shopping-cart"></i>Thêm vào giỏ</button>--%>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:when>
										<c:otherwise>
<%--											<c:redirect url="/list-laptop?type=list&page=1"></c:redirect>--%>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<img src="https://xgear.vn/wp-content/uploads/2019/06/ROG-1-1.jpg">
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-3">
						<img src="https://xgear.vn/wp-content/uploads/2020/12/MSI-trang-ch%E1%BB%A7.jpg	">
					</div>
					<div class="col-lg-9">
						<div class="category-tab"><!--category-tab-->
							<div class="col-sm-12">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#tshirt" data-toggle="tab">MSI</a></li>
								</ul>
							</div>
							<div class="tab-content">
								<div class="tab-pane fade active in" id="tshirt" >
									<c:choose>
										<c:when test="${!empty lstMSI}">
											<c:forEach var = "i" items="${lstMSI}">
												<c:url value="/image/${i.getImage()}" var="imgUrl"></c:url>
												<div class="col-sm-4">
													<div class="product-image-wrapper">
														<div class="single-products">
															<div class="productinfo text-center">
																<a
																		href="${pageContext.request.contextPath }/client-product-list?type=detail_product&id=${i.getId()}&quantity=1">
																	<div class="c1">
																		<img height="250" width="200" class="c2" src="${imgUrl}" alt="Fail" style="width: 300px;height: 200px;padding-left: 40px;"/>
																		<div class="c3">
																			<a  <%--href="${APIurl}?id=${i.getId()}"--%>
																					href="${pageContext.request.contextPath }/client-product-list?type=detail_product&id=${i.getId()}&quantity=1"
																					class="btn btn-default add-to-cart"><i
																					class="fa fa-shopping-cart"></i>Chi tiết sản phẩm</a>
																		</div>
																	</div>
																</a>
																<%--<h2>${i.getPrice()} ₫</h2>--%>
																<h2><fmt:formatNumber type="number" value="${i.getPrice()}" /></h2>
																<p>${i.getProName()}</p>
																<a  <%--href="${APIurl}?id=${i.getId()}"--%> onclick="addToCart(${i.getId()})" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
																	<%--												<button onclick="addToCart(1)" class="btn btn-default add-to-cart"><i  class="fa fa-shopping-cart"></i>Thêm vào giỏ</button>--%>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:when>
										<c:otherwise>
<%--											<c:redirect url="/list-laptop?type=list&page=1"></c:redirect>--%>
										</c:otherwise>
									</c:choose>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
<script src="${url}/js/jquery.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<script src="${url}/js/jquery.scrollUp.min.js"></script>
<script src="${url}/js/price-range.js"></script>
<script src="${url}/js/jquery.prettyPhoto.js"></script>
<script src="${url}/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script>
	function addToCart(data){
		 JSalert();
		$.ajax({
			url: '${APIaurl}',
			type: 'POST',
			enctype: 'multipart/form-data',
			processData:false,
			contentType: 'application/json',
			data:JSON.stringify(data),
			dataType: 'json',
			
			success: function (result){
				console.log("Success");
				console.log(data);
				<%--window.location.href = "${PCurl}?type=list&message=insert_success";--%>
			},
			errMode: function (error){
				console.log("Error");
			}
		})
	};
</script>

<script type="text/javascript">
	function JSalert(){
		Swal.fire('Thêm vào giỏ hàng thành công')
	}
</script>
</body>
</html>
