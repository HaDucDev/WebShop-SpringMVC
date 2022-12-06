<%@ page import="java.util.List" %>
<%@ page import="com.website.models.view.DT_NamView" %><%--
  Created by IntelliJ IDEA.
  User: hungd
  Date: 6/3/2021
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh thu theo từng năm từ : ${start_year} - ${end_year} </title>
</head>
<body>
<h1>Doanh thu theo từng năm từ : ${start_year} - ${end_year} </h1>
<table cellpadding="1"  cellspacing="1" border="1" bordercolor="gray">
    <tr>
        <td width="150px">Năm</td>
        <td width="150px">Doanh thu (vnđ)</td>
    </tr>
    <%
        Integer start_year = (Integer) session.getAttribute("start_year");
        Integer end_year = (Integer) session.getAttribute("end_year");
        List<DT_NamView> dt_namViews  = (List<DT_NamView>)request.getAttribute("dt_namViews");
        if (dt_namViews != null) {
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "inline; filename="+ "Doanh thu theo tung nam tu : " + start_year + " - " + end_year + ".xls");
        }
        for(DT_NamView e: dt_namViews){
    %>
    <tr>
        <td><%=e.getNam()%></td>
        <td><%=e.getGiatri()%></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
