window.draw_graph = -> 
    ctx = document.getElementById("myChart").getContext('2d')
    barNum = 12
    labels = new Array(barNum)
    bgColors_income = new Array(barNum)
    bdColors_income = new Array(barNum)
    bgColors_expense = new Array(barNum)
    bdColors_expense = new Array(barNum)
    bgColors_carryover = new Array(barNum)
    bdColors_carryover = new Array(barNum)

    for i in [0...barNum]
        labels[i] = i+1 +'月'
        bgColors_income[i] = 'rgba(255, 99, 132, 1.0)'
        bdColors_income[i] = 'rgba(255, 99, 132, 1.0)'
        bgColors_expense[i] = 'rgba(54, 162, 235, 1.0)'
        bdColors_expense[i] = 'rgba(54, 162, 235, 1.0)'
        bgColors_carryover[i] = 'rgba(75, 192, 192, 0.2)'
        bdColors_carryover[i] = 'rgba(75, 192, 192, 1.0)'
    myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: '収入',
                data: gon.data_income, 
                backgroundColor: bgColors_income,
                borderColor: bdColors_income,
                borderWidth: 1
            },{
                label: '支出',
                data: gon.data_expense, 
                backgroundColor: bgColors_expense,
                borderColor: bdColors_expense,               
                borderWidth: 1,
                type: 'bar'
            },{
                label: '繰越',
                data: gon.data_carryover, 
                backgroundColor: bgColors_carryover,
                borderColor: bdColors_carryover,       
                borderWidth: 1,
                type: 'bar'                
            }]
        },
        options: {
           title: {
            display: true,
            text: 'キャッシュフロー（月別）(単位：円）' 
                 
            scales: {
                yAxes: [{
                    ticks: {         
                        beginAtZero:true
                    }
                }]
            }
          }
        }  
      })