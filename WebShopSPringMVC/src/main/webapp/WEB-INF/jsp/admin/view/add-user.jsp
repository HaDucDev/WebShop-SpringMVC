<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<c:url value="/views/admin/static" var="url"></c:url>
<c:url value="/api-admin-user" var="APIurl"></c:url>
<c:url value="/admin-user-list" var="ACurl"></c:url>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Edit User</title>
	<!-- BOOTSTRAP STYLES-->
	<link href="${url}/css/bootstrap.css" rel="stylesheet" />
	<!-- FONTAWESOME STYLES-->
	<link href="${url}/css/font-awesome.css" rel="stylesheet" />
	<!-- CUSTOM STYLES-->
	<link href="${url}/css/custom.css" rel="stylesheet" />
	<!-- GOOGLE FONTS-->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans'
		  rel='stylesheet' type='text/css' />
</head>
<body>
<div id="wrapper">
	<jsp:include page="/views/admin/view/nav-bar.jsp"></jsp:include>
	<!-- /. NAV TOP  -->
	<jsp:include page="/views/admin/view/slide-bar.jsp"></jsp:include>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<h2>Thêm người dùng</h2>
				</div>
			</div>
			<!-- /. ROW  -->
			<hr />
			<div class="row">
				<div class="col-md-12">
					<!-- Form Elements -->
					<div class="panel panel-default">
						<div class="panel-heading"></div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-6">
									<h3>Thông tin chi tiết người dùng</h3>

									<form role="form" <%--action="api-admin-user"--%>  id="add-user" method="post" <%--enctype="multipart/form-data"--%>>
										<div class="form-group">
											<label>Tên người dùng</label> <input class="form-control" placeholder="Nhập tên người dùng" name="fullname" id="fullname" />
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Tên đăng nhập</label> <input class="form-control"
																				placeholder="Tên đăng nhập"
																				name="username" id="username" />
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Mật khẩu</label> <input class="form-control"
																		   placeholder="Nhập mật khẩu" type="password"
																		   name="password" id="password" />
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Email</label> <input class="form-control" placeholder="Nhập email" name="email" id="email" />
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Số điện thoại</label> <input class="form-control" min="0" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
																				type="number" placeholder="Nhập số điện thoại" name="phonenumber" id="phonenumber" />
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Địa chỉ</label> <input class="form-control" placeholder="Nhập địa chỉ" name="address" id="address" />
											<span style="color: red" class="form-message"></span>
										</div>
										<div class="form-group">
											<label>Chức vụ</label>
											<div class="checkbox">
												<label> <input type="radio" value="1" name="role" id="roleid1" checked/>Admin
												</label>
												<br>
												<label> <input type="radio" value="0" name="role" id="roleid0"/>Client
												</label>
												<br>
												<label> <input type="radio" value="2" name="role" id="roleid2" />Shipper
												</label>
												<br>
												<label> <input type="radio" value="3" name="role" id="roleid3" />Employee
												</label>
											</div>
										</div>

										<button type="submit" class="btn btn-default" id="btnAdd">Thêm</button>
										<button type="reset" class="btn btn-primary">Reset</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="${url}/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="${url}/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="${url}/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="${url}/js/custom.js"></script>

<script src='${pageContext.request.contextPath }/Validation.js'></script>
<script>
	Validator({
		form: '#add-user',
		formGroupSelector: '.form-group',
		errorSelector : '.form-message',
		rules: [
			Validator.isRequired('#fullname'),
			Validator.isRequired('#username'),
			Validator.minLength('#username','6'),
			Validator.isRequired('#email'),
			Validator.isEmail('#email'),
			Validator.isRequired('#phonenumber'),
			Validator.minLength('#password', '6'),
			Validator.isRequired('#address'),
		],
		onSubmit: function (data) {
			///call API
			var fullname= $('#fullname').val();
			var username= $('#username').val();
			var password= $('#password').val();
			var email= $('#email').val();
			var phonenumber=$('#phonenumber').val();
			var address=$('#address').val();
			/*var avatar= $('#avatar').val();*/
			var roleId="0";
			if(document.getElementById('roleid1').checked) {
				roleId="1";
			}else if(document.getElementById('roleid2').checked) {
				roleId="2";
			} else if(document.getElementById('roleid0').checked) {
				roleId="0";
			} else if(document.getElementById('roleid3').checked) {
				roleId="3";
			}
			console.log(username);
			var data={
				"fullname":fullname,
				"username":username,
				"passWord":password,
				"email":email,
				//"id":id,
				// "avatar":avatar,
				"role":roleId,
				"phone_number":phonenumber,
				"address":address
			}
			updateProduct(data)
		}
	});
	function updateProduct(data){
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
					window.location.href = "${ACurl}?type=list";
				}
			},
			errMode: function (error){
				console.log("Error");
			}
		})
	}
</script>
<%--	Addition--%>
<%--<script>
    $('#btnAdd').click(function (e){
        e.preventDefault();
        var fullname= $('#fullname').val();
        var username= $('#username').val();
        var password= $('#password').val();
        var email= $('#email').val();
        var phonenumber=$('#phonenumber').val();
        var address=$('#address').val();
        /*var avatar= $('#avatar').val();*/
        var roleId="0";
        if(document.getElementById('roleid1').checked) {
            roleId="1";
        }else if(document.getElementById('roleid2').checked) {
            roleId="2";
        } else if(document.getElementById('roleid0').checked) {
            roleId="0";
        } else if(document.getElementById('roleid3').checked) {
            roleId="3";
        }
        console.log(username);
        var data={
            "fullname":fullname,
            "username":username,
            "passWord":password,
            "email":email,
            //"id":id,
            // "avatar":avatar,
            "role":roleId,
            "phone_number":phonenumber,
            "address":address

        }
        updateProduct(data)

    });
    function updateProduct(data){
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            enctype: 'multipart/form-data',
            processData:false,
            contentType: 'application/json',
            data:JSON.stringify(data),
            dataType: 'json',
            success: function (result){
                console.log("Success");
                window.location.href = "${ACurl}?type=list";
            },
            errMode: function (error){
                console.log("Error");
            }
        })
    }
</script>--%>
</body>
</html>