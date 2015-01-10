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
    
	
	<!-- 
	<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="js/bootstrap.min.js"></script>
     -->
    
    <style>
		body {
		  padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
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
    
    <!--[if lt IE 9]><script language="javascript" type="text/javascript" src="excanvas.js"></script><![endif]-->
    <script language="javascript" type="text/javascript" src="js/jqplot/jquery.jqplot.min.js"></script>
    <link rel="stylesheet" type="text/css" href="js/jqplot/jquery.jqplot.css" />
    
	<script type="text/javascript" src="js/jqplot/plugins/jqplot.barRenderer.min.js"></script>
	<script type="text/javascript" src="js/jqplot/plugins/jqplot.highlighter.min.js"></script>
	<script type="text/javascript" src="js/jqplot/plugins/jqplot.cursor.min.js"></script>
	<script type="text/javascript" src="js/jqplot/plugins/jqplot.pointLabels.min.js"></script>
    
    <script type="text/javascript">
        jQuery(function() {

            var s1 = [];
            var s2 = [[2002, 10200], [2003, 10800], [2004, 11200], [2005, 11800], [2006, 12400], 
            [2007, 12800], [2008, 13200], [2009, 12600], [2010, 13100]];
         
            plot1 = $.jqplot("testDiv", [s2,s1], {
                // Turns on animatino for all series in this plot.
                animate: true,
                // Will animate plot on calls to plot1.replot({resetAxes:true})
                animateReplot: true,
                cursor: {
                    show: true,
                    zoom: true,
                    looseZoom: true,
                    showTooltip: false
                },
                series:[
                    {
                        pointLabels: {
                            show: true
                        },
                        renderer: $.jqplot.BarRenderer,
                        showHighlight: false,
                        yaxis: 'y2axis',
                        rendererOptions: {
                            // Speed up the animation a little bit.
                            // This is a number of milliseconds.  
                            // Default for bar series is 3000.  
                            animation: {
                                speed: 2500
                            },
                            barWidth: 15,
                            barPadding: -15,
                            barMargin: 0,
                            highlightMouseOver: false
                        }
                    }, 
                    {
                        rendererOptions: {
                            // speed up the animation a little bit.
                            // This is a number of milliseconds.
                            // Default for a line series is 2500.
                            animation: {
                                speed: 2000
                            }
                        }
                    }
                ],
                axesDefaults: {
                    pad: 0
                },
                axes: {
                    // These options will set up the x axis like a category axis.
                    xaxis: {
                        tickInterval: 1,
                        drawMajorGridlines: false,
                        drawMinorGridlines: true,
                        drawMajorTickMarks: false,
                        rendererOptions: {
                        tickInset: 0.5,
                        minorTicks: 1
                    }
                    },
                    yaxis: {
                        tickOptions: {
                            formatString: "$%'d"
                        },
                        rendererOptions: {
                            forceTickAt0: true
                        }
                    },
                    y2axis: {
                        tickOptions: {
                            formatString: "$%'d"
                        },
                        rendererOptions: {
                            // align the ticks on the y2 axis with the y axis.
                            alignTicks: true,
                            forceTickAt0: true
                        }
                    }
                },
                highlighter: {
                    show: true, 
                    showLabel: true, 
                    tooltipAxes: 'y',
                    sizeAdjust: 7.5 , tooltipLocation : 'ne'
                }
            });
             
        });
    </script>
    
    <div style="height: 10%; min-height: 30px; max-height: 60px;">
    </div>
     
     <div class="container">
     	<div class="row text-center" style="margin-top: 10px;">
			    <div style="font-size: 417%;margin-bottom: 50px;color:black;">收入统计</div>
     	</div>
     </div>
     
    <div class="container">
    
	    <div class="row text-center" style="margin-top: 10px;">
	            <div class="span8" >
	               <div id="yearChartdiv"></div>
	            </div>
	            <div class="span3">
	                
	            </div>
	    </div>
	    
	    <div class="row text-center" style="margin-top: 10px;">
                <div class="span8" >
                   <div id="monthChartdiv"></div>
                </div>
                <div class="span3">
                    
                </div>
        </div>
	    
    </div>
    
    
    <div id="testDiv"></div>
    
</body>
</html>