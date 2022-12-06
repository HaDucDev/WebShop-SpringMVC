<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
    <c:url value="/views/shipper/static" var="url"></c:url>
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-center"><img class="hoverimg" src="${url}/img/find_user.png"
						class="user-image img-responsive" /></li>
					<li><a class="active-menu" href="#"><i
							class="fa fa-dashboard fa-3x"></i> Bảng điều khiển</a></li>
					<li><a href="${pageContext.request.contextPath }/views/shipper/view/list-donhang.jsp"><i class="fa fa-qrcode fa-3x"></i>
						Đơn hàng được giao</a></li>
					<li><a href='<c:url value="/views/shipper/view/list-tinhtrang.jsp"/>'><i class="fa fa-desktop fa-3x"></i>
						Tình trạng đơn hàng</a></li>
					<li><a href="${pageContext.request.contextPath }/views/shipper/view/list-lichsu.jsp"><i class="fa fa-qrcode fa-3x"></i>
							Lịch sử giao hàng</a></li>
				</ul>
			</div>
		</nav>