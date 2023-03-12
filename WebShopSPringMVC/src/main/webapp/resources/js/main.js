function addToCart(productId) {
    console.log("oddasdsdsd");
    fetch("/WebShopSPringMVC_war/api/cart", {
        method: 'post',
        body: JSON.stringify({
            "productId": productId,
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        console.log("odd234234234");
        console.log(res);
        console.log(res.status);
        return res.json(); // da la json nen ko can .json nua
    }).then(function (data) {

        console.log(data + "ok roi nhe");
        if (data === 0) {
            $("#myModal").modal();
        } else {
            $("#myModalDone").modal();
            var d = document.getElementById("cart-counter")
            if (d !== null) {
                d.innerText = data;
            }
        }
    })

}

function addToCartOfProductDetail(productId) {
    console.log("oddasdsdsd");
    fetch("/WebShopSPringMVC_war/api/cart", {
        method: 'post',
        body: JSON.stringify({
            "productId": productId,
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        console.log("odd234234234");
        console.log(res);
        console.log(res.status);
        return res.json(); // da la json nen ko can .json nua
    }).then(function (data) {

        console.log(data + "ok roi nhe");
        if (data === 0) {
            $("#myModalProduct").modal();
        } else {
            $("#myModalDoneProduct").modal();
            var d = document.getElementById("cart-counter")
            if (d !== null) {
                d.innerText = data;
            }
        }
    })

}


// them comment

function sendComment(productId){

    fetch("/WebShopSPringMVC_war/user/add-comment", {
        method: 'post',
        body: JSON.stringify({
            "content":document.getElementById("content").value,
            "productId": productId,
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        console.log("test comment");
        console.log(res);
        return res.json(); // da la json nen ko can .json nua
    }).then(function (data){
        console.log(data);
        let area= document.getElementById("commentlist");
        // template string
        // area.innerHTML = `
        //              <div class="row style_comment">
        //                                 <div class="col-md-1" style="height: 80px; width: 15%">
        //                                     <img style=" width:100%;height:100%;object-fit: contain;"
        //                                          src="https://res.cloudinary.com/dyatpgcxn/image/upload/v1670508787/cbsyvnsvkdva5hg7xrxn.jpg"
        //                                          class="img img-responsive img-thumbnail">
        //                                 </div>
        //                                 <div class="col-md-10 panel-footer my-date-1">
        //                                     <p style="color:green;"> Vũ Nam</p>
        //                                     <p> ${data.comment}</p>
        //                                     <p style="color: green;">${moment(data.createdComment).fromNow()}</p>
        //                                 </div>
        //
        //         ` + area.innerHTML;
        console.log("Success");
        location.reload();// reload lai hơi cùi nhưng mình nghĩ là chuẩn nhất. nếu không post này cần trả về thêm thông thin thì js ms lấy được
    }).catch(
        function (data){
            console.log("loi roi coi lai di")
        }
    )
};


