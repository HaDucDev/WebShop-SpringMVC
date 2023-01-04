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
<div >
    <style>
        .dataTables_wrapper   .dataTables_filter{
            float: left
        }

        .dataTables_wrapper  .dataTables_length{
            float: right
        }
    </style>
    <div class="col-md-12 text-center">
        <h2>Lịch sử đơn hàng</h2>
    </div>
    <div  style="width:80%; margin: auto">
        <table id="example" class="table table-striped table-bordered" style="width:100%">
            <thead>
            <tr>
                <th>ID</th>
                <th>Ngày tạo</th>
                <th>Tình trạng đơn hàng</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${userOrderList}" var="order">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.createdDate}</td>
                    <td class="center">${order.statusOrder}</td>
                    <td>
                        <a class="center"
                           href="<c:url value="/user/order-detail/${order.id}"/>">Chi
                            tiết</a>
                        <c:if test="${order.statusOrder.equals('Đang chờ')}">
                            |
                            <a id="btnDelete" onclick="deleteCart(${order.id })" style="cursor: pointer"
                               class="center">Hủy đơn</a> |
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
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