<%@ page import="java.net.http.HttpRequest" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:url value="/views/web/static" var="url"> </c:url>
<c:url value="/api-user-cart" var="APIaurl"></c:url>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Sản phẩm</title>

	<link href="${url}css/main.css" rel="stylesheet">
	<link href="${url}css/responsive.css" rel="stylesheet">
	<link href="${url}css/brand.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css">
	<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'>
	<link href='https://use.fontawesome.com/releases/v5.8.1/css/all.css'>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>

<body>
    <jsp:include page="a-header.jsp"></jsp:include>
	<section>
		<div class="container">
			<div class="row">
				<div class="brands-area">
					<div class="zigzag-bottom"></div>
					<div class="container">
						<div class="row">
							<div class="col" style="padding: 10px 0px;">
								<div class="brands_slider_container">
									<div class="owl-carousel owl-theme brands_slider">
										<c:forEach var="brand" items="${lstBrand}">
										<div class="owl-item">
											<div class="brands_item d-flex flex-column justify-content-center">
												<a href="${pageContext.request.contextPath}/client-product-list?type=Brand&brand_id=${brand.id}&page=1">
													<img style="height: 40px; width: auto;" src="${pageContext.request.contextPath}/views/web/static/images/${brand.image}" alt="">
												</a>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<ul style="display: inline;">
					<li style="flex:left; padding: 0px 15px; color: black; font-size: 17px;"> Chọn giá sản phẩm:</li>
					<li> <a style="float:left; padding: 0px 15px; color: blue; font-size: 15px;" href="${pageContext.request.contextPath}/client-product-list?type=Price&startPrice=0&endPrice=500000&page=1"> Dưới 500.000</a></li>
					<li> <a style="float:left; padding: 0px 15px; color: blue; font-size: 15px;" href="${pageContext.request.contextPath}/client-product-list?type=Price&startPrice=500000&endPrice=1000000&page=1"> 500.000-1.000.000</a></li>
					<li> <a style="float:left; padding: 0px 15px; color: blue; font-size: 15px;" href="${pageContext.request.contextPath}/client-product-list?type=Price&startPrice=1000000&endPrice=5000000&page=1"> 1.000.0000-5.000.000</a></li>
					<li> <a style="float:left; padding: 0px 15px; color: blue; font-size: 15px;" href="${pageContext.request.contextPath}/client-product-list?type=Price&startPrice=5000000&endPrice=10000000&page=1"> 5.000.0000-10.000.000</a></li>
					<li> <a style="float:left; padding: 0px 15px; color: blue; font-size: 15px;" href="${pageContext.request.contextPath}/client-product-list?type=Price&startPrice=10000000&endPrice=15000000&page=1"> 10.000.0000-15.000.000</a></li>
					<li> <a style="float:left; padding: 0px 15px; color: blue; font-size: 15px;" href="${pageContext.request.contextPath}/client-product-list?type=Price&startPrice=15000000&endPrice=20000000&page=1"> 15.000.0000-20.000.000</a></li>
					<li> <a style="float:left; padding: 0px 15px; color: blue; font-size: 15px;" href="${pageContext.request.contextPath}/client-product-list?type=Price&startPrice=20000000&endPrice=990000000&page=1"> Trên 20.000.000</a></li>

				</ul>
			</div>
			<div class="row">
				<div class="col-sm-12 padding-right">
					<div class="features_items" style="min-height: 300px"><!--features_items-->
						<div class="row">
							<hr>
							<c:forEach var = "i" items="${lstProduct}">
								<c:url value="/image/${i.getImage()}" var="imgUrl"></c:url>
								<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<a href="${pageContext.request.contextPath }/client-product-list?type=detail_product&id=${i.getId()}&quantity=1">
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
												<h2>${i.getPrice()}VNĐ</h2>
<%--										ff		<h2><c:out value="${i.getPrice().toFixed(2)}"></c:out>  VNĐ</h2>--%>
<%--												<h2><fmt:formatNumber type="number" value="${i.getPrice()}" /> VNĐ</h2>--%>
<%--												<h2>${i.getPrice()}VNĐ</h2>&ndash;%&gt;--%>
												<p>${i.getProName()}</p>
												<a  <%--href="${APIurl}?id=${i.getId()}"--%> onclick="addToCart(${i.getId()})" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

						<div class="row text-center">
								<ul class="pagination">
								<%--	list--%>
									<%
										String theloai=(String) session.getAttribute("theloaicu");
										if(theloai.equals("list") || theloai.equals("")){
									%>
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/client-product-list?type=list&page=${lastPages}">Trước</a></li>
									<c:forEach var="i" begin="1" end="${numOfPages}">
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/client-product-list?type=list&page=${i}">${i}</a></li>
									</c:forEach>
									<% } %>
									<%--detail category--%>
									<%
										if(theloai.equals("detail_category")){
									%>
									<li><a href="${pageContext.request.contextPath }/client-product-list?type=detail_category&detail_cate_id=${detail_cate_id}&page=${lastPages}">Trước</a></li>
									<c:forEach var="i" begin="1" end="${numOfPages}">
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/client-product-list?type=detail_category&detail_cate_id=${detail_cate_id}&page=${i}">${i}</a></li>
									</c:forEach>
									<% } %>
								<%--brand id--%>
									<%
										if(theloai.equals("Brand")){
									%>
									<li><a href="${pageContext.request.contextPath }/client-product-list?type=Brand&brand_id=${brand_id}&page=${lastPages}">Trước</a></li>
									<c:forEach var="i" begin="1" end="${numOfPages}">
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/client-product-list?type=Brand&brand_id=${brand_id}&page=${i}">${i}</a></li>
									</c:forEach>
									<% } %>
								<%--price--%>
									<%
										if(theloai.equals("Price")){
									%>
									<li><a href="${pageContext.request.contextPath}/client-product-list?type=Price&startPrice=${start_price}&endPrice=${end_price}&page=${lastPages}">Trước</a></li>
									<c:forEach var="i" begin="1" end="${numOfPages}">
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/client-product-list?type=Price&startPrice=${start_price}&endPrice=${end_price}&page=${i}">${i}</a></li>
									</c:forEach>
									<% } %>
									<%--keyWord--%>
									<%
										if(theloai.equals("searchByName")){
									%>
									<li><a href="${pageContext.request.contextPath}/client-product-list?keyword=${keyWord}&type=searchByName&page=${lastPages}">Trước</a></li>
									<c:forEach var="i" begin="1" end="${numOfPages}">
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/client-product-list?keyword=${keyWord}&type=searchByName&page=${i}">${i}</a></li>
									</c:forEach>
									<% } %>
									<%--category--%>
									<%
										if(theloai.equals("category")){
									%>
									<li><a href="${pageContext.request.contextPath}/client-product-list?type=category&cate_id=${cate_id}&page=${lastPages}">Trước</a></li>
									<c:forEach var="i" begin="1" end="${numOfPages}">
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/client-product-list?type=category&cate_id=${cate_id}&page=${i}">${i}</a></li>
									</c:forEach>
									<% } %>

								<%--list--%>
									<%
										if(theloai.equals("list")){
									%>
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/client-product-list?type=list&page=${nextPages}">Sau</a></li>
									<% } %>
									<%--detail_category--%>
									<%
										if(theloai.equals("detail_category")){
									%>
									<li><a href="${pageContext.request.contextPath }/client-product-list?type=detail_category&detail_cate_id=${detail_cate_id}&page=${nextPages}">Sau</a></li>
									<% } %>
									<%--brand_id--%>
									<%
										if(theloai.equals("Brand")){
									%>
									<li><a href="${pageContext.request.contextPath}/client-product-list?type=Brand&brand_id=${brand_id}&page=${nextPages}">Sau</a></li>
									<% } %>
									<%--price--%>
									<%
										if(theloai.equals("Price")){
									%>
									<li><a href="${pageContext.request.contextPath}/client-product-list?type=Price&startPrice=${start_price}&endPrice=${end_price}&page=${nextPages}">Sau</a></li>
									<% } %>
									<%--keyWord--%>
									<%
										if(theloai.equals("searchByName")){
									%>
									<li><a href="${pageContext.request.contextPath}/client-product-list?keyword=${keyWord}&type=searchByName&page=${nextPages}">Sau</a></li>
									<% } %>
									<%--category--%>
									<%
										if(theloai.equals("category")){
									%>
									<li><a href="${pageContext.request.contextPath}/client-product-list?type=category&cate_id=${cate_id}&page=${nextPages}">Sau</a></li>
									<% } %>
								</ul>
						</div>

					</div><!--features_items-->
				</div>
			</div>
		</div>
	</section>
	<script src="${url}/js/brand.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.js"></script>
	<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
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

	<jsp:include page="a-footer.jsp"></jsp:include>

</body>
</html>
