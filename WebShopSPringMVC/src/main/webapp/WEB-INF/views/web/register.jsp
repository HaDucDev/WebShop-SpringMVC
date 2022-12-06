<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<c:url value="/api-admin-user" var ="APIurl"></c:url>
<c:url value="/validationlogin" var="url"> </c:url>
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
        <form class="panel-body" id="register-form">
            <div class="panel-heading">
                <h2 class="text-center">Đăng ký tài khoản</h2>
            </div>

            <div class="form-group">
                <label for="fullname">Full Name:</label>
                <input required="true" type="text" value="${user.fullname}" class="form-control" id="fullname" name="fullname" placeholder = "Nhập full name" />
                <span style="color: red" class="form-message"></span>
            </div>

            <div class="form-group">
                <label for="username">User Name:</label>
                <input required="true" type="text" value="${user.username}" class="form-control" id="username" name="username" placeholder = "Nhập User" />
                <span style="color: red" class="form-message"></span>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input required="true" type="email" value="${user.email}" class="form-control" id="email" name="email" placeholder="Nhập email" />
                <span style="color: red" class="form-message"></span>
            </div>

            <div class="form-group">
                <label for="phone">Phone number:</label>
                <input required="true" type="number" min="0" class="form-control" value="${user.phonenumber}" id="phone" placeholder="Nhập số điện thoại"/>
                <span style="color: red" class="form-message"></span>
            </div>
            <div class="form-group">
                <label for="pwd">Password:</label>
                <input required="true" type="password" value="${user.passWord}" class="form-control" id="pwd" placeholder="Nhập mật khẩu"/>
                <span style="color: red" class="form-message"></span>
            </div>

            <div class="form-group">
                <label for="confirmation_pwd">Confirmation Password:</label>
                <input required="true" type="password" class="form-control" placeholder="Xác nhận mật khẩu" id="confirmation_pwd">
                <span style="color: red" class="form-message"></span>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" class="form-control" value="${user.address}" id="address" placeholder="Nhập địa chỉ" />
                <span style="color: red" class="form-message"></span>
            </div>

            <button type="submit" class="btn btn-success" id="btnRegister">Register</button>
            <button class="btn btn-success" onclick="document.location='${pageContext.request.contextPath}/views/web/login.jsp'">Cancel</button>
        </form>
    </div>
</div>
<script src='${pageContext.request.contextPath }/Validation.js'></script>
<script>
    ///Mong muon cua chung ta khi su dung thu vien nay
    Validator({
        form: '#register-form',
        formGroupSelector: '.form-group',
        errorSelector : '.form-message',
        rules: [
            Validator.isRequired('#fullname'),
            Validator.isRequired('#username'),
            Validator.minLength('#username','6'),
            Validator.isRequired('#email'),
            Validator.isEmail('#email'),
            Validator.isRequired('#phone'),
            Validator.minLength('#pwd', '6'),
            Validator.isRequired('#address'),
            Validator.minLength('#confirmation_pwd','6'),
            Validator.isConfirmed('#confirmation_pwd',function () {
                return document.querySelector('#register-form #pwd').value;
            })
        ],
        onSubmit: function (data) {
            ///call API
            var fullname=$('#fullname').val();
            var username= $('#username').val();
            var email= $('#email').val();
            var phone= $('#phone').val();
            var pwd= $('#pwd').val();
            var address= $('#address').val();
            var data={
                "fullname":fullname,
                "username":username,
                "email":email,
                "phone_number":phone,
                "passWord":pwd,
                "address":address,
                "role": "0"
            }
            registerAccount(data)
        }
    });
    function registerAccount(data){
        console.log(data);
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            enctype: 'multipart/form-data',
            processData:false,
            contentType: 'application/json',
            data:JSON.stringify(data),
            dataType: 'json',

            success: function (result){
                if(result == 0){
                    alert("Tên đăng nhập đã có người sử dụng !  Yêu cầu nhập tên đăng nhập khác. ")
                } else {
                    console.log("Success");
                    window.location.href = "${url}?type=logout";
                }
            },
            error: function (error){
                console.log("Error");
                window.location.href = "${url}?type=register";
            }
        })
    }
</script>
</body>

</html>
