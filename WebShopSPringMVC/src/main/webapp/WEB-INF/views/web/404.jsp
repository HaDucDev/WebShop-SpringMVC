<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/views/web/static" var="url"> </c:url>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Error</title>
	<link href="${url}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${url}/css/font-awesome.min.css" rel="stylesheet">
	<link href="${url}/css/main.css" rel="stylesheet">
	<link href="${url}/css/responsive.css" rel="stylesheet">
</head>

<body>
<div class="container text-center">
	<div class="logo-404">
		<a href="index.jsp"><img src="${url}/images/home/logo.png" alt="" /></a>
	</div>
	<div class="content-404">
		<img src="${url}/images/404.png" class="img-responsive" alt="" />
		<h1><b>OPPS!</b> We Couldn’t Find this Page</h1>
		<p>Uh... So it looks like you brock something. The page you are looking for has up and Vanished.</p>
		<h2><a href="index.jsp">Bring me back Home</a></h2>
	</div>
</div>


<script src="${url}/js/jquery.js"></script>
<script src="${url}/js/price-range.js"></script>
<script src="${url}/js/jquery.scrollUp.min.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<script src="${url}/js/jquery.prettyPhoto.js"></script>
<script src="${url}/js/main.js"></script>
</body>
</html>