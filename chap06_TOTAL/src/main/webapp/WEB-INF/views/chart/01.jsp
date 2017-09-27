<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<h3>데이터의 시각화</h3>
	<c:forEach var="t" items="${list }" varStatus="vs">
		${t.GENDER } : ${t.CNT } <c:if test="${!vs.last }">|</c:if>
	</c:forEach>
	<div id="chartV" style="width:300px; height: 300px;">
	
	</div>
	<small>google pie chart</small>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	google.charts.load("current", {"packages":["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {	
	 /*// 2차원 배열 형태의 데이터 셋팅
		var data = google.visualization.arrayToDataTable([
	    ["Task", "Hours per Day"],
	    ["Work",     11],
	    ["Eat",      2],
	    ["Commute",  2],
	    ["Watch TV", 2],
	    ["Sleep",    7]
	  ]);
	*/
	
	// 데이터테이블 이용해서 셋팅
	var data = new google.visualization.DataTable();
    data.addColumn('string', 'Gender');
    data.addColumn('number', 'count');
    data.addRows([
    	<c:forEach var="t" items="${list }" varStatus="vs">
			["${t.GENDER }",  ${t.CNT }] 
			<c:if test="${!vs.last }">,</c:if>
		 </c:forEach>
    ]);
    
	  var options = {
	    "title": "남/녀 성비",
	    "is3D" : true
	  };
	
	  var chart = new google.visualization.PieChart(document.getElementById("chartV"));	
	  chart.draw(data, options);
	}
</script>