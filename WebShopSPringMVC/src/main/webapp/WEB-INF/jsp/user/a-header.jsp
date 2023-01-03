<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/user" var="url"> </c:url>
<%--<c:url value="/views/web" var="Pathurl"> </c:url>--%>
<%--<c:url value="/home" var="HomeUrl"> </c:url>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>index</title>
    <link href="${url}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${url}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${url}/css/main.css" rel="stylesheet">
    <link rel="stylesheet" href="${url}/css/menu.css">
</head>
<body>
<header id="header"><!--header-->
    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <a href="${pageContext.request.contextPath}/home"><img src="${url}/images/logo1.png" alt="" /></a>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class=" nav nav-pills nav-stacked ">
                            <c:if test="${not empty sessionScope.currentUser.fullName}">
                                <li><a href="${pageContext.request.contextPath}/user/account-manager"><i class="fa fa-book" aria-hidden="true"></i>Tài khoản</a></li>
                            </c:if>
                            <c:if test="${not empty sessionScope.currentUser.fullName}">
                                <li><a href="${pageContext.request.contextPath}/user/order-manager"><i class="fa fa-book" aria-hidden="true"></i>Đơn hàng</a></li>
                            </c:if>
                            <li><a href="${pageContext.request.contextPath}/user/cart"><i class="fa fa-shopping-cart"></i> Giỏ hàng<span class="badge badge-danger" id="cart-counter">${cartCounter}</span></a></li>
                            <c:if test="${not empty sessionScope.currentUser.fullName}">
                                <li><a href="#"><i class="fa fa-user"></i>Chào <c:out value="${sessionScope.currentUser.fullName}"></c:out></a></li>
                                <li><a href="<c:url value="/logout"/>">Đăng xuất</a></li>
                            </c:if>
                            <c:if test="${empty sessionScope.currentUser.fullName}">
                                <li><a href="<c:url value="/login"/>"><i class="fa fa-lock"></i>Đăng nhập / Đăng kí </a></li>
                            </c:if>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->
</header><!--/header-->

<nav>
    <ul>
        <li><a href="${pageContext.request.contextPath }/">Trang chủ</a></li>


        <li><a href="${pageContext.request.contextPath }/client-product-list?type=list&page=1">Danh mục sản phẩm</a>

            <ul>
                <c:forEach items="${lstCategory}" var="category">
                    <li><a href="${pageContext.request.contextPath }/client-product-list?type=category&cate_id=${category.id}&page=1">${category.cateName}</a>
                        <ul>
                             <c:forEach items="${category.getDetailCategoryEntityList()}" var="detailCategory">
                                <li><a href="${pageContext.request.contextPath }/client-product-list?type=detail_category&detail_cate_id=${detailCategory.id}&page=1">${detailCategory.detailCateName}</a></li>
                             </c:forEach>
                        </ul>
                    </li>
                </c:forEach>
            </ul>
        </li>
        <li><a href="<c:url value="/salespolicy"/>">Chính sách bán hàng</a></li>
        <li><a href="<c:url value="/map"/>">Liên hệ</a></li>
        <div class="search-container">
            <form action="${pageContext.request.contextPath }/client-product-list">
                <input name="keyword" type="text" placeholder="Tìm kiếm.." >
                <input name="type" type="hidden" value="searchByName">
                <input name="page" type="hidden" value="1">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
    </ul>

</nav>
</body>
</html>
