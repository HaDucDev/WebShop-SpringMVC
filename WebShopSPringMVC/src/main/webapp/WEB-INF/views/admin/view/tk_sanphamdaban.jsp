<%@ page import="com.website.models.UserEntity" %><%--
  Created by IntelliJ IDEA.
  User: hungd
  Date: 4/21/2021
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:url var="APIurl" value="/api-admin-product"/>
<c:url value="/views/admin/static" var="url"></c:url>
<c:url value="/admin-product-list" var="PCurl"></c:url>
<c:url value="/admin-warehouse_receipt-list" var="dUrl"></c:url>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thống kê sản phẩm đã bán</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="${url}/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="${url}/css/font-awesome.css" rel="stylesheet" />
    <!-- MORRIS CHART STYLES-->
    <!-- CUSTOM STYLES-->
    <link href="${url}/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans'
          rel='stylesheet' type='text/css' />
    <!-- TABLE STYLES-->
    <link href="${url}/js/dataTables/dataTables.bootstrap.css"
          rel="stylesheet" />
</head>
<body>
<div id="wrapper">
    <jsp:include page="/views/admin/view/nav-bar.jsp"></jsp:include>
    <!-- /. NAV TOP  -->
    <jsp:include page="/views/admin/view/slide-bar.jsp"></jsp:include>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>Thống kê sản phẩm đã bán</h2>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="panel panel-back noti-box">
                        <div class="text-box" style="color: greenyellow">
                            <button style="color: #1a1b1c; background: #eadf05; height: 150px; width: 200px; font-weight: bolder"
                                    onclick="location.href='${pageContext.request.contextPath }/TK_SanPhamDaBanController?type=nam&nam=0' "/>Thống kê theo năm</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="panel panel-back noti-box">
                        <div class="text-box" style="color: greenyellow">
                            <button style="color: #1a1b1c; background: #06f8c8; height: 150px; width: 200px; font-weight: bolder"
                                    onclick="location.href='${pageContext.request.contextPath }/TK_SanPhamDaBanController?type=thang&nam=0&thang=0' "/>Thống kê theo tháng</button>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <%--<div class="row">
                <div class="col-md-12">
                    <div>
                    </div>

                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading"></div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover"
                                       id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>ID </th>
                                        <th>Ảnh</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá bán</th>
                                        <th>Số lượng</th>
                                        <th>Doanh thu</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
    </div>
</div>
<script src="${url}/js/jquery-1.10.2.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<script src="${url}/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="${url}/js/dataTables/jquery.dataTables.js"></script>
<script src="${url}/js/dataTables/dataTables.bootstrap.js"></script>

<!-- CUSTOM SCRIPTS -->
<script src="${url}/js/custom.js"></script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</body>
</html>