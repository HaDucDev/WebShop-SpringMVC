<%@ page import="java.util.List" %>
<%@ page import="com.website.models.view.DT_ThangView" %>
<%@ page import="com.website.models.Product_Cart_Entity" %>
<%@ page import="com.website.models.ProductEntity" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: hungd
  Date: 6/3/2021
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <%--    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">--%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thống kê sản phẩm đã bán : tháng ${tk_motnh} năm ${tk_year2} </title>
</head>
<body>
<h1>Thống kê sản phẩm đã bán : tháng ${tk_motnh} năm ${tk_year2} </h1>
<table cellpadding="1"  cellspacing="1" border="1" bordercolor="gray">
    <tr>
        <td width="250px">ID</td>
        <td width="250px">Tên sản phẩm</td>
        <td width="250px">Giá bán (vnđ)</td>
        <td width="250px">Số lượng</td>
        <td width="250px">Doanh thu (vnđ)</td>
    </tr>
    <%
        Integer year = (Integer) session.getAttribute("tk_year2");
        Integer month = (Integer) session.getAttribute("tk_motnh");
        List<Map.Entry<ProductEntity, Integer>> list_pro = (List<Map.Entry<ProductEntity, Integer>>) session.getAttribute("data_month");

        if (list_pro != null) {
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "inline; filename="+ "Thong ke san pham da ban : thang " + month + " nam " + year + ".xls");
        }
        for(Map.Entry<ProductEntity, Integer> pro: list_pro){
    %>
    <tr>
        <td><%=pro.getKey().getId()%></td>
        <td><%=pro.getKey().getProName()%></td>
        <td><%=pro.getKey().getPrice()%></td>
        <td><%=pro.getValue()/pro.getKey().getPrice()%></td>
        <td><%=pro.getValue()%></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
