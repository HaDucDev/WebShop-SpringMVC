<%@ page import="java.util.List" %>
<%@ page import="com.website.models.view.DT_ThangView" %><%--
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
    <title>Danh thu theo tháng của năm : ${year} </title>
</head>
<body>
<h1>Doanh thu theo tháng của năm : ${year} </h1>
<table cellpadding="1"  cellspacing="1" border="1" bordercolor="gray">
    <tr>
        <td width="150px">Tháng</td>
        <td width="150px">Doanh thu (vnđ)</td>
    </tr>
    <%
        Integer year = (Integer) session.getAttribute("year");
        List<DT_ThangView> dt_thangViews  = (List<DT_ThangView>)request.getAttribute("dt_thangViews");
        if (dt_thangViews != null) {
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "inline; filename="+ "Doanh thu theo thang cua nam :" + year + ".xls");
        }
        for(DT_ThangView e: dt_thangViews){
    %>
    <tr>
        <td><%=e.getThang()%></td>
        <td><%=e.getDoanhthu()%></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
