<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<nav class="navbar-default navbar-side" role="navigation" style="position: fixed">
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
            <li class="text-center"><img class="hoverimg" src="<c:url value="${sessionScope.currentUser.avatar}"/>"
                                         class="user-image img-responsive" style="border-radius: 50%; width: 128px;height: 128px;object-fit: cover"/></li>

            <li><a class="active-menu" href="#"><i class="fa fa-dashboard fa-3x"></i> Bảng điều khiển</a></li>

            <li><a href='<c:url value="/admin/user-list"/>'><i class="fa fa-desktop fa-3x"></i>Quản lí người dùng</a></li>

            <li><a href='<c:url value="/admin/category-list"/>'><i class="fa fa-desktop fa-3x"></i>Quản lí loại hàng</a></li>

            <li><a href='<c:url value="/admin/supplier-list"/>'><i class="fa fa-desktop fa-3x"></i>Quản lí nhà cung cấp</a></li>

            <li><a href='<c:url value="/admin/product-list"/>'><i class="fa fa-desktop fa-3x"></i>Quản lí sản phẩm</a></li>

            <li><a href='<c:url value="/admin/order-list-all"/>'><i class="fa fa-desktop fa-3x"></i>Quản lí đơn hàng</a></li>

            <li><a href='<c:url value=""/>'><i class="fa fa-desktop fa-3x"></i>Quản lí bình luận</a></li>

            <li><a href="<c:url value="/admin/statistical"/>"><i class="fa fa-qrcode fa-3x"></i>Quản lí thống kê</a></li>
        </ul>
    </div>
</nav>