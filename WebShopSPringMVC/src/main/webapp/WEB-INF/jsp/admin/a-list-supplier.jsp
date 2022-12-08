<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:url value="/admin" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Supplier Admin</title>
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
    <jsp:include page="nav-bar.jsp"></jsp:include>
    <!-- /. NAV TOP  -->
    <jsp:include page="slide-bar.jsp"></jsp:include>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>Danh sách nhà cung cấp</h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <div class="row">
                <div class="col-md-12">
                    <div>
                        <button class="btn btn-danger square-btn-adjust" style="margin-bottom: 5px"><a href='<c:url value="/admin/supplier/add"/>' style="color: white">Thêm nhà cung cấp</a></button>
                    </div>
                    <style>
                        .tablecenterCSS td{
                            text-align:center;
                        }
                        .tablecenterheadCSS th{
                            text-align:center;
                        }
                    </style>
                    <!-- Advanced Tables -->
                    <c:if test="${msg != null}">
                        <div class="alert alert-danger">${msg}</div>
                    </c:if>
                    <div class="panel panel-default">
                        <div class="panel-heading"></div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="tablecenterCSS tablecenterheadCSS table table-striped table-bordered table-hover"
                                       id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>Mã nhà cung cấp</th>
                                        <th>Tên nhà cung cấp</th>
                                        <th>Logo</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${supplierList}" var="supplier" >
                                        <tr class="odd gradeX">
                                            <td>${supplier.id}</td>
                                            <td>${supplier.supplierName}</td>

                                            <td>
                                                <c:choose>
                                                    <c:when test="${supplier.logoImage != null}">
                                                        <img style="width: 100px;height: 100px;object-fit: cover" src="<c:url value="${supplier.logoImage}"/>" alt="${supplier.supplierName}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img style="width: 100px;height: 100px;object-fit: cover" src="<c:url value="/images/Rayquaza.png"/>" alt="${supplier.supplierName}">
                                                    </c:otherwise>
                                                </c:choose>

                                            </td>
                                            <td>
                                                <button style="width: 70px;">
                                                    <a href="<c:url value="/admin/supllier/edit/${supplier.id}"/>"
                                                       class="center">Xem/Sửa</a>
                                                </button>
                                                |
                                                <button id="btnDelete" type ="button" onclick = ""
                                                        class="center">Xóa
                                                </button>
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
<!-- /. PAGE WRAPPER  -->
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="${url}/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="${url}/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="${url}/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="${url}/js/dataTables/jquery.dataTables.js"></script>
<script src="${url}/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function() {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- CUSTOM SCRIPTS -->
<script src="${url}/js/custom.js"></script>

</body>
</html>