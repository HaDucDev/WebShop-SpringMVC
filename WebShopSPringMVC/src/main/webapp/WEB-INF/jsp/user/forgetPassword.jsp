<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 3/13/2023
  Time: 7:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Quên mật khẩu</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    h5 {
      padding: 10px 0px;
    }
  </style>
</head>
<body style="background-color: rgba(0,0,0,0.003)">
<jsp:include page="a-header.jsp"></jsp:include>
<div class="container">
  <div class="row" style=" min-height: 100vh;">
    <div class="col-12">
      <div class="row" style=" margin-top: 100px;">
        <h4>Quên mật khẩu</h4>
        <c:url var="action" value="/forget-pass"/>

        <div class="login-form">
          <form method="post" id="login-form" action="${action}">
            <div class="form-group">
              <h5>Nhập email để lấy lại mật khẩu:</h5>
              <input id="email" name="email" type="text" class="form-control"
                     placeholder="Nhập email">
            </div>
            <input type="submit" class="btn btn-success btn-primary" value="Xác nhận"
                   style="margin-top: 10px; color: white; background-color: #696763; border: none;"/>
          </form>
          <button type="button" class="btn btn-primary" onclick="window.location='<c:url value="/login"/>'">Trở lại trang đăng nhập</button>
          <c:if test="${param.error != null}">
            <div class="alert alert-danger">
              Email không tồn lại
            </div>
          </c:if>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"></script>
<jsp:include page="a-footer.jsp"></jsp:include>

</body>
</html>

