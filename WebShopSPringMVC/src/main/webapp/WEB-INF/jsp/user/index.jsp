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

</head>

<body>
<jsp:include page="a-header.jsp"></jsp:include>
<div class="header-middle"><!--header-middle-->
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<form id="product-form-filter" method="get" action="${pageContext.request.contextPath }/">
					<h5>Chọn loại sản phẩm</h5>
					<select name="categoryId" >
						<option value="0">Chọn ...</option>
						<c:forEach items="${cateList}" var="a">
							<option value="${a.id}">${a.name}</option>
						</c:forEach>
					</select>
					<h5>Chọn hãng</h5>
					<select name="supplierId">
						<option value="0">Chọn ...</option>
						<c:forEach items="${supplierList}" var="s">
							<option value="${s.id}">${s.supplierName}</option>
						</c:forEach>
					</select>
					<h5>Chọn giá khoảng giá</h5>
					<select name="price">
						<option value="0_0">Chọn ...</option>
						<option value="100000_1000000">100.000-1.000.000</option>
						<option value="1000000_10000000">1.000.000-10.000.000</option>
						<option value="10000000_20000000">10.000.000-20.000.000</option>
						<option value="20000000_30000000">20.000.000-30.000.000</option>
						<option value="30000000_0">Trên 30.000.000</option>
					</select>
					<input name="page" type="hidden" value="0">
					<input type="submit" value="Lọc" style="width: 100%; margin-top: 10px">
				</form>
			</div>
			<div class="col-md-10">
				<c:forEach var="p" items="${productsPage.content}">
					<div class="card col-md-4">
						<div class="card-body" style="margin: 0px 5px; height: 250px; width: 300px">

							<div style="width:50%;height:100px;object-fit: cover;">
								<c:choose>
									<c:when test="${p.productImage != null}">
										<img class="img-fluid" src="<c:url value="${p.productImage}"/>" alt="{p.name}" style=" width:100%;height:100%;">
									</c:when>
									<c:otherwise>
										<img class="img-fluid" src="<c:url value="images/logo.png"/>" alt="{p.name}" style=" width:100%;height:100%;">
									</c:otherwise>
								</c:choose>
							</div>
							<div style="font-size: 20px; box-sizing: border-box; padding: 5px">${p.productName}</div>
							<div style="display: flex;padding: 5px">
								<div class="card-text" style="margin-right: 5px"> Giá bán: ${Math.round(p.unitPrice-p.unitPrice*p.discount/100)}đ</div>
								<div class="card-text"><s>${p.unitPrice} đ</s></div>
							</div>
							<div style="font-size: 15px; box-sizing: border-box; padding: 5px">Giảm giá: ${p.discount}%</div>
						</div>
						<div class="card-footer">
							<a href="javascript:;" class="btn-btn-danger" onclick="addToCart(${p.id})" style="float: left">Thêm vào giỏ</a>
							<a href="<c:url value="/product/${p.id}"/>" class="btn-btn-infi" style="float: right">Chi tiết</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div>
			<ul class="pagination" style="float: right">
				<c:if test="${totalPages > 1}">
					<li class="page-item}">
						<a class="page-link-custom page-link"  tabindex="-1">Previous</a>
					</li>
					<c:forEach begin="0" end="${totalPages - 1}" var="i">
						<li class="page-item ${i eq number ? 'active' : ''}">
							<a class="page-link-custom page-link" data-page="${i}">${i + 1}</a>
						</li>
					</c:forEach>
					<li class="page-item">
						<a class="page-link-custom page-link">Next</a>
					</li>
				</c:if>
			</ul>
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

<script>
	// Lấy các thẻ a có class "page-link-custom"
	const links = document.querySelectorAll('.page-link-custom');

	// Lặp qua các thẻ a và thêm sự kiện click
	links.forEach(link => {
		link.addEventListener('click', function(e) {
			e.preventDefault(); // Ngăn chặn trình duyệt điều hướng đến đường dẫn trong href

			const currentPageUrl = window.location.href; // Lấy đường dẫn của trang hiện tại

			const pageNumber = this.dataset.page; // Lấy số trang từ thuộc tính "data-page" của thẻ a được nhấn

			// Tạo đường dẫn mới bằng cách thay thế tham số "page" trong đường dẫn hiện tại bằng số trang mới
			const url = new URL(currentPageUrl);
			url.searchParams.set('page', pageNumber);
			const newUrl = url.toString();

			// Điều hướng đến trang mới
			window.location.href = newUrl;
		});
	});
</script>

</body>
</html>