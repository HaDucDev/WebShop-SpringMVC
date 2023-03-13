<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h4>Đăng nhập</h4>
                <c:url var="action" value="/login"/>
                <c:url var="register" value="/register"/>
                <c:url var="forgetPass" value="/forget-pass"/>
                <c:if test="${usernotnull != null}">
                    <div class="alert alert-danger">
                        Bạn phải đăng nhập mới có thể mua hàng
                    </div>
                </c:if>
                <div class="login-form">
                    <form method="post" id="login-form" action="${action}">
                        <div class="form-group">
                            <h5>Tên đăng nhập</h5>
                            <input id="username" name="username" type="text" class="form-control"
                                   placeholder="Tên đăng nhập">
                            <span class="form-message"></span>
                        </div>
                        <div class="form-group">
                            <h5>Mật khẩu</h5>
                            <input id="password" name="password" type="password" class="form-control"
                                   placeholder="Mật khẩu">
                            <span class="form-message"></span>
                        </div>
                        <div id="showpassword">
                            <input type="checkbox" onclick="myFunction()">Hiển thị mật khẩu</input>
                        </div>
                        <input type="submit" class="btn btn-success btn-primary" value="Đăng nhập"
                               style="margin-top: 10px; color: white; background-color: #696763; border: none;"/>
                        <button type="submit" class="btn btn-link"><a href="${register}">Đăng kí</a></button>
                        <button type="submit" class="btn btn-link"><a href="${forgetPass}">Quên mật khẩu</a></button>
                    </form>
                    <c:if test="${param.successPass != null}">
                        <div class="alert alert-danger">
                            Bạn đã đổi mật khẩu thành công, hãy đăng nhập và đổi mật khẩu
                        </div>
                    </c:if>
                    <c:if test="${param.error != null}">
                        <div class="alert alert-danger">
                            Tên đăng nhập hoặc mật khẩu không đúng.
                        </div>
                    </c:if>
                    <c:if test="${successregister != null}">
                        <div class="alert alert-danger">
                            Chúc mừng bạn đăng kí tài khoản thành công
                        </div>
                    </c:if>
                    <c:if test="${param.accessDenied != null}">
                        <div class="alert alert-danger">
                            Bạn không có quyền làm điều này
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
<script>
    function myFunction() {
        var x = document.getElementById("password");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }
    }
</script>
</body>
</html>
