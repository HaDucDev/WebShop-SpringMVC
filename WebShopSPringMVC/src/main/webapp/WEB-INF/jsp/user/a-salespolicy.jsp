<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/user" var="url"> </c:url>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chính sách bán hàng</title>
    <link rel="stylesheet" href="${url}/css/salespolicy.css">
    <link href="${url}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="a-header.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-12">
            <h2>IV / Thời gian tiếp nhận đổi trả sản phẩm:</h2>
            <p>
                – Từ T2 -> T6 : (  Từ 10h đến 19h )
                <br>
                – Thứ 7 từ 10h đến 12h30, chiều thứ 7 không nhận bảo hành.
                <br>
                – Chủ nhật không nhận bảo hành.
                <br>
                – Mong quý khách thông cảm.
            </p>
            <br>
            <h1>QUY ĐỊNH BẢO HÀNH</h1>
            <h2>I/ Điều kiện nhận bảo hành.</h2>
            <p> – Áp dụng chính sách đổi mới nếu sản phẩm của quý khách mua tại SHOP trong vòng 7 ngày kể từ lúc giao hàng .( Quý khách tham khảo quy định chính sách đổi mới ) nếu sau 7 ngày sẽ áp dụng chính sách bảo hành tại Việt Nam .</p>
            <h5>HCMC: Digiworld Corporation</h5>
            <p>
                – Address: 512A Huynh Tan Phat, BinhThuan ward, Dist. 07, HCMC, Vietnam
                <br>
                – TEL: 84-902 738168
                <br>
                – E-mail: thanhloan@dgw.com.vn
                <br>
                – Contact: Thanh Loan
            </p>
            <br>
            <h5>Ha Noi: Digiworld Corp.</h5>
            <p> – Address: 27/785 Truong Dinh Str., Hoang Mai Dist., Ha Noi, Viet Nam.
                <br>
                – TEL: 84-916 398982
                <br>
                – E-mail: thanhloan@dgw.com.vn
            </p>
            <br>
            <h1>XIN CẢM ƠN</h1>
        </div>
    </div>
</div>
<jsp:include page="a-footer.jsp"></jsp:include>
</body>
</html>