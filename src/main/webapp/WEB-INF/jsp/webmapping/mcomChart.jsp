<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>Mobile Web Application for Geospatial Data Using OpenGDS Mobile</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- dependency library CSS-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.3.2.css" >   <!-- jQuery Mobile -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.3.2.css">      <!-- eGov Mobile -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/ol3/ol.css">                      <!-- OpenLayers 3 -->

    <link rel="stylesheet" href="http://cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css">      <!-- Data Table Plug-in -->

    <!-- dependency library JS-->
    <!-- egovFramework  KOREA-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.9.1.min.js" charset="utf-8"></script>      <!-- jQuery -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.3.2.min.js" charset="utf-8"></script> <!-- jQuery Mobile -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.3.2.js" charset="utf-8"></script>      <!-- eGov Mobile -->
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js" charset="utf-8"></script> <!-- Data Table jQuery Plug-in-->

    <!-- Proj, OpenLayers3, D3 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/proj4js/2.2.2/proj4.js" charset="utf-8"></script>                         <!-- Proj4js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ol3/ol.js" charset="utf-8"></script>                                      <!-- OpenLayers 3 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/d3/d3.js" charset="utf-8"></script>                                       <!-- D3.js -->

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/OpenGDSMobileLib/openGDSMobileClient1.2.js" charset="utf-8"></script>
    
	
	<script>
		var contextPath ='${pageContext.request.contextPath}';
		var addr = 'http://' + '${pageContext.request.serverName}';
		var port = '${pageContext.request.serverPort}';
		var serverAddr = addr + ':' + port + contextPath;
		var geoServerAddr = addr;
		function search() {
            $.getJSON("<c:url value='/mbl/com/mcg/selectMobileChartGraphList.mdo'/>", function(json){
           		buildingList = json.resultList;
           		console.log(buildingList);
           		var xyData = OGDSM.jsonToArray(buildingList, 'xaxis', 'yaxis');
           		console.log(xyData);
			    var openGDSMObj = new OGDSM.visualization('map'); //map div, layerList switch
                openGDSMObj.barChart("chart", xyData); 
            });
		}
		$(function(){
			
		    search();
		});
	</script>
	
	<style>
        html, body{
            height : 100%;
        }

	</style>
</head>
<body>
<div data-role="page">
    <!--Content-->
	<div data-role="content" style="padding:0; margin:0;">
		모바일 공통 컴포넌트 : 모바일 차트 데이터 OpenGDS Mobile Library 이용 시각화 <br><br>
        <div id="map" style="padding:0; margin:0;"></div>
        <div id="chart" style="padding:0; margin:0;"></div>
	</div>
</div>
</body>
</html>

    