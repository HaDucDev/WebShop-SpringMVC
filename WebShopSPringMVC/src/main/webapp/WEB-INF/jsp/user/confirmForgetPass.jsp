<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 3/13/2023
  Time: 7:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Login</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        h5 {
            padding: 10px 0px;
        }
    </style>
</head>
<body style="background-color: rgba(0,0,0,0.003)">
<div class="container">
    <div class="row" style=" min-height: 100vh;">
        <div class="col-12">
            <div class="row">
                <div class="col-12 text-center" style="padding-top: 20px;">
                    <a href="<c:url value="/"/>" class="mt2" style=" color:#696763;"><i class="fas fa-home fa-4x"></i></a>
                </div>
            </div>
            <div class="row" style=" margin-top: 100px;">
                <h4>Xác nhận quên mật khẩu</h4>
                <c:url var="action" value="/forget-pass-confirm"/>
                <c:url var="login" value="/login"/>
                <div class="login-form">
                    <form:form method="post" id="login-form" action="${action}" modelAttribute="userForget">
                        <div class="form-group">
                            <h5>Email</h5>
                            <form:input id="username" name="email" type="text" class="form-control" path="email"
                                   placeholder="Email" readonly="true"/>
                        </div>
                        <div class="form-group">
                            <h5>Mã xác nhận</h5>
                            <form:input id="password" name="password" type="text" class="form-control" path="resetPasswordCode"
                                   placeholder="Mã xác nhận"/>
                        </div>
                        <input type="submit" class="btn btn-success btn-primary" value="Xác nhận"
                               style="margin-top: 10px; color: white; background-color: #696763; border: none;"/>
                        <button type="submit" class="btn btn-link"><a href="${login}">Xác nhận</a></button>
                    </form:form>
                    <c:if test="${param.error != null}">
                        <div class="alert alert-danger">
                            Mã xác nhận lỗi
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"></script>
</body>
</html>

