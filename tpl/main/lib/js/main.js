$(document).ready(function() {

    var echartBar = echarts.init(document.getElementById('canvasRadar'), theme);

    echartBar.setOption({
        title: {
            text: 'Indicateur des achat',
            subtext: '2015'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['sales', 'purchases']
        },
        toolbox: {
            show: true,
            feature: {
                restore: {
                    show: true,
                    title: "Restore"
                },
                saveAsImage: {
                    show: true,
                    title: "Save Image"
                }
            }
        },
        calculable: false,
        series: [{
                name: 'sales',
                type: 'pie',
                data: [{
                        value: 60,
                        name: 'Something #1'
                    }, {
                        value: 40,
                        name: 'Something #2'
                    }, {
                        value: 20,
                        name: 'Something #3'
                    }, {
                        value: 80,
                        name: 'Something #4'
                    }, {
                        value: 100,
                        name: 'Something #5'
                    }],
            }, {
                name: 'purchases',
                type: 'pie',
                data: [{
                        value: 60,
                        name: 'Something #1'
                    }, {
                        value: 40,
                        name: 'Something #2'
                    }, {
                        value: 20,
                        name: 'Something #3'
                    }, {
                        value: 80,
                        name: 'Something #4'
                    }, {
                        value: 100,
                        name: 'Something #5'
                    }],
            }]
    });

})
