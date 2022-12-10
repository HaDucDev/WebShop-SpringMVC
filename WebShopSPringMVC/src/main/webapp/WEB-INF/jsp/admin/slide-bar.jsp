<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

    <c:url value="/admin" var="url"></c:url>
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-center"><img class="hoverimg" src="${url}/img/find_user.png" class="user-image img-responsive" /></li>

					<li><a class="active-menu" href="#"><i class="fa fa-dashboard fa-3x"></i> Bảng điều khiển</a></li>

					<li><a href='<c:url value="/admin/user-list"/>'><i class="fa fa-desktop fa-3x"></i>Quản lí người dùng</a></li>

					<li><a href='<c:url value="/admin/category-list"/>'><i class="fa fa-desktop fa-3x"></i>Quản lí loại hàng</a></li>

					<li><a href='<c:url value="/admin/supplier-list"/>'><i class="fa fa-desktop fa-3x"></i>Quản lí nhà cung cấp</a></li>
                    <li><a href='<c:url value="/admin/product-list"/>'><i class="fa fa-desktop fa-3x"></i>Quản lí sản phẩm</a></li>

					<li><a href='<c:url value=""/>'><i class="fa fa-desktop fa-3x"></i>Quản lí đơn hàng</a></li>

					<li><a href='<c:url value=""/>'><i class="fa fa-desktop fa-3x"></i>Quản lí bình luận</a></li>

					<li><a href=""><i class="fa fa-qrcode fa-3x"></i>Quản lí thống kế</a></li>

					<li><a href="${pageContext.request.contextPath }/views/admin/view/statistical.jsp"><i class="fa fa-bar-chart-o fa-3x"></i>Thống kê</a></li>
				</ul>
			</div>
		</nav>