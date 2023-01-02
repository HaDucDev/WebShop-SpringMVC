<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<c:url value="/admin" var="url"></c:url>
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
                    <h2>Chi tiết đơn hàng ${orderDetal.id}</h2>
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-4">
                            <div class="login-form">
                                <div class="form-group">
                                    <label for="name">Tên người nhận</label>
                                    <input id="name" name="receiptUser" type="text" class="form-control" readonly
                                           value="${orderDetal.receiptUser}"/>
                                    <span class="form-message"></span>
                                </div>
                                <div class="form-group">
                                    <label for="address">Địa chỉ nhận</label>
                                    <input id="address" name="deliveryAddress" type="text" class="form-control" readonly
                                           value="${orderDetal.deliveryAddress}"/>
                                    <span class="form-message"></span>
                                </div>
                                <div class="form-group">
                                    <label for="sdt">Số điện thoại</label>
                                    <input id="sdt" name="phoneNumber" type="number" class="form-control" readonly
                                           value="${orderDetal.phoneNumber}"/>
                                    <span class="form-message"></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-1" style="border-left: solid 1px #333 "></div>
                        <div class="col-md-5">
                            <div class="col-md-8">
                                <h5>Tình trạng thanh toán</h5>
                                <div class="form-group">
                                    <input id="sdt1" name="phoneNumber" type="text" class="form-control" readonly
                                           value="${orderDetal.paymentStatus}"/>
                                </div>
                                <h5>Tình trạng đơn hàng</h5>
                                <div class="form-group">
                                    <input id="sdt2" name="phoneNumber" type="text" class="form-control" readonly
                                           value="${orderDetal.statusOrder}"/>
                                </div>
                            </div>
                        </div>
                    </div>
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
                                        <th>Mã sản phẩm</th>
                                        <th>tên sản phẩm</th>
                                        <th>Ảnh sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Giá sản phẩm</th>
                                        <th>Giảm giá</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${orderDetal.orderDetails}" var="orderDetal1">
                                        <tr>
                                            <td>#${orderDetal1.product.id}</td>
                                            <td>${orderDetal1.product.productName}</td>

                                            <td>
                                                <c:choose>
                                                    <c:when test="${orderDetal1.product.productImage != null}">
                                                        <img style="width: 40px;height: 40px;object-fit: cover"
                                                             src="<c:url value="${orderDetal1.product.productImage}"/>"
                                                             alt="${orderDetal1.product.productName}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img style="width: 40px;height: 40px;object-fit: cover"
                                                             src="<c:url value="/images/Rayquaza.png"/>"
                                                             alt="$orderDetal1.product.productName}">
                                                    </c:otherwise>
                                                </c:choose>

                                            </td>
                                            <td>${orderDetal1.quantity}</td>
                                            <td>${orderDetal1.product.unitPrice}</td>
                                            <td>${orderDetal1.product.discount}%</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tr>
                                        <td class="no-line"></td>
                                        <td class="no-line"></td>
                                        <td class="no-line"></td>
                                        <td class="no-line"></td>
                                        <td class="no-line">Tổng tiền</td>
                                        <td class="no-line text-right">${orderDetal.totalAmount}VND</td>
                                    </tr>
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