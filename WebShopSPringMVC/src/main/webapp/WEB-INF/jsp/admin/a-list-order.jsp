<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<c:url value="/admin" var="url"></c:url>
<%--<c:url value="/api-admin-cart" var="APIUrl" ></c:url>--%>
<%--<c:url value="/admin-order-list" var="CCUrl"></c:url>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Order Management</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="${url}/css/bootstrap.css" rel="stylesheet"/>
    <!-- FONTAWESOME STYLES-->
    <link href="${url}/css/font-awesome.css" rel="stylesheet"/>
    <!-- MORRIS CHART STYLES-->

    <!-- CUSTOM STYLES-->
    <link href="${url}/css/custom.css" rel="stylesheet"/>
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans'
          rel='stylesheet' type='text/css'/>
    <!-- TABLE STYLES-->
    <link href="${url}/js/dataTables/dataTables.bootstrap.css"
          rel="stylesheet"/>
</head>
<body>
<div id="wrapper">

    <jsp:include page="nav-bar.jsp"></jsp:include>

    <!-- /. NAV TOP  -->
    <jsp:include page="slide-bar.jsp"></jsp:include>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>Quản lí đơn hàng</h2>
                </div>
            </div>
            <hr/>
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover"
                                       id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Ngày tạo</th>
                                        <th>Tài khoản đặt hàng</th>
                                        <th>Tình trạng đơn hàng</th>
                                        <th>Hành động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${orderList}" var="order">
                                        <tr>
                                            <td>${order.id}</td>
                                            <td>${order.createdDate}</td>
                                            <td>${order.user.fullName}</td>
                                            <td class="center">${order.statusOrder}</td>
                                            <td>
                                                <a class="center" href="<c:url value="/admin/order-detail/${order.id}"/>" >Chi tiết</a> |
                                                <c:if test="${order.statusOrder.equals('Đang chờ') == true}">
                                                    <a id="btnDelete" class="center" href="<c:url value="/admin/order/order-cancel/${order.id}"/>">Hủy đơn</a> |
                                                </c:if>
                                                <c:if test="${order.statusOrder.equals('Đang chờ') == true}">
                                                    <a class="center" href="<c:url value="/admin/order/confirm-order/${order.id}"/>">Chấp nhận đơn hàng</a>
                                                </c:if>
                                                <c:if test="${order.statusOrder.equals('Đang giao') == true}">
                                                    <a class="center" href="<c:url value="/admin/order/confirm-delivery-order/${order.id}"/>">Xác nhận đã giao đơn</a>
                                                </c:if>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
        </div>
    </div>
    <!-- /. PAGE INNER  -->
</div>
<!-- JQUERY SCRIPTS -->
<script src="${url}/js/jquery-1.10.2.js"></script>
<script src="${url}/js/jquery-3.3.1.min.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="${url}/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="${url}/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="${url}/js/dataTables/jquery.dataTables.js"></script>
<script src="${url}/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- CUSTOM SCRIPTS -->
<script src="${url}/js/custom.js"></script>
</body>
</html>