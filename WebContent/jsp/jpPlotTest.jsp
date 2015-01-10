<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/jsp/head.jsp"  %>
    <base href="<%=basePath%>">
    
    <!--[if lt IE 9]><script language="javascript" type="text/javascript" src="excanvas.js"></script><![endif]-->
	<script language="javascript" type="text/javascript" src="js/jqplot/jquery.jqplot.min.js"></script>
	<link rel="stylesheet" type="text/css" hrf="js/jqplot/jquery.jqplot.min.css" />
	
	<script type="text/javascript" src="js/jqplot/plugins/jqplot.barRenderer.min.js"></script>
	<script type="text/javascript" src="js/jqplot/plugins/jqplot.pieRenderer.min.js"></script>
	<script type="text/javascript" src="js/jqplot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
	<script type="text/javascript" src="js/jqplot/plugins/jqplot.pointLabels.min.js"></script>
    
    <script type="text/javascript">
        jQuery(function() {

        	$.jqplot.config.enablePlugins = true;
            //var s1 = [2, 6, 7, 10];
            //var ticks = ['a', 'b', 'c', 'd'];
            
            var s1 = [[2002, 112000], [2003, 122000], [2004, 104000], [2005, 99000], [2006, 121000], 
                      [2007, 148000], [2008, 114000], [2009, 133000], [2010, 161000], [2011, 173000]];
             
            plot1 = $.jqplot('chart1', [s1], {
                // Only animate if we're not using excanvas (not in IE 7 or IE 8)..
                animate: !$.jqplot.use_excanvas,
                seriesDefaults:{
                    renderer:$.jqplot.BarRenderer,
                    pointLabels: { show: true }
                },
                /*
                axes: {
                    xaxis: {
                        renderer: $.jqplot.CategoryAxisRenderer,
                        ticks: ticks
                    }
                },
                */
                highlighter: { show: false }
            });
         
            $('#chart1').bind('jqplotDataClick', 
                function (ev, seriesIndex, pointIndex, data) {
                    $('#info1').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
                }
            );
             
        });
    </script>
</head>

<body>
    
    <div id="chart1" style="height:400px;width:1800px;"></div>
    
</body>
</html>