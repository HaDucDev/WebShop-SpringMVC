<%--
  Created by IntelliJ IDEA.
  User: hungd
  Date: 6/3/2021
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%
    HttpSession data = request.getSession();
    String dataPoints = (String) data.getAttribute("data_nam");
%>

<html>
<head>
    <title>Doanh thu bán hàng theo năm</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form style="margin-left: 25px; margin-bottom: 10px" action="DT_NamController" method="get" enctype='multipart/form-data'>
    <label style="size: 20px" >Năm bắt đầu : </label>   &emsp;  <input  onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
                                                                        name="start" value="${start_year}" id="start" type="number" min="2015" style="display: inline"/> <br/> <br/>
    <label style="size: 20px" >Năm kết thúc : </label>   &emsp;  <input onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
                                                                        name="end" value="${end_year}" id="end" type="number" min="2015" style="display: inline"/> <span style="color: red">${error_tg}</span> <br/> <br/>
    <Button style="margin-left: 120px" type="submit">Tìm kiếm</Button>
</form>
<button  style="margin-left: 145px; margin-bottom: 30px; display: inline" onclick="location.href='${pageContext.request.contextPath }/views/admin/view/statistical.jsp'"/>Quay về</button>
<form style="display:inline; /*margin-left: 145px;*/ margin-bottom: 30px; /*margin-top: 10px*/" action="DT_NamController" method="post" enctype='multipart/form-data'>
    <input hidden name="year" id="start_year" value="${start_year}">
    <input hidden name="end_year" id="end_year" value="${start_year}">
    <Button type="submit">Xuất ra excel</Button>
</form>
<div id="chartContainer" style="height: 450px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">
    window.onload = function() {

        var chart = new CanvasJS.Chart("chartContainer", {
            title: {
                text: "Doanh thu theo từng năm từ : ${start_year} - ${end_year}"
            },
            axisX: {
                title: "Năm"
            },
            axisY: {
                title: "Doanh thu bán được (vnđ)",
                includeZero: true
            },
            data: [{
                type: "column",
                yValueFormatString: "#,##0 vnđ",
                dataPoints: <%out.print(dataPoints);%>
            }]
        });
        chart.render();
    }
</script>
</body>
</html>
