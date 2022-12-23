function addToCart(productId){
    console.log("oddasdsdsd");
    fetch("/WebShopSPringMVC_war/api/cart",{
        method:'post',
        body: JSON.stringify({
            "productId":productId,
        }),
        headers:{
            "Content-Type":"application/json"
        }
    }).then(function (res){
        console.log("odd234234234");
        //return res.json(); // do mminh lam tra ve so nguyen nen can path sang json
    }).then(function (data){
        // var d=document.getElementById("cart-counter")
        // if (d !== null){
        //     d.innerText = data;
        // }
    })
}