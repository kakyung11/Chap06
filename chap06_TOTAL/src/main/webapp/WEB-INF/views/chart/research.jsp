<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<h2>평가 결과</h2>
	
	<div id="chartV">
	
	</div>
	<small>google bar chart</small>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawStuff);
	
	function drawStuff() {
	  var data = new google.visualization.DataTable();
	  data.addColumn('number', 'score');
	  data.addColumn('number', 'cnt');
	  data.addColumn({'type':'string','role':'style'});
	  data.addRows(${json});
	  
	  var options = {
			  width: 600
	   
	  };
	  
	  var chart = new google.visualization.ColumnChart(document.getElementById('chartV'));
      chart.draw(data, options);
	  
    };
</script>