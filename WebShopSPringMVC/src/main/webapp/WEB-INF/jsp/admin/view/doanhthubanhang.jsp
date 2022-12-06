<%--
  Created by IntelliJ IDEA.
  User: hungd
  Date: 6/3/2021
  Time: 2:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%
    HttpSession data = request.getSession();
    String dataPoints = (String) data.getAttribute("dataPoints");
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>Doanh thu bán hàng theo tháng</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form style="margin-left: 25px; margin-bottom: 25px; margin-top: 50px" action="DT_ThangController" method="get" enctype='multipart/form-data'>
    <label style="size: 20px" >Năm : </label>   &emsp;  <input onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
                                                               name="n" id="n" type="number" min="2015" value="${year}" style="display: inline"/>
    <Button type="submit">Tìm kiếm</Button>
</form>
<button style="margin-left: 90px" onclick="location.href='${pageContext.request.contextPath }/views/admin/view/statistical.jsp'"/>Quay về</button>
<form style="margin-left: 90px; margin-bottom: 50px; margin-top: 25px" action="DT_ThangController" method="post" enctype='multipart/form-data'>
    <input hidden name="year" id="year" value="${year}">
    <Button type="submit" name="year" value="${year}">Xuất ra excel</Button>
</form>
<div id="chartContainer" style="height: 400px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<%--<script>
    function TimKiem(){
        var year = document.getElementById("sl_sanpham").value;
        alert("Biểu đồ doanh thu theo tháng của năm " + year);
    }
</script>--%>
<script type="text/javascript">
    window.onload = function () {
        var chart = new CanvasJS.Chart("chartContainer", {
            theme: "light2",
            title: {
                text: "Doanh thu bán hàng theo tháng của năm : ${year}"
            },
            axisX: {
                title: "Tháng"
            },
            axisY: {
                title: "Doanh thu bán được (vnđ)",
                includeZero: true
            },
            data: [{
                type: "line",
                yValueFormatString: " #,##0 (vnđ)",
                dataPoints : <%out.print(dataPoints);%>
            }]
        });
        chart.render();
    }
</script>
</body>
</html>
