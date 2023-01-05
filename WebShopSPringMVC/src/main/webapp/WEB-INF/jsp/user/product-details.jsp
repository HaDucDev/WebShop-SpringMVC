<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/user" var="url"> </c:url>
<c:url value="/js" var="urljsa"> </c:url>
<%--<c:url value="/api-user-cart" var="APIaurl"></c:url>--%>
<%--<c:url value="/api-user-product" var="ProductUrl"></c:url>--%>
<%--<c:url value="/client-product-list" var ="PCUrl" ></c:url>--%>
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

    <script src="${urljsa}/moment.js"></script>
    <script src="${urljsa}/main.js"></script>

</head>

<body onload="checkReply()">
<jsp:include page="a-header.jsp"></jsp:include>
<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-12 padding-right">
                <div class="product-details"><!--product-details-->
                    <div class="col-sm-5">
                        <input type="hidden" id="idproduct" value="${productDetail.id}">
                        <div class="view-product">
                            <c:url var="imgUrl" value="${productDetail.productImage}"></c:url>
                            <img height="250" width="200" src="${imgUrl}" alt=""/>
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
                            <h2>${productDetail.productName}</h2>
                            <span>

<%--									<span>${productEntity.getPrice()} ₫</span>--%>
									<h2><fmt:formatNumber type="number" value="${productDetail.unitPrice}"/> VNĐ</h2>
									<br>
<%--									<button style="margin: 0;" type="button"  class="btn btn-fefault cart" onclick="addToCart(${productEntity.getId()})"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</button>--%>
								</span>
                            <p><b>Mô tả sản phẩm:</b></p>
                            <p>${productDetail.descriptionProduct}</p>
                        </div><!--/product-information-->
                    </div>
                </div><!--/product-details-->
            </div>

            <div class="category-tab shop-details-tab"><!--category-tab-->
                <div class="col-sm-12">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#reviews" data-toggle="tab">Đánh giá</a></li>
                    </ul>
                </div>
                <div class="tab-content">

                    <div class="tab-pane fade active in" id="reviews">
                        <input id="parent" type="hidden" value="0">
                        <div class="col-sm-12">
                            <ul>
                                <li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
                                <li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
                                <li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2014</a></li>
                            </ul>
                            <c:if test="${sessionScope.currentUser != null}">
                                <div>
                                    <p><b>Write Your Review</b></p>
                                    <textarea id="content" name="" placeholder="Để lại bình luận ở đây"></textarea>
                                        <%--						<b>Rating: </b> <img src="images/product-details/rating.png" alt="" />--%>
                                    <button id="btnSubmit" type="button" class="btn btn-default" onclick="sendComment(${productDetail.id})">
                                        Submit
                                    </button>
                                </div>
                                <br>
                            </c:if>
                            <div class="comment" id="commentlist">
                                <c:forEach var="row_comment" items="${productDetail.reviews}">
                                    <div class="row style_comment">
                                        <div class="col-md-1" style="height: 80px; width: 15%">
                                            <img style=" width:100%;height:100%;object-fit: contain;"
                                                 src="${row_comment.user.avatar}"
                                                 class="img img-responsive img-thumbnail">
                                        </div>
                                        <div class="col-md-10 panel-footer my-date-1">
                                            <p style="color:green;"> ${row_comment.user.fullName}</p>
                                            <p> ${row_comment.comment}</p>
                                            <fmt:formatDate value="${row_comment.createdComment}" var="parsedMyDate"
                                                            dateStyle="short" type="both"
                                                            pattern="MM-dd-yyyy hh:mm:ss a"/>
                                            <p style="color: green;"><c:out value="${parsedMyDate}"/></p>
                                            <p id="my-date-2" style="color: red;"><c:out value="${parsedMyDate}"/></p>
                                        </div>
                                            <%--										<div class="col-md-1 panel-footer" align="right">--%>
                                            <%--											<p>.</p>--%>
                                            <%--											<button type="button" class="btn btn-default reply" onclick="replyClicked('${row_comment.getUserEntity().getFullname()}',${row_comment.getId()})" >Reply</button>--%>
                                            <%--										</div>--%>
                                    </div>
                                </c:forEach>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>  <!-- row -->
    </div>

</section>
<jsp:include page="a-footer.jsp"></jsp:include>

<script>
    // khi trang load len het du lieu roi ms chay ham nay nhe
    window.onload = function () {// ko can dung jquery cho lau
        let d = document.querySelectorAll(".my-date-1 > #my-date-2");
        for (let i = 0; i < d.length; i++) {
            let temp = d[i];
            temp.innerText = moment(temp.innerText).fromNow()
        }

    }

</script>


<%--<script>--%>
<%--	function addToCart(data){--%>
<%--		JSalert();--%>
<%--		$.ajax({--%>
<%--			url: '${APIaurl}',--%>
<%--			type: 'POST',--%>
<%--			enctype: 'multipart/form-data',--%>
<%--			processData:false,--%>
<%--			contentType: 'application/json',--%>
<%--			data:JSON.stringify(data),--%>
<%--			dataType: 'json',--%>

<%--			success: function (result){--%>
<%--				console.log("Success");--%>
<%--				console.log(data);--%>

<%--				&lt;%&ndash;window.location.href = "${PCurl}?type=list&message=insert_success";&ndash;%&gt;--%>
<%--			},--%>
<%--			errMode: function (error){--%>
<%--				console.log("Error");--%>
<%--			}--%>
<%--		})--%>
<%--	};--%>
<%--</script>--%>

<%--<script>--%>
<%--	function changeQuantity(action){--%>
<%--		var id = parseInt($('#id').val());--%>
<%--		var quantity =parseInt($('#txtQuantity').val());--%>
<%--		var data ={--%>
<%--			"productId":id,--%>
<%--			"quantity":quantity--%>
<%--		};--%>
<%--		console.log(data);--%>
<%--		$.ajax({--%>
<%--			url: '${PCUrl}?type='+action,--%>
<%--			type: 'PUT',--%>
<%--			enctype: 'multipart/form-data',--%>
<%--			processData:false,--%>
<%--			contentType: 'application/json',--%>
<%--			data:JSON.stringify(data),--%>
<%--			dataType: 'json',--%>

<%--			success: function (result){--%>
<%--				console.log("Success");--%>
<%--				window.location.href="/client-product-list?type=detail_product";--%>
<%--			},--%>
<%--			errMode: function (error){--%>
<%--				console.log("Error");--%>
<%--			}--%>
<%--		})--%>
<%--	};--%>


<%--</script>--%>


<%--<script>--%>

<%--	function checkReply() {--%>

<%--		const queryString = window.location.search;--%>

<%--		const urlParams = new URLSearchParams(queryString);--%>

<%--		const page_type = urlParams.get('page_type')--%>
<%--		const name =urlParams.get('name')--%>
<%--		const parent_id =urlParams.get('parent_id')--%>

<%--		if (page_type == 'adminReply') {--%>
<%--			replyClicked(name,parent_id);--%>

<%--		}--%>
<%--	}--%>

<%--	function replyClicked(name,parent_id) {--%>

<%--		console.log("Hlll");--%>
<%--		&lt;%&ndash;console.log(typeof(${row_comment}));&ndash;%&gt;--%>

<%--		// var comment_id = $(this).attr("id");--%>
<%--		// $('#comment_id').val(comment_id);--%>

<%--		document.getElementById("content").value = "@"+name+": ";--%>
<%--		$('#content').focus();--%>
<%--		document.getElementById("parent").value = parent_id;--%>
<%--	}--%>

<%--</script>--%>


<script src="${url}/js/jquery.js"></script>
<script src="${url}/js/price-range.js"></script>
<script src="${url}/js/jquery.scrollUp.min.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<script src="${url}/js/jquery.prettyPhoto.js"></script>
<script src="${url}/js/main.js"></script>
<%--<script type="text/javascript">--%>
<%--	function JSalert(){--%>
<%--		Swal.fire('Thêm vào giỏ hàng thành công')--%>
<%--	}--%>
<%--</script>--%>
</body>
</html>