// ham thong to bieu do

function cateChart(id, cateLabels=[],cateInfor=[]){
    const data = {
        labels: cateLabels,
        datasets: [{
            label: 'Thống kê sản phẩm',
            data: cateInfor,
            backgroundColor: [
                'rgb(255, 99, 132)',
                'rgb(54, 162, 235)',
                'rgb(255, 205, 86)',
                'rgb(180, 205, 86)',
                'rgb(255,210, 99)'
            ],
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

