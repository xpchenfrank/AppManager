<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/jsp/head.jsp"  %>
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>客房管理系统</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
	
	<link href="css/bootstrap.css" rel="stylesheet" media="screen">
    <script src="js/bootstrap.min.js"></script>
    
    <style>
		body {
		  padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
		  font-family: "Microsoft YaHei",NSimSun,sans-serif;
		}
		
		html, body {
		  height: 100%;
		}
		
		.roomOnDiv {
			border: 1px black solid;
			height: 20%;
			line-height: 20%;
			background-color: #246FCC;
			cursor: pointer;
			color: white;
		}
		
		.roomOnDiv  #endDateDiv  {
			display: none;
		}
		
		.roomOffDiv {
			border: 1px black solid;
			height: 20%;
			line-height: 20%;
			background-color: #D6AA64;
			cursor: pointer;
			color: black;
		}
		
		.roomDelayDiv {
			border: 1px black solid;
			height: 20%;
			line-height: 20%;
			background-color: red;
			cursor: pointer;
			color: black;
		}
		
		.content {
			line-height: normal;
		}
		
		.content div  {
			line-height: normal;
		}
	</style>
    
    <!-- 
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
     -->

</head>

<body>
    
    <jsp:include page="/jsp/pageHeader.jsp"></jsp:include>
    
    <script src="js/highcharts/highcharts.js"></script>
    
    <script type="text/javascript">
    
        var options = {
       		chart: {
       		       renderTo: 'yearChartdiv',
                   type: 'column',
                   //margin: [ 50, 50, 100, 80]
               },
               title: {
                   text: '一年内收入统计',
                   margin: 50,
                   style: {
                       fontSize: '16px',
                       fontFamily: "'Microsoft YaHei',NSimSun,sans-serif",
                       fontWeight:'bold',
                   }
               },
               xAxis: {
            	   /*
                   categories: [
                    '1月',
                    '2月',
                    '3月',
                    '4月',
                    '5月',
                    '6月',
                    '7月',
                    '8月',
                    '9月',
                    '10月',
                    '11月',
                    '12月'
                   ],
                   */
                   labels: {
                       rotation: 0,
                       //align: 'right',
                       style: {
                           fontSize: '13px',
                           fontFamily: "'Microsoft YaHei',NSimSun,sans-serif",
                           fontWeight:'normal'
                       }
                   }
               },
               yAxis: {
                   min: 0,
                   //offset: 60,
                   title: {
                       margin: 20,
                       rotation: 0,
                       text: '每</br>月</br>收</br>入',
                       useHTML: true,
                       style: {
                           fontSize: '15px',
                           fontFamily: "'Microsoft YaHei',NSimSun,sans-serif",
                           fontWeight:'normal'
                       }
                   }
               },
               legend: {
                   enabled: false
               },
               tooltip: {
                   pointFormat: '<b>{point.y:.1f} 元</b>',
               },
               series: [{
                   name: 'Income',
                   //data: [{'color':'#4BB2C5','y':'11'},{'color':'#C5B47F','y':'11'}],
                   //data: [{'color':'#4BB2C5','y':11},{'color':'#C5B47F','y':11}],
                   //data: [{'color':'#4BB2C5','y':11}, {'color':'#EAA228','y':12}],
                   /*
                   data: [{'color':'#4BB2C5','y':11}, 
                          {'color':'#EAA228','y':12}, 
                          {'color':'#C5B47F','y':13}, 
                          {'color':'#579575','y':14}, 
                          {'color':'#839557','y':15}, 
                          {'color':'#85802B','y':16}, 
                          {'color':'#00749F','y':17},
                          {'color':'#73C774','y':13}, 
                          {'color':'#C7754C','y':14}, 
                          {'color':'#17BDB8','y':15}, 
                          {'color':'#D64646','y':16}, 
                          {'color':'#8E468E','y':17}],
                   */
                   dataLabels: {
                       enabled: true,
                       rotation: 0,
                       color: 'black',
                       align: 'top',
                       //x: 4,
                       //y: 10,
                       style: {
                           fontSize: '13px',
                           fontFamily: 'Verdana, sans-serif',
                           textShadow: '0 0 3px black'
                       }
                   }
               }]
        };
        
        var dayOptions = {
                chart: {
                	renderTo: 'monthChartdiv',
                    //zoomType: 'x',
                    //spacingRight: 20
                },
                title: {
                    text: '最近一月内收入统计',
                    margin: 50,
                    style: {
                        fontSize: '16px',
                        fontFamily: "'Microsoft YaHei',NSimSun,sans-serif",
                        fontWeight:'bold',
                    }
                },
                xAxis: {

                    /*
                    type: 'datetime',
                    maxZoom: 14 * 24 * 3600000, // fourteen days
                    title: {
                        text: null
                    }
                    */
                },
                yAxis: {
                	min: 0,
                	title: {
                        margin: 20,
                        rotation: 0,
                        text: '每</br>日</br>收</br>入',
                        useHTML: true,
                        style: {
                            fontSize: '15px',
                            fontFamily: "'Microsoft YaHei',NSimSun,sans-serif",
                            fontWeight:'normal'
                        }
                    }
                },
                tooltip: {
                    shared: true
                },
                legend: {
                    enabled: false
                },
                plotOptions: {
                    area: {
                        fillColor: {
                            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
                            stops: [
                                [0, Highcharts.getOptions().colors[0]],
                                [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                            ]
                        },
                        lineWidth: 1,
                        marker: {
                            enabled: false
                        },
                        shadow: false,
                        states: {
                            hover: {
                                lineWidth: 1
                            }
                        },
                        threshold: null
                    }
                },
                series: [{
                    type: 'area',
                    name: '当天收入'
                    /*
                    data: [
                           0.8446, 0.8445, 0.8444, 0.8451,    0.8418, 0.8264,    0.8258, 0.8232,    0.8233, 0.8258,
                           
                       ]
                    */
                    /*
                    pointInterval: 24 * 3600 * 1000,
                    pointStart: Date.UTC(2006, 0, 01),
                    data: [
                        0.8446, 0.8445, 0.8444, 0.8451,    0.8418, 0.8264,    0.8258, 0.8232,    0.8233, 0.8258,
                        
                    ]
                    */
                }]
            };
        
        jQuery(function() {
        	
        	$.ajax( {
                type : "POST",
                url : ctxRoot + 'lj/roomCtrl/getRecentMonthlyIncome',
                data: "rentRoom=test",
                dataType: "json",
                ifModified: true,
                success : function(data) {
                	//alert("data.test is " + JSON.stringify(data.test));
                	//alert("sdfsdfsd " + data.test);
                	options.series[0].data = data.series;
                	options.xAxis.categories = data.categories;
                	var chart = new Highcharts.Chart(options);
                },
                error : function(data) {
                	alert("error data is " + data[0]);
                	options.series[0].data = data;
                    var chart = new Highcharts.Chart(options);
                }
            });
        	
            $.ajax( {
                type : "POST",
                url : ctxRoot + 'lj/roomCtrl/getRecentDailyIncome',
                data: "rentRoom=test",
                dataType: "json",
                ifModified: true,
                success : function(data) {
                    //alert("data.test is " + JSON.stringify(data.test));
                    //alert("sdfsdfsd " + data.test);
                    dayOptions.series[0].data = data.data;
                    dayOptions.xAxis.categories = data.categories;
                    var dayChart = new Highcharts.Chart(dayOptions);
                }
            });
        	
            /*
            $('#monthChartdiv').highcharts({
                chart: {
                    zoomType: 'x',
                    spacingRight: 20
                },
                title: {
                    text: 'USD to EUR exchange rate from 2006 through 2008'
                },
                subtitle: {
                    text: document.ontouchstart === undefined ?
                        'Click and drag in the plot area to zoom in' :
                        'Pinch the chart to zoom in'
                },
                xAxis: {

                },
                yAxis: {
                    title: {
                        text: 'Exchange rate'
                    }
                },
                tooltip: {
                    shared: true
                },
                legend: {
                    enabled: false
                },
                plotOptions: {
                    area: {
                        fillColor: {
                            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
                            stops: [
                                [0, Highcharts.getOptions().colors[0]],
                                [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                            ]
                        },
                        lineWidth: 1,
                        marker: {
                            enabled: false
                        },
                        shadow: false,
                        states: {
                            hover: {
                                lineWidth: 1
                            }
                        },
                        threshold: null
                    }
                },
        
                series: [{
                    type: 'area',
                    name: 'USD to EUR',
                    data: [
                           0.8446, 0.8445, 0.8444, 0.8451,    0.8418, 0.8264,    0.8258, 0.8232,    0.8233, 0.8258,
                           
                       ]

                }]
            });
            */
        	
        });
    </script>
    
    <div style="height: 10%; min-height: 30px; max-height: 60px;">
    </div>
     
     <!-- 
     <div class="container">
     	<div class="row text-center" style="margin-top: 10px;">
	       <div style="font-size: 417%;margin-bottom: 50px;color:black;"></div>
     	</div>
     </div>
      -->
     
    <div class="container">
    
	    <div class="row text-center" style="margin-top: 10px;">
	            <div class="span10" >
	               <div id="yearChartdiv"></div>
	            </div>
	            <!-- 
	            <div class="span3" style="border:1px solid black;-webkit-border-radius: 8px;-moz-border-radius: 8px;border-radius: 8px;">
	                sdfsdfdsf<br/>
                    sdfsdfdsf<br/>
                    sdfsdfdsf<br/>
                    sdfsdfdsf<br/>
                    sdfsdfdsf<br/>
	            </div>
	             -->
	    </div>
	    
	    <div class="row text-center" style="margin-top: 10px;">
                <div class="span10" >
                   <div id="monthChartdiv"></div>
                </div>
                <!-- 
                <div class="span3">

                </div>
                 -->
        </div>
	    
    </div>
    
    <!--  
    <div id="testDiv" style="width: 1000px;border:1px solid black;"></div>
     -->
    
</body>
</html>