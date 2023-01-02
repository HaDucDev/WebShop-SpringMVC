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
                                        <th>Người nhận</th>
                                        <th>Tài khoản đặt hàng</th>
                                        <th>Địa chỉ nhận</th>
                                        <th>Số điện thoại</th>
                                        <th>Tổng tiền</th>
                                        <th>Tình trạng thanh toán</th>
                                        <th>Tình trạng đơn hàng</th>
                                        <th>Hành động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${orderList}" var="order">
                                        <tr>
                                            <td>#${order.id}</td>
                                            <td>${order.createdDate}</td>
                                            <td>${order.receiptUser}</td>
                                            <td>${order.user.fullName}</td>
                                            <td>${order.deliveryAddress}</td>
                                            <td>${order.phoneNumber}</td>
                                            <td>${order.totalAmount} VNĐ</td>
                                            <td>${order.paymentStatus}</td>
                                            <td class="center">${order.statusOrder}</td>
                                            <td>
                                                <a class="center" data-toggle="modal" data-target="#oderlist${order.id}">Chi
                                                    tiết</a> |
                                                <a id="btnDelete" onclick="deleteCart(${order.id })"
                                                   class="center">Hủy đơn hàng</a> |
                                                <a class="center" onclick="updateCart(${order.id})">Chấp nhận đơn hàng</a>
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
            <c:forEach items="${lstCart}" var="cart">
                <div class="modal fade" id="oderlist${cart.id}">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Chi tiết đơn hàng</h4>
                            </div>
                            <div class="modal-body">
                                <table class="table table-condensed">
                                    <thead>
                                    <tr class="cart_menu">
                                        <td class="image">Ảnh</td>
                                        <td class="description">Tên Sản Phẩm</td>
                                        <td class="price">Giá</td>
                                        <td class="quantity">Số Lượng</td>
                                        <td class="total">Tổng Tiền</td>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${cart.getProductCartEntityList()}" var="item">
                                        <tr>
                                            <c:url value="/image/${item.getProductEntity().getImage()}"
                                                   var="imgUrl"></c:url>
                                            <td class="cart_product">
                                                <img style="width: 50px;height: 50px;object-fit: cover" src="${imgUrl}"
                                                     alt="#">
                                            </td>
                                            <td class="description">${item.getProductEntity().getProName()}</td>
                                                <%--												<td class="price">${item.getUnitPrice()}<span>VNĐ</span></td>--%>
                                            <td><fmt:formatNumber type="number" value="${item.getUnitPrice()}"/> VNĐ
                                            </td>

                                            <td class="quantity">${item.getQuantity()}</td>
                                                <%--												<td class="total">${item.getUnitPrice()*item.getQuantity()}<span>VNĐ</span></td>--%>
                                            <td><fmt:formatNumber type="number"
                                                                  value="${item.getUnitPrice()*item.getQuantity()}"/>
                                                VNĐ
                                            </td>

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-dismiss="modal">OK</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end modal -->
            </c:forEach>
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
<%--<script>--%>

<%--	function deleteCart(data){--%>
<%--		$.ajax({--%>
<%--			url: '${APIUrl}',--%>
<%--			type: 'DELETE',--%>
<%--			enctype: 'multipart/form-data',--%>
<%--			processData:false,--%>
<%--			contentType: 'application/json',--%>
<%--			data:JSON.stringify(data),--%>
<%--			dataType: 'json',--%>
<%--			success: function (result){--%>
<%--				console.log("Success");--%>
<%--				window.location.href = "${CCUrl}?type=list";--%>
<%--			},--%>
<%--			error: function (error){--%>
<%--				console.log("Error");--%>
<%--			}--%>
<%--		})--%>
<%--	}--%>

<%--	function updateCart(data){--%>
<%--		$.ajax({--%>
<%--			url: '${APIUrl}',--%>
<%--			type: 'PUT',--%>
<%--			enctype: 'multipart/form-data',--%>
<%--			processData:false,--%>
<%--			contentType: 'application/json',--%>
<%--			data:JSON.stringify(data),--%>
<%--			dataType: 'json',--%>
<%--			success: function (result){--%>
<%--				console.log("Success");--%>
<%--				window.location.href = "${CCUrl}?type=list";--%>
<%--			},--%>
<%--			error: function (error){--%>
<%--				console.log("Error");--%>
<%--			}--%>
<%--		})--%>
<%--	}--%>
<%--</script>--%>
</body>
</html>