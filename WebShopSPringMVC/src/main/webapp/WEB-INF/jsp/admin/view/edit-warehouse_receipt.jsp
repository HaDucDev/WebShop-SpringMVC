<%--
  Created by IntelliJ IDEA.
  User: hungd
  Date: 5/29/2021
  Time: 7:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:url value="/api-admin-product" var="APIurl"></c:url>
<c:url value="/admin-warehouse_receipt-list" var="PCurl"></c:url>
<c:url value="/views/admin/static" var="url"></c:url>
<c:url value="/add_goodreceived" var="path1"></c:url>
<c:url value="/add_pro_good" var="path2"></c:url>
<c:url value="/detail_goodreceived" var="path3"></c:url>

<script src="./Validation.js"></script>
<!DOCTYPE html>
<html>
<head>
    <script src="<c:url value="/ckeditor/ckeditor.js" />"></script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thông tin phiếu nhập hàng</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="${url}/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="${url}/css/font-awesome.css" rel="stylesheet" />
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
                    <h2>Thông tin phiếu nhập hàng</h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <div class="row">
                <div class="col-md-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading"></div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3>Thông tin phiếu nhập hàng</h3>
                                    <form role="form" action="add_goodreceived" method="post" enctype="multipart/form-data">

                                        <div class="form-group" style="display:inline;">
                                            <div class="col-md-6">
                                                <label>Tên nhà cung cấp</label>
                                                <div class="checkbox">
                                                    <select name="supplierId" id="supplierId" readonly="true">
                                                        <c:forEach items="${lstSupplier}" var="c" >
                                                            <option readonly="true" value='${c.id}' ${phieunhap.getSupplierEntity().getId() == c.id ? "selected" : ""}>${c.nameSupplier}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <label >Mô tả đơn hàng </label>
                                                <br>
                                                <textarea rows="4" cols="50" name="editer" id="editer" readonly>${phieunhap.getNote()}</textarea>
                                            </div>
                                        </div>

                                        <div class="table-responsive" style="width: max-content; margin-top: 20px">
                                            <table class="table table-striped table-bordered table-hover" id="data-table">
                                                <thead>
                                                <tr>
                                                    <%--                                                    <th style="display:none;">Mã sản phẩm </th>--%>
                                                    <th>Tên sản phẩm</th>
                                                    <th>Số lượng</th>
                                                    <th>Giá sản phẩm (vnđ)</th>
                                                    <th>Tổng giá trị (vnđ)</th>
                                                    <th>Tình trạng</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listhangnhap}" var="hangnhap">
                                                    <tr>
                                                        <td>${hangnhap.getProductEntity().getProName()}</td>
                                                        <td style="width: 160px;"> ${hangnhap.getQuantity()} </td>
                                                        <td>${hangnhap.getProductEntity().getPrice()}</td>
                                                        <td>${hangnhap.getQuantity() * hangnhap.getProductEntity().getPrice()}</td>
                                                        <td style="width: 105px;">
                                                            <c:if test="${hangnhap.getStatus() == 1}">
                                                                <c:out value="Chưa nhập" />
                                                            </c:if>
                                                            <c:if test="${hangnhap.getStatus() == 0}">
                                                                <c:out value="Đã nhập" />
                                                            </c:if>
                                                        </td>
                                                        <td style="width: 118px">
                                                            <c:if test="${hangnhap.getStatus() == 1}">
                                                                <button type="button" class="center" onclick="NhapHang(this,${phieunhap.getId()},${hangnhap.getProductEntity().getId()},${hangnhap.getQuantity()})">
                                                                    Nhập hàng</button>
                                                            </c:if>
                                                        </td>
                                                            <%--<td>
                                                                <button  type ="button" onclick="Update(this,${phieunhap.getId()},${hangnhap.getProductEntity().getId()},${hangnhap.getProductEntity().getPrice()}
                                                                        ,${hangnhap.getQuantity()})" class="center">Cập nhật</button>

                                                                <button  type ="button" onclick="DeleteRow(this,${phieunhap.getId()},${hangnhap.getProductEntity().getId()},${hangnhap.getProductEntity().getPrice()}
                                                                         ,${hangnhap.getQuantity()})" class="center">Xóa</button>
                                                            </td>--%>
                                                    </tr>
                                                </c:forEach>
                                                <%--<tr>
                                                    <td>
                                                        <select name="proId" id="proId" style="width: 290px;">
                                                            <c:forEach items="${lstProduct}" var="c">
                                                                <option value="${c.id}+${c.proName}+${c.quantity}+${c.price}">${c.proName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    <td><input type="text" class="form-control" id="soluong"></td>
                                                    <td><input type="text" class="form-control" id="giasanpham" readonly></td>
                                                    <td><input type="text" class="form-control" id="tongiatri" readonly></td>
                                                    <td>
                                                        <button id="addRow" type="button" style="border-radius: 5px; border: none; background-color: white; color: black" class="btn btn-primary float-right">Thêm</button>
                                                    </td>
                                                </tr>--%>
                                                </tbody>
                                            </table>
                                        </div>

                                        <%--<button type="button" id="btnAdd" class="btn btn-default">Cập nhật</button>--%>
                                        <a href='<c:url value="/admin-warehouse_receipt-list?type=list"/>'><button type="button" class="btn btn-primary">Quay lại trang trước</button></a>
                                        <%--<button type="reset" class="btn btn-primary">Reset</button>--%>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Form Elements -->
                </div>
            </div>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="${url}/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="${url}/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="${url}/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="${url}/js/custom.js"></script>
<script type="text/javascript" language="javascript">
    CKEDITOR.replace('ckeditor', {width: '700px',height: '300px'});
</script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>

    function NhapHang(r,id_phieunhap, id_sanpham, quantity){
        var row = r.parentElement.parentElement;
        var id_phieunhap = id_phieunhap;
        var id_sanpham = id_sanpham;
        var quantity = quantity;
        var myVar = {
            goodsReceivedEntity : {
                id : id_phieunhap
            },
            productEntity : {
                id : id_sanpham
            },
            quantity : quantity
        }
        $.ajax({
            url: '${path3}',
            type: 'POST',
            enctype: 'multipart/form-data',
            processData:false,
            contentType: 'application/json',
            data: JSON.stringify(myVar),
            dataType: 'json',
            success: function (result){
                alert(result);
                row.cells[4].innerHTML = "Đã nhập"
                row.cells[5].innerHTML = "";
            },
            errMode: function (error){
                alert("Nhập hàng thất bại !");
            }
        });
    }

    function DeleteRow(r,id_phieu,id_hangnhap,price,quantity) {
        var row = r.parentElement.parentElement;
        var myVar = JSON.stringify({
            goodsReceivedEntity:{
                id : id_phieu
            },productEntity : {
                id : id_hangnhap,
                price : price,
            },
            quantity : quantity
        });
        $.ajax({
            url: '${path3}',
            type: 'Delete',
            enctype: 'multipart/form-data',
            processData:false,
            contentType: 'application/json',
            data: myVar,
            dataType: 'json',
            success: function (result){
                document.getElementById("data-table").deleteRow(row.rowIndex);
            },
            errMode: function (error){
                console.log("Error");
            }
        });
    }
</script>
</body>
</html>
