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
    <title>Thống kê sản phẩm đã bán : tháng ${tk_motnh} năm ${tk_year2}</title>
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
                    <h2>Thống kê sản phẩm đã bán : tháng ${tk_motnh} năm ${tk_year2}</h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <div class="row">
                <div class="col-md-12">
                    <div>
                        <form style="margin-left: 25px; margin-bottom: 25px; margin-top: 50px" action="TK_SanPhamDaBanController" method="get" enctype='multipart/form-data'>
                            <input hidden id="type" name="type" value="thang">
                            <label style="size: 20px" >Tháng : </label>   &emsp;  <input onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
                                                                                         name="thang" id="thang" type="number" min="1" max="12" value="${tk_motnh}" style="display: inline"/>
                            &nbsp <label style="size: 20px" >Năm : </label>   &emsp;  <input onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
                                                                                       name="nam" id="nam" type="number" min="2015" value="${tk_year2}" style="display: inline"/>
                            <Button type="submit">Tìm kiếm</Button>
                        </form>
                        <button style="margin-left: 90px; display: inline" onclick="location.href='${pageContext.request.contextPath }/TK_SanPhamDaBanController?type='"/>Quay về</button>
                        <button style="margin-left: 10px; display: inline" onclick="location.href='${pageContext.request.contextPath }/TK_SanPhamDaBanController?type=thang&nam=${tk_year2}&thang=${tk_motnh}&sort=giamdan'"/>Giảm dần</button>
                        <form style="margin-left: 90px; margin-bottom: 50px; margin-top: 25px" action="${pageContext.request.contextPath}/views/admin/view/excel_sanphamthang.jsp" method="post" enctype='multipart/form-data'>
                            <Button type="submit" value="submit">Xuất ra excel</Button>
                        </form>
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
                                    <c:forEach items="${data_month}" var="pro">
                                        <tr>
                                            <td>${pro.getKey().getId()}</td>
                                            <c:url value="/image/${pro.getKey().getImage()}" var="imgUrl"></c:url>
                                            <td ><img style="width: 100px;height: 100px;object-fit: cover" src="${imgUrl}"/></td>
                                            <td>${pro.getKey().getProName()}</td>
                                            <td>${pro.getKey().getPrice()}</td>
                                            <td>${pro.getValue()/pro.getKey().getPrice()}</td>
                                            <td>${pro.getValue()}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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