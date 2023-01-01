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


