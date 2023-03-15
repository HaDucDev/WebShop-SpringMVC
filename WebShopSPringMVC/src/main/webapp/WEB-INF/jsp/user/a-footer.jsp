<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/user" var="url"> </c:url>
<!DOCTYPE html>
<html lang="en">
<header>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Footer</title>
	<link href="${url}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${url}/css/font-awesome.min.css" rel="stylesheet">
	<link href="${url}/css/main.css" rel="stylesheet">
	<link href="${url}/css/responsive.css" rel="stylesheet">
</header>
<body>
<footer id="footer"><!--Footer-->
	<div class="footer-top">
		<div class="container">
			<div class="row">
				<div class="col-sm-2">
					<div class="companyinfo">
						<img src="${url}/images/logo1.png" alt="">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="footer-widget">
		<div class="container">
			<div class="row">
				<div class="col-sm-7">
					<div class="single-widget">
						<h2>Thông tin ****</h2>
						<ul class="nav nav-pills nav-stacked">
							<li><a href="#">****</a></li>
							<li><a href="#">****</a></li>

						</ul>
					</div>
				</div>
				<div class="col-sm-5">
					<div class="single-widget">
						<h2>Xem thêm sản phẩm</h2>
					</div>
					<img src="${url}/images/nitro5.png" alt="#" width="70px">
					<img src="${url}/images/nitro5.png" alt="#" width="70px">
					<img src="${url}/images/nitro5.png" alt="#" width="70px">
					<img src="${url}/images/nitro5.png" alt="#" width="70px">
					<br>
					<br>
					<img src="${url}/images/nitro5.png" alt="#" width="70px">
					<img src="${url}/images/nitro5.png" alt="#" width="70px">
					<img src="${url}/images/nitro5.png" alt="#" width="70px">
					<img src="${url}/images/nitro5.png" alt="#" width="70px">

				</div>
			</div>
		</div>
	</div>
</footer><!--/Footer-->
</body>
</html>