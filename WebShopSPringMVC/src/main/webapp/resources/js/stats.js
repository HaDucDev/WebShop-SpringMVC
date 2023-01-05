//ham random color
function generateCollor(){

    let r=parseInt(Math.random()*255);// sinh so ngau nhien tu 0 den 255
    let g=parseInt(Math.random()*255);
    let b=parseInt(Math.random()*255);
    return `rgb(${r},${g},${b})`
}


// ham thong to bieu do

function cateChart(id, cateLabels=[],cateInfor=[]){

    let  colors=[];

    for (let i=0; i< cateInfor.length;i++){
        colors.push(generateCollor())
    }

    const data = {
        labels: cateLabels,
        datasets: [{
            label: 'Thống kê sản phẩm',
            data: cateInfor,
            backgroundColor:colors,
            hoverOffset: 4
        }]
    };

    const config = {
        type: 'doughnut',
        data: data,
        options: {
            responsive: true,
            maintainAspectRatio: false
        }
    };

    let  ctx= document.getElementById(id).getContext("2d");

    new Chart(ctx, config);
}

