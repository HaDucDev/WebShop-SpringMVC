<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/views/web" var="login"></c:url>
<c:url value="/trang-chu" var="HomeUrl"> </c:url>
<html>
<head>
    <title>Title</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet">
    <!------ Include the above in your HEAD tag ---------->
    <style>

        body {
        font-family: "Lato", sans-serif;
        }



        .main-head{
        height: 150px;
        background: #FFF;

        }

        .sidenav {
        height: 100%;
        background-color: #000;
        overflow-x: hidden;
        padding-top: 20px;
        }


        .main {
        padding: 0px 10px;
        }

        @media screen and (max-height: 450px) {
        .sidenav {padding-top: 15px;}
        }

        @media screen and (max-width: 450px) {
        .login-form{
        margin-top: 10%;
        }

        .register-form{
        margin-top: 10%;
        }
        }

        @media screen and (min-width: 768px){
        .main{
        margin-left: 40%;
        }

        .sidenav{
        width: 40%;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
        background-color: #101F33;
        }

        .login-form{
        margin-top: 80%;
        }

        .register-form{
        margin-top: 20%;
        }
        }


        .login-main-text{
        margin-top: 20%;
        padding: 60px;
        color: #fff;
        }

        .login-main-text h2{
        font-weight: 300;
        }

        .btn-black{
        background-color: #000 !important;
        color: #fff;
        }
    </style>
</head>
<body>

    <div class="sidenav text-center align-middle" >
        <div class="login-main-text">
            <h1 style="color: white">Gửi mail<br><br>
                <a href="${HomeUrl}?action=home"><i style="color: white" class="fas fa-home fa-2x"></i></a></h1>
        </div>
    </div>

<div class="main">
    <div class="col-md-6 col-sm-12">
        <div class="login-form">
            <form action="${pageContext.request.contextPath }/trang-chu" method="post">
                <div class="form-group">
                    <h3>Tên tài khoản</h3>
                    <input name="userName" type="text" class="form-control" placeholder="Nhập tên tài khoản">
                    <h3>Nhập email</h3>
                    <input name="emailReset" type="text" class="form-control" placeholder="Nhập email">
                </div>
                <button type="submit" class="btn btn-success btn-primary" >Gửi </button>
                <input type="hidden" name="action" value="login">
            </form>
        </div>
    </div>
</div>
</body>
</html>
