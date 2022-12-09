<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/views/web/static" var="url"> </c:url>
<c:url value="/api-user-cart" var="APIaurl"></c:url>
<c:url value="/api-user-product" var="ProductUrl"></c:url>
<c:url value="/client-product-list" var ="PCUrl" ></c:url>
<c:url value="/api-user-comment" var ="APIcomment" ></c:url>
<c:url var="imgPerson" value="/image/person.png"></c:url>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Sản phẩm chi tiết</title>
	<link href="${url}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${url}/css/font-awesome.min.css" rel="stylesheet">
	<link href="${url}/css/main.css" rel="stylesheet">
	<link href="${url}/css/responsive.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

</head>

<body onload="checkReply()">
<jsp:include page="header.jsp"></jsp:include>
<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 padding-right">
				<div class="product-details"><!--product-details-->
					<div class="col-sm-5">
						<input type="hidden" id="id" value="${productEntity.id}">
						<div class="view-product">
							<c:url var="imgUrl" value="/image/${productEntity.getImage()}"></c:url>
							<img height="250" width="200" src="${imgUrl}" alt="" />
						</div>
						<div id="similar-product" class="carousel slide" data-ride="carousel">

							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
<%--									//sản phẩm liên quan--%>
								</div>
							</div>
							<!-- Controls -->
							<a class="left item-control" href="#similar-product" data-slide="prev">
								<i class="fa fa-angle-left"></i>
							</a>
							<a class="right item-control" href="#similar-product" data-slide="next">
								<i class="fa fa-angle-right"></i>
							</a>
						</div>

					</div>
					<div class="col-sm-7">
						<div class="product-information"><!--/product-information-->
							<h2>${productEntity.getProName()}</h2>
							<span>

<%--									<span>${productEntity.getPrice()} ₫</span>--%>
									<h2><fmt:formatNumber type="number" value="${productEntity.getPrice()}" /> VNĐ</h2>
									<br>
									<button style="margin: 0;" type="button"  class="btn btn-fefault cart" onclick="addToCart(${productEntity.getId()})"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</button>
								</span>
							<p><b>Mô tả sản phẩm:</b></p>
							<p>Ngày nay, khi người dùng lựa chọn cho mình một chiếc laptop để sử dụng luôn quan tâm đến nhu cầu sử dụng vừa để làm việc vừa để giải trí chơi game. Vì vậy lựa chọn cho mình một chiếc laptop gaming là một giải pháp phù hợp cho mọi nhu cầu sử dụng của bạn. Acer Nitro 5 là chiếc laptop đến từ thương hiệu Acer sẽ mang đến một cách nhìn hoàn toàn mới về các nhu cầu sử dụng trên dòng laptop gaming có thể mang lại cho người dùng.</p>
						</div><!--/product-information-->
					</div>
				</div><!--/product-details-->
			</div>
		</div>
	</div>


	<div class="category-tab shop-details-tab"><!--category-tab-->
		<div class="col-sm-12">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#reviews" data-toggle="tab">Đánh giá</a></li>
			</ul>
		</div>
		<div class="tab-content">

			<div class="tab-pane fade active in" id="reviews" >
				<input id="parent" type="hidden" value="0">
				<div class="col-sm-12">
					<ul>
						<li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
						<li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
						<li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2014</a></li>
					</ul>
					<div class="comment">

					<c:forEach var="row_comment" items="${lstComment}">
						<div class="row style_comment">
							<div class="col-md-1">
								<img width="100%" src="${imgPerson}"
									 class="img img-responsive img-thumbnail">
							</div>
							<div class="col-md-10 panel-footer">
								<p style="color:green;"> ${row_comment.userEntity.fullname}</p>
								<fmt:formatDate  value = "${row_comment.getWriteDate()}" var = "parsedMyDate" dateStyle="short" type="both" pattern = "MM-dd-yyyy hh:mm:ss a"  />
								<p style="color: #000;"><c:out value = "${parsedMyDate}" /></p>
								<p> ${row_comment.content}</p>
							</div>
							<div class="col-md-1 panel-footer" align="right">
								<p>.</p>
								<button type="button" class="btn btn-default reply" onclick="replyClicked('${row_comment.getUserEntity().getFullname()}',${row_comment.getId()})" >Reply</button>
							</div>
						</div>
					</c:forEach>
					</div>
					<p><b>Write Your Review</b></p>

<%--					<form action="#">--%>
<%--										<span>--%>
<%--											<input id="nameuser" type="text" placeholder="Your Name"/>--%>
<%--											<input type="email" placeholder="Email Address"/>--%>
<%--										</span>--%>
						<textarea id="content" name="" placeholder="Để lại bình luạn ở đây"></textarea>
<%--						<b>Rating: </b> <img src="images/product-details/rating.png" alt="" />--%>
						<button id="btnSubmit"  type="button" class="btn btn-default pull-right"  onclick="sendComment()">
							Submit
						</button>
<%--					</form>--%>
				</div>
			</div>

		</div>
	</div><!--/category-tab-->
</section>
<jsp:include page="footer.jsp"></jsp:include>
<script>
	function addToCart(data){
		JSalert();
		$.ajax({
			url: '${APIaurl}',
			type: 'POST',
			enctype: 'multipart/form-data',
			processData:false,
			contentType: 'application/json',
			data:JSON.stringify(data),
			dataType: 'json',

			success: function (result){
				console.log("Success");
				console.log(data);

				<%--window.location.href = "${PCurl}?type=list&message=insert_success";--%>
			},
			errMode: function (error){
				console.log("Error");
			}
		})
	};
</script>

<script>
	function changeQuantity(action){
		var id = parseInt($('#id').val());
		var quantity =parseInt($('#txtQuantity').val());
		var data ={
			"productId":id,
			"quantity":quantity
		};
		console.log(data);
		$.ajax({
			url: '${PCUrl}?type='+action,
			type: 'PUT',
			enctype: 'multipart/form-data',
			processData:false,
			contentType: 'application/json',
			data:JSON.stringify(data),
			dataType: 'json',

			success: function (result){
				console.log("Success");
				window.location.href="/client-product-list?type=detail_product";
			},
			errMode: function (error){
				console.log("Error");
			}
		})
	};


</script>

<script>
	// document.getElementById('btnSubmit').addEventListener('click', sendComment);
	function sendComment(){

		var content =$('#content').val();
		if (content.charAt(0) != '@') {
			document.getElementById("parent").value = 0;
		}
		var id = parseInt($('#id').val());
		var parent_id = $('#parent').val();

		var data ={
			"productEntity": {
				"id":id
			},
			"commentEntity": {
				"id":parent_id
			},
			"content":content
		};
		let date = new Date().toLocaleString();



		$.ajax({
			url: '${APIcomment}',
			type: 'POST',
			enctype: 'multipart/form-data',
			processData:false,
			contentType: 'application/json',
			data:JSON.stringify(data),
			dataType: 'json',

			success: function (result){
				// console.log(result.toString())
				var new_comment = document.querySelector('.comment');
				var fullname =result;
				new_comment.innerHTML=new_comment.innerHTML+'<div class="row style_comment">\n' +
						'\t\t\t\t\t\t\t<div class="col-md-1">\n' +
						'\t\t\t\t\t\t\t\t<img width="100%" src="${imgPerson}"\n' +
						'\t\t\t\t\t\t\t\t\t class="img img-responsive img-thumbnail">\n' +
						'\t\t\t\t\t\t\t</div>\n' +
						'\t\t\t\t\t\t\t<div class="col-md-10 panel-footer">\n' +
						'\t\t\t\t\t\t\t\t<p style="color:green;"> '+result +'</p>\n' +
						'\t\t\t\t\t\t\t\t<fmt:formatDate  value = "${row_comment.getWriteDate()}" var = "parsedMyDate" dateStyle="short" type="both" pattern = "MM-dd-yyyy hh:mm:ss a"  />\n' +
						'<p style="color: #000;">'+date+'</p>' +
						'\t\t\t\t\t\t\t\t<p>'+content+'</p>\n'+
						'\t\t\t\t\t\t\t</div>\n' +
						'\t\t\t\t\t\t\t<div class="col-md-1 panel-footer" align="right">\n' +
						'\t\t\t\t\t\t\t\t<p>.</p>\n' +
						'\t\t\t\t\t\t\t\t<button type="button" class="btn btn-default reply" onclick="replyClicked(\''+ fullname + '\' ,'+parent_id+')" >Reply</button>\n' +
						'\t\t\t\t\t\t\t</div>\n' +
						'\t\t\t\t\t\t</div>'

				console.log("Success");

				document.getElementById("content").value = "";
				contenValue.setAttribute()
				// window.location.href="/client-product-list?type=detail_product";
			},
			error: function (error){
				alert("Vui lòng đăng nhập để bình luạn")
				console.log("Error");
			}
		})
	};
</script>

<script>

	function checkReply() {

		const queryString = window.location.search;

		const urlParams = new URLSearchParams(queryString);

		const page_type = urlParams.get('page_type')
		const name =urlParams.get('name')
		const parent_id =urlParams.get('parent_id')

		if (page_type == 'adminReply') {
			replyClicked(name,parent_id);

		}
	}

	function replyClicked(name,parent_id) {

		console.log("Hlll");
		<%--console.log(typeof(${row_comment}));--%>

		// var comment_id = $(this).attr("id");
		// $('#comment_id').val(comment_id);

		document.getElementById("content").value = "@"+name+": ";
		$('#content').focus();
		document.getElementById("parent").value = parent_id;
	}

</script>



<script src="${url}/js/jquery.js"></script>
<script src="${url}/js/price-range.js"></script>
<script src="${url}/js/jquery.scrollUp.min.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<script src="${url}/js/jquery.prettyPhoto.js"></script>
<script src="${url}/js/main.js"></script>
<script type="text/javascript">
	function JSalert(){
		Swal.fire('Thêm vào giỏ hàng thành công')
	}
</script>
</body>
</html>