<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<h3>데이터의 시각화</h3>
	<div id="chartV" style="width:300px; height: 300px;">
	
	</div>
	<small>google pie chart</small>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	google.charts.load("current", {"packages":["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {	
		// 데이터테이블 이용해서 셋팅
		var data = new google.visualization.DataTable();
	    data.addColumn('string', 'Gender');
	    data.addColumn('number', 'Count');
	    data.addRows(${json});
	    
		  var options = {
		    "title": "남/녀 성비",
		    "is3D" : true
		  };
		
		  var chart = new google.visualization.PieChart(document.getElementById("chartV"));	
		  chart.draw(data, options);
	}
</script>