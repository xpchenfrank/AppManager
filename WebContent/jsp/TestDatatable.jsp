<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/jsp/head.jsp"  %>
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>无线城市 - 畅想无限精彩</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    
    <!-- DataTables CSS -->
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.4/css/jquery.dataTables.css">
	  
	<!-- DataTables -->
	<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.4/js/jquery.dataTables.js"></script>
    
    <script type="text/javascript">
	    $(document).ready( function () {
	        $('#table_id').DataTable();
	     } );
	</script>

    <style>
        /*
        html,body {
            background-color: #F0F0F0;
            height: 100%;
        }*/
		.homeTitle {
            background-color: #83BA04;
        }
        
        .homeColumn {
            height: 44px;
            font-size: 18px;
            color: white;
            text-align: center;
            line-height: 44px;
        }
        
        .homeColumn {
            height: 44px;
            font-size: 18px;
            color: white;
            text-align: center;
            line-height: 44px;
        }
        
        .packageColumn img {
            display: block; width: 100%; height: auto;
        }
        /*
        .packageRow {
            height: 20%;
            border: 1px black solid;
        }
        
        .packageRow div {
            height: 100%;
            border: 1px black solid;
        }
        
        .packageRow div div {
            height: 100%;
            border: 1px black solid;
        }
        */
	</style>

</head>

<body>
    <table id="table_id" class="display">
    <thead>
        <tr>
            <th rowspan="2">姓名</th>
            <th rowspan="2">工号</th>
            <th colspan="3">工号</th>
        </tr>
        <tr>
            <th >当日</th>
            <th >当周</th>
            <th >当月</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
            <td>Row 1 Data 3</td>
            <td>Row 1 Data 4</td>
            <td>Row 1 Data 5</td>
        </tr>
        <tr>
            <td>Row 2 Data 1</td>
            <td>Row 2 Data 2</td>
        </tr>
    </tbody>
    </table>
    
    
</body>
</html>