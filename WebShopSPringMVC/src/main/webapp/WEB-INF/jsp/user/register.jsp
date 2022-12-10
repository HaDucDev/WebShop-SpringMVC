<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registation Form * Form Tutorial</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="register-form">
        <c:url var="action" value="/register"/>
        <c:if test="${errorregister != null}">
            <div class="alert alert-danger">
                Đăng kí lỗi

            </div>
        </c:if>
        <form:form class="panel-body" id="register-form" modelAttribute="user" action="${action}" method="post">
            <div class="panel-heading">
                <h2 class="text-center">Đăng ký tài khoản</h2>
            </div>

            <div class="form-group">
                <label for="fullname">Full Name:</label>
                <form:input type="text" class="form-control" id="fullname" name="fullname" placeholder = "Nhập full name" path="fullName"/>
                <span style="color: red" class="form-message"></span>
            </div>

            <div class="form-group">
                <label for="username">User Name:</label>
                <form:input required="true" type="text" class="form-control" id="username" name="username" placeholder = "Nhập User" path="username"/>
                <span style="color: red" class="form-message"></span>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <form:input required="true" type="email"  class="form-control" id="email" name="email" placeholder="Nhập email" path="email"/>
                <span style="color: red" class="form-message"></span>
            </div>

            <div class="form-group">
                <label for="phone">Phone number:</label>
                <form:input required="true" type="number" min="0" class="form-control" id="phone" placeholder="Nhập số điện thoại" path="phone"/>
                <span style="color: red" class="form-message"></span>
            </div>

            <div class="form-group">
                <label for="phone">Địa chỉ:</label>
                <form:input required="true" type="text" class="form-control" id="phone" placeholder="Nhập số điện thoại" path="addressDefault"/>
                <span style="color: red" class="form-message"></span>
            </div>
            <div class="form-group">
                <label for="pwd">Password:</label>
                <form:input required="true" type="password"  class="form-control" id="pwd" placeholder="Nhập mật khẩu" path="password"/>
                <span style="color: red" class="form-message"></span>
            </div>

            <div class="form-group">
                <label for="confirmation_pwd">Confirmation Password:</label>
                <form:input required="true" type="password" class="form-control" placeholder="Xác nhận mật khẩu" id="confirmation_pwd" path="confirmPassword"/>
                <span style="color: red" class="form-message"></span>
            </div>

            <input type="submit" class="btn btn-success" id="btnRegister" value="Register"/>
<%--            <button class="btn btn-success" onclick="document.location='${pageContext.request.contextPath}/views/web/login.jsp'">Cancel</button>--%>
        </form:form>
    </div>
</div>
</body>

</html>
