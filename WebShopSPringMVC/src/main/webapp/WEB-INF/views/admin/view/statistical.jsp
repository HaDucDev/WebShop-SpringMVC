<%--
  Created by IntelliJ IDEA.
  User: hungd
  Date: 6/3/2021
  Time: 2:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:url value="/views/admin/static" var="url"></c:url>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Thống kê</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- BOOTSTRAP STYLES-->
    <link href="${url}/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="${url}/css/font-awesome.css" rel="stylesheet" />
    <!-- MORRIS CHART STYLES-->
    <link href="${url}/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="${url}/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans'
          rel='stylesheet' type='text/css' />
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
                    <h2>Thống kê</h2>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="panel panel-back noti-box">
                        <div class="text-box" style="color: greenyellow">
                            <button style="color: #1a1b1c; background: #eadf05; height: 150px; width: 200px; font-weight: bolder"
                                    onclick="location.href='${pageContext.request.contextPath }/DT_ThangController?n='"/>Doanh thu bán hàng theo tháng</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="panel panel-back noti-box">
                        <div class="text-box" style="color: greenyellow">
                            <button style="color: #ecec11; background: #0551ea; height: 150px; width: 200px; font-weight: bolder"
                                    onclick="location.href='${pageContext.request.contextPath }/DT_NamController?start=&end='"/>Doanh thu bán hàng theo năm</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="panel panel-back noti-box">
                        <div class="text-box" style="color: greenyellow">
                            <button style="color: #1a1b1c; background: #14ea05; height: 150px; width: 200px; font-weight: bolder"
                                    onclick="location.href='${pageContext.request.contextPath }/TK_SanPhamDaBanController?type='"/>Sản phẩm đã bán</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="${url}/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="${url}/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="${url}/js/jquery.metisMenu.js"></script>
<!-- MORRIS CHART SCRIPTS -->
<script src="${url}/js/morris/raphael-2.1.0.min.js"></script>
<script src="${url}/js/morris/morris.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="${url}/js/custom.js"></script>
</body>
</html>
