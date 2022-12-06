<%--
  Created by IntelliJ IDEA.
  User: hungd
  Date: 4/21/2021
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<c:url value="/api-admin-product" var="APIurl"></c:url>
<c:url value="/admin-warehouse_receipt-list" var="PCurl"></c:url>
<c:url value="/views/admin/static" var="url"></c:url>
<c:url value="/add_goodreceived" var="path1"></c:url>
<c:url value="/add_pro_good" var="path2"></c:url>

<script src="./Validation.js"></script>
<!DOCTYPE html>
<html>
<head>
    <script src="<c:url value="/ckeditor/ckeditor.js" />"></script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thêm phiếu nhập hàng</title>
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
                    <h2>Thêm phiếu nhập hàng</h2>
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
                                    <h3>Nhập thông tin phiếu nhập hàng</h3>
                                    <form role="form" action="add_goodreceived" method="post" enctype="multipart/form-data">
                                        <div class="form-group" style="display:inline;">
                                            <div class="col-md-6">
                                                <label>Tên nhà cung cấp</label>
                                                <div class="checkbox">
                                                    <select name="supplierId" id="supplierId">
                                                        <c:forEach items="${lstSupplier}" var="c">
                                                            <option value='${c.id}'>${c.nameSupplier}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <label >Mô tả đơn hàng </label>
                                                <br>
                                                <textarea rows="4" cols="50" name="editer" id="editer" ></textarea>
                                            </div>
                                        </div>

                                        <div class="table-responsive" style="width: max-content; margin-top: 20px">
                                            <table class="table table-striped table-bordered table-hover" id="data-table">
                                                <input hidden value="0" id="sl_sanpham">
                                                <thead>
                                                <tr>
                                                    <%--                                                    <th style="display:none;">Mã sản phẩm </th>--%>
                                                    <th>Tên sản phẩm</th>
                                                    <th>Số lượng</th>
                                                    <th>Giá sản phẩm (vnđ)</th>
                                                    <th>Tổng giá trị (vnđ)</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <%--                                                <c:forEach items="${hangnhaps}" var="hangnhap">--%>
                                                <%--                                                    <tr>--%>
                                                <%--                                                        <td>2</td>--%>
                                                <%--                                                        <td>${hangnhap.getMaMatHang()}</td>--%>
                                                <%--                                                        <td>${hangnhap.getTenMatHang()}</td>--%>
                                                <%--                                                        <td>${hangnhap.getSoluong()}</td>--%>
                                                <%--                                                        <td>${hangnhap.getGiaTri()}</td>--%>
                                                <%--                                                        <td><button type="button" class="btn btn-primary float-right" onclick="DeleteRow()">Xóa</button></td>--%>
                                                <%--                                                    </tr>--%>
                                                <%--                                                </c:forEach>--%>
                                                <tr>
                                                    <%--                                                    <td style="display:none;" ><input type="text" class="form-control" id="idsanpham" readonly></td>--%>
                                                    <td>
                                                        <select name="proId" id="proId" style="width: 290px;">
                                                            <c:forEach items="${lstProduct}" var="c">
                                                                <option value="${c.id}+${c.proName}+${c.quantity}+${c.price}">${c.proName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    <%--                                                    <td><input type="text" class="form-control" id="tensanpham"></td>--%>
                                                    <td><input type="text" class="form-control" id="soluong"></td>
                                                    <td><input type="text" class="form-control" id="giasanpham" readonly></td>
                                                    <td><input type="text" class="form-control" id="tongiatri" readonly></td>
                                                    <td>
                                                        <button id="addRow" type="button" style="border-radius: 5px; border: none; background-color: white; color: black" class="btn btn-primary float-right">Thêm</button>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <button type="button" class="btn btn-primary" onclick="Back()">Quay lại trang trước</button>
                                        <button type="button" id="btnAdd" class="btn btn-primary" >Thêm</button>
                                        <button type="reset" class="btn btn-primary" onclick="window.location.href ='${PCurl}?type=add'">Reset</button>
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

    function Back(){
        history.back();
    }

    $('#btnAdd').click(function (e){
        e.preventDefault();
        if (parseInt(document.getElementById("sl_sanpham").value) <= 0){
            alert("Yêu cầu chọn sản phẩm cho phiếu nhập !");
            return false;
        }
        var content_editter = document.getElementById("editer").value;
        var supplierId = document.getElementById("supplierId").value;
        var myVar = JSON.stringify({
            supplierEntity:{
                id:supplierId
            },
            note:content_editter
        });
        $.ajax({
            url: '${path1}',
            type: 'POST',
            enctype: 'multipart/form-data',
            processData:false,
            contentType: 'application/json',
            data: myVar,
            dataType: 'json',
            success: function (result){
                console.log("Luu thanh cong");
                window.location.href = "${pageContext.request.contextPath}/admin-warehouse_receipt-list?type=list";
            },
            errMode: function (error){
                console.log("Error");
            }
        });
    });
    $('#addRow').click(function (e){
        //Lay gia tri hang duoc chon
        var sanpham = document.getElementById("proId").value;
        var arr_data = sanpham.split('+',4);
        var soluong = document.getElementById("soluong").value;
        if (soluong == ""){
            alert("yêu cầu nhập số lượng sản phẩm !");
            return false;
        }
        if (soluong <= 0 ){
            alert("yêu cầu nhập số lượng sản phẩm lớn hơn 0 !");
            return false;
        }

        var myVar = JSON.stringify({
            productEntity:{
                id: arr_data[0],
                proName: arr_data[1],
                price : arr_data[3]
            },
            quantity: soluong});

        $.ajax({
            url: '${path2}',
            type: 'POST',
            enctype: 'multipart/form-data',
            processData:false,
            contentType: 'application/json',
            data: myVar,
            dataType: 'json',
            success: function (result){
                var sl_hientai = parseInt(document.getElementById("sl_sanpham").value);
                document.getElementById("sl_sanpham").value= sl_hientai + 1;
                var table = document.getElementById("data-table");
                var index = table.rows.length - 1;

                row = table.insertRow(index);
                cell1 = row.insertCell(0);
                cell2 = row.insertCell(1);
                cell3 = row.insertCell(2);
                cell4 = row.insertCell(3);
                cell5 = row.insertCell(4);

                cell1.innerHTML = arr_data[1];
                cell2.innerHTML = soluong;
                cell3.innerHTML = arr_data[3];
                cell4.innerHTML = arr_data[3] * soluong;
                cell5.innerHTML = '<button type="button" class="btn btn-primary float-right" onclick="DeleteRow(this);">Xóa</button>';
                document.getElementById("soluong").value = "";
            },
            errMode: function (error){
                console.log("Error");
            }
        });
    });

    function DeleteRow(r) {
        var row = r.parentElement.parentElement;
        var quantity = row.childNodes[1].innerText;
        var proName = row.childNodes[0].innerText;
        var myVar = JSON.stringify({
            productEntity:{
                proName : proName
            },
            quantity: quantity});

        $.ajax({
            url: '${path2}',
            type: 'Delete',
            enctype: 'multipart/form-data',
            processData:false,
            contentType: 'application/json',
            data: myVar,
            dataType: 'json',
            success: function (result){
                var sl_hientai = parseInt(document.getElementById("sl_sanpham").value);
                document.getElementById("sl_sanpham").value= sl_hientai - 1;
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




