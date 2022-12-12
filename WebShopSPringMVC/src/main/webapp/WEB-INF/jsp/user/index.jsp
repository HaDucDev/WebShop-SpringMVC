<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/user" var="url"> </c:url>
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
	<%--    https://getbootstrap.com/docs/4.6/getting-started/introduction/#css--%>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" ></script>
	<!--  -->
</head>

<body>
<jsp:include page="a-header.jsp"></jsp:include>
<div class="header-middle"><!--header-middle-->
	<div class="container">
		<div class="row">
			<c:forEach var="p" items="${productListHome}">
				<div class="card col-md-4">
					<div class="card-body">

						<c:choose>
							<c:when test="${p.productImage != null}">
								<img class="img-fluid" src="<c:url value="${p.productImage}"/>" alt="{p.name}">
							</c:when>
							<c:otherwise>
								<img class="img-fluid" src="<c:url value="images/logo.png"/>" alt="{p.name}">
							</c:otherwise>
						</c:choose>

						<h3 class="card-title">${p.productName}</h3>
						<p class="card-text">${p.unitPrice} VND</p>
					</div>
					<div class="card-footer">
						<a href="javascript:;" class="btn-btn-danger" onclick="addToCart(${p.id})">Them vao gio</a>
						<a href="#" class="btn-btn-infi">Mua Ngay</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div><!--/header-middle-->
<%--<section id="slider"><!--slider-->--%>
<%--	<div class="container">--%>
<%--		<div class="row">--%>
<%--			<div class="col-sm-12">--%>
<%--				<div id="slider-carousel" class="carousel slide" data-ride="carousel">--%>
<%--					<ol class="carousel-indicators" style="z-index: 1">--%>
<%--						<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>--%>
<%--						<li data-target="#slider-carousel" data-slide-to="1"></li>--%>
<%--						<li data-target="#slider-carousel" data-slide-to="2"></li>--%>
<%--					</ol>--%>

<%--					<style>--%>
<%--						.image1{--%>
<%--							object-fit: cover;--%>
<%--							max-height: 400px;--%>
<%--							max-width: 100%;--%>
<%--							line-height: 1;--%>
<%--							margin-left: auto;--%>
<%--							margin-right: auto;--%>
<%--						}--%>
<%--					</style>--%>

<%--					<div class="carousel-inner text-center">--%>
<%--						<div class="item active" style="box-sizing: border-box;">--%>
<%--							<img src="https://xgear.net/wp-content/uploads/2022/05/HN015W-1-600x600-1.jpg" class="girl img-responsive image1"  alt="" width="100%"  />--%>
<%--						</div>--%>
<%--						<div class="item" style="box-sizing: border-box;">--%>
<%--							<img src="https://xgear.net/wp-content/uploads/2022/06/276VN-1-900x900-1.jpg" class="girl img-responsive image1"   alt="" width="100%" />--%>
<%--						</div>--%>
<%--						<div class="item" style="box-sizing: border-box;">--%>
<%--							<img src="https://xgear.net/wp-content/uploads/2022/06/GiG_Fi3_1650-copy.jpg" class="girl img-responsive image1"  alt="" width="100%" />--%>
<%--						</div>--%>

<%--					</div>--%>

<%--					<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">--%>
<%--						<i class="fa fa-angle-left"></i>--%>
<%--					</a>--%>
<%--					<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">--%>
<%--						<i class="fa fa-angle-right"></i>--%>
<%--					</a>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--</section><!--/slider-->--%>

<%--<section>--%>
<%--	<div class="container">--%>
<%--		<div class="row">--%>
<%--			<div class="col-sm-12 padding-right">--%>
<%--				<div class="features_items"><!--features_items-->--%>
<%--					<h1 style="color: red" class="title text-center">SẢN PHẨM</h1>--%>
<%--				</div><!--features_items-->--%>
<%--				--%>
<%--				<div class="row">--%>
<%--					<div class="col-lg-3">--%>
<%--						<img src="https://xgear.net/wp-content/uploads/2022/05/HN015W-1-600x600-1.jpg">--%>
<%--					</div>--%>
<%--					<div class="col-lg-9">--%>
<%--						<div class="category-tab"><!--category-tab-->--%>
<%--							<div class="col-sm-12">--%>
<%--								<ul class="nav nav-tabs">--%>
<%--									<li class="active"><a href="#tshirt" data-toggle="tab">Acer</a></li>--%>
<%--								</ul>--%>
<%--							</div>--%>
<%--							<div class="tab-content">--%>
<%--								<div class="tab-pane fade active in" id="tshirt" >--%>
<%--									<c:choose>--%>
<%--										<c:when test="${!empty lstACER}">--%>
<%--											<c:forEach var = "i" items="${lstACER}">--%>
<%--												<c:url value="/image/${i.getImage()}" var="imgUrl"></c:url>--%>
<%--												<div class="col-sm-4">--%>
<%--													<div class="product-image-wrapper">--%>
<%--														<div class="single-products">--%>
<%--															<div class="productinfo text-center">--%>
<%--																<a--%>
<%--																		href="${pageContext.request.contextPath }/client-product-list?type=detail_product&id=${i.getId()}&quantity=1">--%>
<%--																	<div class="c1">--%>
<%--																		<img  height="250" width="200" class="c2" src="${imgUrl}" alt="Fail" style="width: 300px;height: 200px;padding-left: 40px;"/>--%>
<%--																		<div class="c3">--%>
<%--																			<a  &lt;%&ndash;href="${APIurl}?id=${i.getId()}"&ndash;%&gt;--%>
<%--																					href="${pageContext.request.contextPath }/client-product-list?type=detail_product&id=${i.getId()}&quantity=1"--%>
<%--																					class="btn btn-default add-to-cart"><i--%>
<%--																					class="fa fa-shopping-cart"></i>Chi tiết sản phẩm</a>--%>
<%--																		</div>--%>
<%--																	</div>--%>
<%--																</a>--%>
<%--																&lt;%&ndash;<h2>${i.getPrice()} ₫</h2>&ndash;%&gt;--%>
<%--																<h2><fmt:formatNumber type="number" value="${i.getPrice()}" /> VNĐ</h2>--%>
<%--																<p>${i.getProName()}</p>--%>
<%--																<a onclick="addToCart(${i.getId()})" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>--%>
<%--															</div>--%>
<%--														</div>--%>
<%--													</div>--%>
<%--												</div>--%>
<%--											</c:forEach>--%>
<%--										</c:when>--%>
<%--										<c:otherwise>--%>
<%--&lt;%&ndash;											<c:redirect url="/list-laptop?type=list&page=1"></c:redirect>&ndash;%&gt;--%>
<%--										</c:otherwise>--%>
<%--									</c:choose>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				--%>
<%--				<div class="row">--%>
<%--					<div class="col-lg-9">--%>
<%--						<div class="category-tab"><!--category-tab-->--%>
<%--							<div class="col-sm-12">--%>
<%--								<ul class="nav nav-tabs">--%>
<%--									<li class="active"><a href="#tshirt" data-toggle="tab">Asus</a></li>--%>
<%--								</ul>--%>
<%--							</div>--%>
<%--							<div class="tab-content">--%>
<%--								<div class="tab-pane fade active in" id="tshirt" >--%>
<%--									<c:choose>--%>
<%--										<c:when test="${!empty lstASUS}">--%>
<%--											<c:forEach var = "i" items="${lstASUS}">--%>
<%--												<c:url value="/image/${i.getImage()}" var="imgUrl"></c:url>--%>
<%--												<div class="col-sm-4">--%>
<%--													<div class="product-image-wrapper">--%>
<%--														<div class="single-products">--%>
<%--															<div class="productinfo text-center">--%>
<%--																<a--%>
<%--																		href="${pageContext.request.contextPath }/client-product-list?type=detail_product&id=${i.getId()}&quantity=1">--%>
<%--																	<div class="c1">--%>
<%--																		<img height="250" width="200" class="c2" src="${imgUrl}" alt="Fail" style="width: 300px;height: 200px;padding-left: 40px;"/>--%>
<%--																		<div class="c3">--%>
<%--																			<a  &lt;%&ndash;href="${APIurl}?id=${i.getId()}"&ndash;%&gt;--%>
<%--																					href="${pageContext.request.contextPath }/client-product-list?type=detail_product&id=${i.getId()}&quantity=1"--%>
<%--																					class="btn btn-default add-to-cart"><i--%>
<%--																					class="fa fa-shopping-cart"></i>Chi tiết sản phẩm</a>--%>
<%--																		</div>--%>
<%--																	</div>--%>
<%--																</a>--%>
<%--																&lt;%&ndash;<h2>${i.getPrice()} ₫</h2>&ndash;%&gt;--%>
<%--																<h2><fmt:formatNumber type="number" value="${i.getPrice()}" /></h2>--%>
<%--																<p>${i.getProName()}</p>--%>
<%--																<a  &lt;%&ndash;href="${APIurl}?id=${i.getId()}"&ndash;%&gt; onclick="addToCart(${i.getId()})" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>--%>
<%--																	&lt;%&ndash;												<button onclick="addToCart(1)" class="btn btn-default add-to-cart"><i  class="fa fa-shopping-cart"></i>Thêm vào giỏ</button>&ndash;%&gt;--%>
<%--															</div>--%>
<%--														</div>--%>
<%--													</div>--%>
<%--												</div>--%>
<%--											</c:forEach>--%>
<%--										</c:when>--%>
<%--										<c:otherwise>--%>
<%--&lt;%&ndash;											<c:redirect url="/list-laptop?type=list&page=1"></c:redirect>&ndash;%&gt;--%>
<%--										</c:otherwise>--%>
<%--									</c:choose>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--					<div class="col-lg-3">--%>
<%--						<img src="https://xgear.net/wp-content/uploads/2022/05/HN015W-1-600x600-1.jpg">--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				--%>
<%--				<div class="row">--%>
<%--					<div class="col-lg-3">--%>
<%--						<img src="https://xgear.net/wp-content/uploads/2022/05/HN015W-1-600x600-1.jpg">--%>
<%--					</div>--%>
<%--					<div class="col-lg-9">--%>
<%--						<div class="category-tab"><!--category-tab-->--%>
<%--							<div class="col-sm-12">--%>
<%--								<ul class="nav nav-tabs">--%>
<%--									<li class="active"><a href="#tshirt" data-toggle="tab">MSI</a></li>--%>
<%--								</ul>--%>
<%--							</div>--%>
<%--							<div class="tab-content">--%>
<%--								<div class="tab-pane fade active in" id="tshirt" >--%>
<%--									<c:choose>--%>
<%--										<c:when test="${!empty lstMSI}">--%>
<%--											<c:forEach var = "i" items="${lstMSI}">--%>
<%--												<c:url value="/image/${i.getImage()}" var="imgUrl"></c:url>--%>
<%--												<div class="col-sm-4">--%>
<%--													<div class="product-image-wrapper">--%>
<%--														<div class="single-products">--%>
<%--															<div class="productinfo text-center">--%>
<%--																<a--%>
<%--																		href="${pageContext.request.contextPath }/client-product-list?type=detail_product&id=${i.getId()}&quantity=1">--%>
<%--																	<div class="c1">--%>
<%--																		<img height="250" width="200" class="c2" src="${imgUrl}" alt="Fail" style="width: 300px;height: 200px;padding-left: 40px;"/>--%>
<%--																		<div class="c3">--%>
<%--																			<a  &lt;%&ndash;href="${APIurl}?id=${i.getId()}"&ndash;%&gt;--%>
<%--																					href="${pageContext.request.contextPath }/client-product-list?type=detail_product&id=${i.getId()}&quantity=1"--%>
<%--																					class="btn btn-default add-to-cart"><i--%>
<%--																					class="fa fa-shopping-cart"></i>Chi tiết sản phẩm</a>--%>
<%--																		</div>--%>
<%--																	</div>--%>
<%--																</a>--%>
<%--																&lt;%&ndash;<h2>${i.getPrice()} ₫</h2>&ndash;%&gt;--%>
<%--																<h2><fmt:formatNumber type="number" value="${i.getPrice()}" /></h2>--%>
<%--																<p>${i.getProName()}</p>--%>
<%--																<a  &lt;%&ndash;href="${APIurl}?id=${i.getId()}"&ndash;%&gt; onclick="addToCart(${i.getId()})" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>--%>
<%--																	&lt;%&ndash;												<button onclick="addToCart(1)" class="btn btn-default add-to-cart"><i  class="fa fa-shopping-cart"></i>Thêm vào giỏ</button>&ndash;%&gt;--%>
<%--															</div>--%>
<%--														</div>--%>
<%--													</div>--%>
<%--												</div>--%>
<%--											</c:forEach>--%>
<%--										</c:when>--%>
<%--										<c:otherwise>--%>
<%--&lt;%&ndash;											<c:redirect url="/list-laptop?type=list&page=1"></c:redirect>&ndash;%&gt;--%>
<%--										</c:otherwise>--%>
<%--									</c:choose>--%>
<%--								</div>--%>
<%--								--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--</section>--%>

<jsp:include page="a-footer.jsp"></jsp:include>
<script src="${url}/js/jquery.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<script src="${url}/js/jquery.scrollUp.min.js"></script>
<script src="${url}/js/price-range.js"></script>
<script src="${url}/js/jquery.prettyPhoto.js"></script>
<script src="${url}/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<%--<script>--%>
<%--	function addToCart(data){--%>
<%--		 JSalert();--%>
<%--		$.ajax({--%>
<%--			url: '${APIaurl}',--%>
<%--			type: 'POST',--%>
<%--			enctype: 'multipart/form-data',--%>
<%--			processData:false,--%>
<%--			contentType: 'application/json',--%>
<%--			data:JSON.stringify(data),--%>
<%--			dataType: 'json',--%>
<%--			--%>
<%--			success: function (result){--%>
<%--				console.log("Success");--%>
<%--				console.log(data);--%>
<%--				&lt;%&ndash;window.location.href = "${PCurl}?type=list&message=insert_success";&ndash;%&gt;--%>
<%--			},--%>
<%--			errMode: function (error){--%>
<%--				console.log("Error");--%>
<%--			}--%>
<%--		})--%>
<%--	};--%>
<%--</script>--%>

<%--<script type="text/javascript">--%>
<%--	function JSalert(){--%>
<%--		Swal.fire('Thêm vào giỏ hàng thành công')--%>
<%--	}--%>
<%--</script>--%>
</body>
</html>
