<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<nav class="navbar navbar-default navbar-cls-top " role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".sidebar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="${pageContext.request.contextPath }/shipper">Dashboard</a>
	</div>
	<div
		style="color: #ffffff; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
		Chào ${loginName} &nbsp; <a href="${pageContext.request.contextPath }/dang-nhap?action=logout"
			class="btn btn-danger square-btn-adjust">Đăng xuất</a>
	</div>
</nav>
