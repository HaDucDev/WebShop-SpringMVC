<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/user" var="url"> </c:url>
<c:url value="/js" var="urljsa"> </c:url>
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
                <div class="product-details">
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

                                    <div>Giảm giá: ${productDetail.discount}đ</div>
									<div style="display: flex">
                                        <div>Giá bán: ${Math.round(productDetail.unitPrice-productDetail.unitPrice*productDetail.discount/100)}đ </div>
                                        <div> <s>${productDetail.unitPrice}đ</s> </div>
                                    </div>
									<br>
									<button style="margin: 0;" type="button"  class="btn btn-fefault cart" onclick="addToCartOfProductDetail(${productDetail.id})"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</button>
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
<div class="modal fade" id="myModalProduct" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Thông báo</h4>
            </div>
            <div class="modal-body">
                <p>Bạn phải đăng nhập để có thể thêm sản phẩm vào giỏ hàng</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<div class="modal fade" id="myModalDoneProduct" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Thông báo</h4>
            </div>
            <div class="modal-body">
                <p>Sản phẩm đã thêm vào giỏ hàng thành công</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>
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



<script src="${url}/js/jquery.js"></script>
<script src="${url}/js/price-range.js"></script>
<script src="${url}/js/jquery.scrollUp.min.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<script src="${url}/js/jquery.prettyPhoto.js"></script>
</body>
</html>