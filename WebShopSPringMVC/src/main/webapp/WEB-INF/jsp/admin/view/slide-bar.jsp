<%@ page import="com.website.models.UserEntity" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

    <c:url value="/views/admin/static" var="url"></c:url>
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-center"><img class="hoverimg" src="${url}/img/find_user.png"
						class="user-image img-responsive" /></li>
					<li><a class="active-menu" href="#"><i
							class="fa fa-dashboard fa-3x"></i> Bảng điều khiển</a></li>
					<li><a href='<c:url value="/admin-product-list?type=list"/>'><i class="fa fa-desktop fa-3x"></i>
							Quản lí sản phẩm</a></li>
					<li><a href='<c:url value="/admin-category-list?type=list"/>'><i class="fa fa-desktop fa-3x"></i>
						Quản lí loại hàng</a></li>
					<li><a href='<c:url value="/admin-detailcategory-list?type=list"/>'><i class="fa fa-desktop fa-3x"></i>
						Quản lí chi tiết loại hàng</a></li>
					<%
						UserEntity user = (UserEntity) session.getAttribute("user");
						if (user.getRole().equals("1")){
					%>
					<li><a href='<c:url value="/admin-brand-list?type=list"/>'><i class="fa fa-desktop fa-3x"></i>
						Quản lí thương hiệu</a></li>
					<%
						}
					%>
					<li><a href='<c:url value="/admin-supplier-list?type=list"/>'><i class="fa fa-desktop fa-3x"></i>
						Quản lí nhà cung cấp</a></li>
					<%
						if (user.getRole().equals("1")){
					%>
					<li><a href="${pageContext.request.contextPath }/admin-user-list?type=list"><i class="fa fa-qrcode fa-3x"></i>
							Quản lí người dùng</a></li>
					<%
						}
					%>
					<li><a href='<c:url value="/admin-order-list?type=list"/>'><i
							class="fa fa-bar-chart-o fa-3x"></i> Quản lí đơn hàng</a></li>
					<li><a href='<c:url value="/admin-warehouse_receipt-list?type=list"/>'><i
							class="fa fa-bar-chart-o fa-3x"></i> Quản lí phiếu nhập hàng</a></li>
					<li><a href='<c:url value="/admin-comment-list?type=list"/>'><i
							class="fa fa-bar-chart-o fa-3x"></i> Quản lí bình luận</a></li>
					<li><a href="${pageContext.request.contextPath }/views/admin/view/statistical.jsp"><i class="fa fa-bar-chart-o fa-3x"></i>Thống kê</a></li>
				</ul>
			</div>
		</nav>