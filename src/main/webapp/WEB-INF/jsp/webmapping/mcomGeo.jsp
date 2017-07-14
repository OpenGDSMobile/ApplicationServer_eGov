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
    
	<link rel="stylesheet" href="<c:url value='/css/egovframework/mbl/mcomd/egovMcomd.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/egovframework/mbl/com/geo/geo.js'/>"></script>
	
	
	<script>
		var contextPath ='${pageContext.request.contextPath}';
		var addr = 'http://' + '${pageContext.request.serverName}';
		var port = '${pageContext.request.serverPort}';
		var serverAddr = addr + ':' + port + contextPath;
		var geoServerAddr = addr;
		var openGDSMObj = null; 
		
		function mapSelectUI(openGDSMObj) {
		    'use strict';
		    var ui = new OGDSM.eGovFrameUI();
		    ui.baseMapSelect(openGDSMObj, 'mapSelect', 'OSM VWorld VWorld_m VWorld_s VWorld_g'); //현재.... 데이터 체크...
		}
		function search() {
		    var ttt= '/mbl/com/geo/selectBuildingLocationInfoList.mdo';
            $.getJSON("<c:url value='/mbl/com/geo/selectMobileBuildingLocationInfoList.mdo'/>", $('#searchVO').serialize().replace(/%/g,'%25'), function(json){
           		buildingList = json.resultList;
           		console.log(buildingList);
           		var mapObj = openGDSMObj.getMap();
           		$.each(buildingList, function(i, d){
           			var lanlat = ol.proj.transform([Number(d.lo), Number(d.la)], 'EPSG:4326', 'EPSG:3857');
           			var geometry = new ol.geom.Point(lanlat);
           		    var r = Math.floor(Math.random() * 256),
           		        g = Math.floor(Math.random() * 256),
           		        b = Math.floor(Math.random() * 256);
           		    var color = 'rgb(' + r + ',' + g + ',' + b + ')';
           			var vector = new ol.layer.Vector({
           				title : d.buldNm,
           				source : new ol.source.Vector({
           					features : [new ol.Feature(geometry)]
           				}),
           				style : new ol.style.Style({
							image : new ol.style.Circle({
								radius : 5,
								fill : new ol.style.Fill({
									color : color
								}),
		                        stroke : new ol.style.Stroke({
		                            color : '#000000',
		                            width : 1
		                        })
		                    })
    		            })
           			});
           			openGDSMObj.addMap(vector, 'point');
           		});
            });
		}
		$(function(){
		    openGDSMObj = new OGDSM.visualization('map', {
		        layerListDiv : 'layerList'
		    });
		    openGDSMObj.olMapView([127.010031, 37.582200], 'OSM');
		    openGDSMObj.trackingGeoLocation(true);
		    mapSelectUI(openGDSMObj);
		    search();
		});
	</script>
	
	<style>
        html, body{
            height : 100%;
        }

        #map{
            position : absolute;
            width : 100%;
            height : 100%;
        }
        
        .OGDSPosTopRight{
            position : absolute;
            z-index : 1000;
            top : 8px;
            left : auto;
            right : 10px;
        }
        
        .OGDSPosTopCenter{
            position : absolute;
            z-index : 999;
            width : 100%;
            top : 8px;
            left : 45%;
            right : 45%;
        }
	</style>
</head>
<body>
<div data-role="page">
    <!--Content-->
	<div data-role="content" style="padding:0; margin:0;">
        <div id="map" style="padding:0; margin:0;"></div>

        <div id="mapSelect" class="OGDSPosTopRight"></div>

        <div id="layerList"></div>

		<div class="OGDSPosTopCenter">	
			<form id="searchVO" name="searchVO" method="post">
				<p>조회범위
				<select id="searchCondition" name="searchCondition" onchange="javascript:search()" data-role="none">
					<option value="100">100m 이내</option>
					<option value="200">200m 이내</option>
					<option value="300">300m 이내</option>
					<option value="500">500m 이내</option>
					<option value="1000">1km 이내</option>
					<option value="2000">2km 이내</option>
				</select>
				</p>
			</form>
		</div>
	</div>
</div>
</body>
</html>

    