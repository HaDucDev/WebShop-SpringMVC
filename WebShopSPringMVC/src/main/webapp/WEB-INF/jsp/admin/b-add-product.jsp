<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/admin" var="url"></c:url>
<%--<c:url value="/admin-product-list" var="PCurl"></c:url>--%>
<script src="./Validation.js"></script>
<!DOCTYPE html>
<html>
<head>
    <script src="<c:url value="${url}/ckeditor/ckeditor.js" />"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Edit User</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="${url}/css/bootstrap.css" rel="stylesheet"/>
    <!-- FONTAWESOME STYLES-->
    <link href="${url}/css/font-awesome.css" rel="stylesheet"/>
    <!-- CUSTOM STYLES-->
    <link href="${url}/css/custom.css" rel="stylesheet"/>
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans'
          rel='stylesheet' type='text/css'/>
    <link href="comp">
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
                    <h2>Thêm sản phẩm</h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr/>
            <div class="row">
                <div class="col-md-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading"></div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3>Nhập thông tin sản phẩm</h3>
                                    <c:url value="/admin/product/add" var="action"/>
                                    <form:form role="form" action="${action}" method="post" id="myform"
                                               modelAttribute="product"
                                               enctype='multipart/form-data'>

                                        <div class="form-group">
                                            <label for="logo">Ảnh sản phẩm:</label>
                                            <form:input type="file" path="productFile" class="form-control"
                                                        name="image" id="logo"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="productName">Tên sản phẩm</label>
                                            <form:input path="productName" class="form-control"
                                                        placeholder="Nhập tên sản phẩm" name="productName"
                                                        id="productName"/>
                                        </div>

                                        <div class="form-group">
                                            <label for="quantity">Số lượng</label>
                                            <form:input path="quantity"  class="form-control" min="0"
                                                   onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
                                                   placeholder="Nhập số lượng sản phẩm"
                                                   type="number" name="quantity" id="quantity"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="price">Giá (VNĐ)</label>
                                            <form:input path="unitPrice" value="${price}" class="form-control" min="0"
                                                        onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
                                                        placeholder="Nhập giá sản phẩm" type="number" name="price"
                                                        id="price"/>
                                        </div>

                                        <div class="form-group">
                                            <label for="discount">Giảm giá (%)</label>
                                            <form:input path="discount" value="${price}" class="form-control" min="0"
                                                        onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
                                                        placeholder="Nhập giá sản phẩm" type="number" name="discount"
                                                        id="discount"/>
                                        </div>

                                        <div class="form-group">
                                            <label>Mô tả sản phẩm </label>
                                            <br>
                                            <form:textarea path="descriptionProduct" rows="4" cols="50" name="ckeditor" id="ckeditor"></form:textarea>
                                        </div>

                                        <div class="form-group">
                                            <label for="cate">Loại sản phẩm</label>
                                            <div class="checkbox">
                                                <form:select path="category" name="detailCateId" id="cate">
                                                    <c:forEach items="${cateList}" var="c">
                                                        <option value="${c.id}">${c.name}</option>
                                                    </c:forEach>
                                                </form:select>
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label for="su">Nhà sản xuất</label>
                                            <div class="checkbox">
                                                <form:select path="supplier" name="brandId" id="su">
                                                    <c:forEach items="${supplierList}" var="s">
                                                        <option value="${s.id}">${s.supplierName}</option>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="su1">Trạng thái sản phẩm</label>
                                            <div class="checkbox">
                                                <form:select path="productstatus" name="productStatust" id="su1">
                                                    <c:forEach items="${productStatusList}" var="ps">
                                                        <c:if test = "${product.productstatus.id != ps.id}">
                                                            <c:if test = "${ps.id == 1}">
                                                                <option value="${ps.id}">Còn hàng</option>
                                                            </c:if>
                                                            <c:if test = "${ps.id == 2}">
                                                                <option value="${ps.id}">Hết hàng</option>
                                                            </c:if>
                                                        </c:if>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                        </div>
                                        <button type="submit" id="btnAdd" class="btn btn-default">Thêm</button>
                                        <button type="reset" class="btn btn-primary"
                                                onclick="window.location.href ='${PCurl}'">Reset
                                        </button>
                                    </form:form>
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


<%--	<script type="text/javascript" language="javascript">--%>
<%--   CKEDITOR.replace('ckeditor', {width: '700px',height: '300px'});--%>
<%--</script>--%>
<script>

</script>
</body>
</html>