<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/user" var="url"> </c:url>
<c:url value="/js" var="urljs"> </c:url>
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
	<script src="${urljs}/main.js"></script>
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
						<a href="<c:url value="/product/${p.id}"/>" class="btn-btn-infi">Mua Ngay</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Thông báo</h4>
			</div>
			<div class="modal-body">
				<p>Bạn phải đăng nhập để có thể thêm sản phẩm vào giỏ hàng</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>

<div class="modal fade" id="myModalDone" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Thông báo</h4>
			</div>
			<div class="modal-body">
				<p>Sản phẩm đã thêm vào giỏ hàng thành công</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>

<jsp:include page="a-footer.jsp"></jsp:include>
<script src="${url}/js/jquery.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<script src="${url}/js/jquery.scrollUp.min.js"></script>
<script src="${url}/js/price-range.js"></script>
<script src="${url}/js/jquery.prettyPhoto.js"></script>
<script src="${url}/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>



</body>
</html>