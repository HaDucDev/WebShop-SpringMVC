<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 1/5/2023
  Time: 8:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<c:url value="/admin" var="url"></c:url>
<%--<c:url value="/admin-product-list" var="PCurl"></c:url>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Product Management</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="${url}/css/bootstrap.css" rel="stylesheet"/>
    <script src="${url}/js/bootstrap.min.js"></script>
    <!-- FONTAWESOME STYLES-->
    <link href="${url}/css/font-awesome.css" rel="stylesheet"/>
    <link href="${url}/css/custom.css" rel="stylesheet"/>
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans'
          rel='stylesheet' type='text/css'/>
    <!-- TABLE STYLES-->
    <link href="${url}/js/dataTables/dataTables.bootstrap.css"
          rel="stylesheet"/>
    <script src="${url}/js/jquery-1.10.2.js"></script>
    <script src="${url}/js/jquery-3.3.1.min.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <!-- METISMENU SCRIPTS -->
    <script src="${url}/js/jquery.metisMenu.js"></script>
    <!-- DATA TABLE SCRIPTS -->
    <script src="${url}/js/dataTables/jquery.dataTables.js"></script>
    <script src="${url}/js/dataTables/dataTables.bootstrap.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="${url}/js/custom.js"></script>
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
                    <h2>Thống kê sản phẩm theo danh mục</h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr/>
            <div class="row">
                <div class="col-md-12">
                    <div class="btn-group" style="margin: auto;display: flex;justify-content: center; align-items: center;border: 1px solid green;">
                        <button type="button" class="btn btn-primary" style="margin-right: 5px" onclick="window.location='<c:url value="/admin/order-list-all"/> '">Thống kê sản phẩm theo danh mục</button>
                        <button type="button" class="btn btn-primary" style="margin-right: 5px">Thống kê doanh thu theo từng sản phẩm</button>
                        <button type="button" class="btn btn-primary">Thống kê doang thu theo thời gian</button>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover"
                                       id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>Mã danh mục</th>
                                        <th>Tên danh mục </th>
                                        <th>Số lượng sản phẩm</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${cateStats}" var="c">
                                        <tr>
                                            <td>${c[0]}</td>
                                            <td>${c[1]}</td>
                                            <td>${c[2]}</td>
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
    <!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER  -->
<!-- /. WRAPPER  -->
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>

</body>
</html>
