
    <link rel="stylesheet" href="../includes/jqwidgets-ver3.9.1/jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="../includes/jqwidgets-ver3.9.1/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="../includes/jqwidgets-ver3.9.1/jqwidgets/jqxchart.core.js"></script>
    <script type="text/javascript" src="../includes/jqwidgets-ver3.9.1/jqwidgets/jqxdraw.js"></script>
    <script type="text/javascript" src="../includes/jqwidgets-ver3.9.1/jqwidgets/jqxdata.js"></script>
    <script type="text/javascript">
        $(document).ready(function () 
        {        
            // prepare jqxChart settings
            var settings = {
                title: "New registrations",
                description: "Number of registrations in the past 30 days",
                padding: { left: 5, top: 5, right: 5, bottom: 5 },
                titlePadding: { left: 90, top: 0, right: 0, bottom: 10 },
                source: <?php echo json_encode($regs); ?>,
                categoryAxis:
                    {
                        dataField: 'day',
                        showGridLines: false,
                        flip: true,
                        minValue: 0,
                        maxValue: 30
                    },
                colorScheme: 'scheme01',
                seriesGroups:
                    [
                        {
                            type: 'column',
                            columnsGapPercent: 30,
                            seriesGapPercent: 0,
                            valueAxis:
                            {
                                unitInterval: 1,
                                minValue: 0,
                                description: '#registrations'
                            },
                            series: [
                                    { dataField: 'regs' }
                                ]
                        }
                    ]
            };
            
            // select the chartContainer DIV element and render the chart.
            $('#chartContainer').jqxChart(settings);
        });
    </script>
  <div id='chartContainer' style="width:1000px; height: 400px;"/>