<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 1/4/2023
  Time: 11:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<c:url value="/user" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Management</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="${url}/css/tableorderuser/bootstrap.css" rel="stylesheet"/>
    <!-- FONTAWESOME STYLES-->
    <link href="${url}/css/tableorderuser/jquery.dataTables.min.css" rel="stylesheet"/>
    <!-- MORRIS CHART STYLES-->
    <link href="${url}/css/tableorderuser/ok.css" rel="stylesheet"/>
    <!-- CUSTOM STYLES-->
    <script src="${url}/css/tableorderuser/jquery-3.5.1.js"></script>
    <script src="${url}/css/tableorderuser/jquery.dataTables.min.js"></script>
    <script src="${url}/css/tableorderuser/dataTables.bootstrap4.min.js"></script>
</head>
<body>
<jsp:include page="a-header.jsp"></jsp:include>
<div>
    <div  style="width:80%; margin: auto">
        <div class="row">
            <div class="col-md-12">
                <div class="text-center"><h2>Chi tiết đơn hàng ${orderDetal.id}</h2></div>
                <div style="float: left">
                    <button type="button" class="btn btn-primary" onclick="history.back()" style="background: #0000cc">Trở lại trang quản lý đơn hàng</button>
                </div>
            </div>
            <div class="col-md-10" style="border-bottom: 1px solid #1b1e21; margin: auto">
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
        <table id="example" class="table table-striped table-bordered" style="width:100%">
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
            <tfoot>
            <tr>
                <th class="no-line"></th>
                <th class="no-line"></th>
                <th class="no-line"></th>
                <th class="no-line"></th>
                <th class="no-line">Tổng tiền</th>
                <th class="no-line text-right">${orderDetal.totalAmount}VND</th>
            </tr>
            </tfoot>
        </table>


    </div>

    <jsp:include page="a-footer.jsp"></jsp:include>

    <script>
        $(document).ready(function () {
            $('#example').DataTable();
        });
    </script>
</body>
</html>
