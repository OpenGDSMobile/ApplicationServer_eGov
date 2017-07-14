<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>모바일 웹 매핑 솔루션 통합 데모</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
    <!-- dependency library CSS-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css">   <!-- jQuery Mobile -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css">      <!-- eGov Mobile -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/ol3/ol.css">                      <!-- OpenLayers 3 -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jQueryPlugins/jquery.dataTables.min.css">      <!-- Data Table Plug-in -->

    <!-- dependency library JS-->
    <!-- egovFramework  KOREA-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>      <!-- jQuery -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script> <!-- jQuery Mobile -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>      <!-- eGov Mobile -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jQueryPlugins/jquery.dataTables.min.js"></script> <!-- Data Table jQuery Plug-in-->

    <!-- Proj, OpenLayers3, D3 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/proj4js/2.2.2/proj4.js"></script>                         <!-- Proj4js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ol3/ol.js"></script>                                      <!-- OpenLayers 3 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/d3/d3.min.js"></script>                                       <!-- D3.js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/d3/topojson.v1.min.js"></script>                          <!-- d3.js topojson-->

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Sortable.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/openGDSMobile/openGDSMobilelib.js"></script>
    
    <script>
		var contextPath ='${pageContext.request.contextPath}';
		var addr = 'http://' + '${pageContext.request.serverName}';
		var port = '${pageContext.request.serverPort}';
		var serverAddr = addr + ':' + port + contextPath;
		var geoServerWS = 'OpenGDSMobile';
		var wsServerAddr = 'ws://' + '${pageContext.request.serverName}' + ':' + port + contextPath;
		var geoServerAddr = 'http://113.198.80.9';
		var workspace = "OpenGDSMobile";
    </script>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">      
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>	
</head><body>
<div data-role="page">
    <!--Content-->
	<div data-role="content" style="padding:0; margin:0;">
        <div id="map" style="padding:0; margin:0;"></div>
        <div id="menuButton" class="OGDSPosTopCenter">
            <div data-role="controlgroup" data-type="horizontal">
                <a href="#vworldList" data-role="button" data-rel="popup" data-mini="true" data-inline="true"
                   data-position-to="window" onclick="vworldWMSUI()">국토/토지(공간정보오픈플랫폼:VWorld)</a>
                <a href="#WFSList" data-role="button" data-rel="popup" data-mini="true" data-inline="true" data-transition="slidefade">
                    도로명 전자지도(국가공간정보유통시스템)</a>
                <a href="#opendataList" data-role="button" data-rel="popup" data-mini="true" data-inline="true" data-transition="slidefade">
                    공공 데이터</a>
                <a href="#attrDataList" data-role="button" data-rel="popup" data-mini="true" data-inline="true" data-transition="slidefade">
                    저장 데이터(속성정보)</a>
            </div>
        </div>
        <div id="mapSelect" class="OGDSPosTopRight"></div>
        <div id="layerList"></div>
        <div id="dataViewCheckBox" class="OGDSPosBottomRight OGDSPosTransLeftHide">
            <fieldset data-role="controlgroup" data-type="horizontal">
                <input type="checkbox" id="attrChk" data-theme="g"> <label for="attrChk">속성정보</label>
                <input type="radio" id="editOff" name="editFlag" data-theme="a" value="exit" checked> <label for="editOff">편집모드 종료</label>
                <input type="radio" id="editOffline" name="editFlag" data-theme="a" value="offline"> <label for="editOffline">편집</label>
                <input type="radio" id="editOnline" name="editFlag" data-theme="a" value="online"> <label for="editOnline">실시간 편집</label>
            </fieldset>
        </div>
        <div id="attributeTable" class="OGDSPosTransTopDownHide">
        </div>
	</div>

    <!---custom div-->
    <!-- d3And Map div -->
    <div id="interpolationMap">
		<a href="#" data-role="button"
		     data-theme="a" data-icon="delete"
		     data-iconpos="notext" class="ui-btn-right" onclick="$('#interpolationMap').hide()"> Close</a><br>
		<img id="interpolationMapImage" src="" alt="환경지도범위"/>
		</div>
		<div id="d3viewonMap">
		  <a href="#" data-role="button"
		     data-theme="a" data-icon="delete"
		     data-iconpos="notext" class="ui-btn-right" onclick="$('#d3viewonMap').hide()"> Close</a>
		  <div id="range">
              			<table style="margin:0 auto">
              				<tr>
              					<td style="background:#0090ff; margin:0; padding:0">　</td>
              					<td style="background:#008080; margin:0; padding:0">　</td>
              					<td><span class="font">Good</span></td>
              					<td style="background:#4CFF4C; margin:0; padding:0">　</td>
              					<td style="background:#99FF99; margin:0; padding:0">　</td>
              					<td><span class="font">Normal</span></td>
              					<td style="background:#FFFF00; margin:0; padding:0">　</td>
              					<td style="background:#FFFF99; margin:0; padding:0">　</td>
              					<td><span class="font">Sensitive</span></td>
              					<td style="background:#FF9900; margin:0; padding:0">　</td>
              					<td><span class="font">Bad</span></td>
              					<td style="background:#FF0000; margin:0; padding:0">　</td>
              					<td><span class="font">Very Bad</span></td>
              				</tr>
              			</table>
            </div>
            <div id="d3viewonMap_sub"> </div>
		</div>
<!-- Vworld WMS -->
		<div data-role="popup"
		id="vworldList"
		data-overlay-theme="a"
		style="padding: 15px">
            <p>서로 다른 레이어 최대 5개 선택 가능</p>
            <div id="vworldSelect"> </div>
		</div>
<!-- Public Data PopUp -->
		<div id="setting"
		data-role="popup"
		data-overlay-theme="a"
		style="width:250px; text-align:center; align:center;">
		</div>
<!-- Public Data Select -->
		<div data-role="popup" id="dataSelect" data-overlay-theme="a">
		  <div class="range">
              			<table style="margin:0 auto">
              				<tr>
              					<td style="background:#0090ff; margin:0; padding:0">　</td>
              					<td style="background:#008080; margin:0; padding:0">　</td>
              					<td><span class="font">Good</span></td>
              					<td style="background:#4CFF4C; margin:0; padding:0">　</td>
              					<td style="background:#99FF99; margin:0; padding:0">　</td>
              					<td><span class="font">Normal</span></td>
              					<td style="background:#FFFF00; margin:0; padding:0">　</td>
              					<td style="background:#FFFF99; margin:0; padding:0">　</td>
              					<td><span class="font">Sensitive</span></td>
              					<td style="background:#FF9900; margin:0; padding:0">　</td>
              					<td><span class="font">Bad</span></td>
              					<td style="background:#FF0000; margin:0; padding:0">　</td>
              					<td><span class="font">Very Bad</span></td>
              				</tr>
              			</table>
            </div>
			<div id="d3View"> </div>
		</div>
<!-- Attribute Data Save -->
        <div data-role="popup" id="attrDataList">
            <p id="NotData">데이터 없음</p>
            <ul data-role="listview" id="attrList">

            </ul>
        </div>
<!--WFS PopUp-->
        <div data-role="popup" id="WFSList">
            <ul data-role="listview" id="wfslayersList">
                <li data-theme="z" data-role="list-divider">도로명 전자지도</li>
                <li><a href="#" onclick="wfsLoad('seoul_sig', 'sig_kor_nm')">서울특별시(구 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('seoul_emd', 'emd_kor_nm')">서울특별시(동 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('incheon_emd', 'emd_kor_nm')">인천광역시(동 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('sejong_emd', 'emd_kor_nm')">세종특별자치시(동 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('daejong_emd', 'emd_kor_nm')">대전광역시(동 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('daegu_emd', 'emd_kor_nm')">대구광역시(동 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('ulsan_emd', 'emd_kor_nm')">울산광역시(동 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('gwangju_emd', 'emd_kor_nm')">광주광역시(동 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('busan_emd', 'emd_kor_nm')">부산광역시(동 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('chungbuk_sig', 'sig_kor_nm')">충청북도(구 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('chungnam_sig', 'sig_kor_nm')">충청남도(구 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('gangwon_sig', 'sig_kor_nm')">강원도(구 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('gyeonggi_sig', 'sig_kor_nm')">경기도(구 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('Gyeongsangbuk_sig', 'sig_kor_nm')">경상북도(구 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('Gyeongsangnam_sig', 'sig_kor_nm')">경상남도(구 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('Jeju_sig', 'sig_kor_nm')">제주도(구 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('Jellanam_sig', 'sig_kor_nm')">전라남도(구 단위)</a></li>
                <li><a href="#" onclick="wfsLoad('Jeollabuk_sig', 'sig_kor_nm')">전라북도(구 단위)</a></li>
            </ul>
        </div>
<!--Open Data PopUp-->
        <div data-role="popup" id="opendataList">
            <ul data-role="listview">
                <li data-theme="z" data-role="list-divider">데이터 셋</li>
                <li><a href="#" onclick="wfsLoad('seoul_env_position', 'name')">환경 센서위치(서울열린데이터광장)</a></li>
                <li><a href="#" onclick="wfsLoad('city_wer_mse_esb_loca_w','point')">도시 기상 관측망(서울열린데이터광장)</a></li>
                <!--
                <li><a href="#" onclick="wfsLoad('sejong_population_wgs84')">인구 데이터(세종특별시2013.1.-2014.2.)</a></li>
                <li><a href="#" onclick="kMapLoad('SIDO')">전국 지도(시도 단위)</a></li>
                <li><a href="#" onclick="kMapLoad('GU')">전국 지도(구 단위)</a></li>
                <li><a href="#" onclick="kMapLoad('DONG')">전국 지도(동 단위)</a></li> -->
                <li data-theme="z" data-role="list-divider">오픈 API</li>
                <li><a href="#" onclick="popupCloseEvent('seoul', 'env')">
                    서울시 실시간 대기환경(서울열린데이터광장)</a></li>
                <li><a href="#" onclick="popupCloseEvent('public', 'airKorea')">
                    전국 실시간 대기환경(공공데이터포털: 에어코리아)</a></li>
                <li><a href="#" onclick="popupCloseEvent('public', 'nuclear')">
                    원자력발전소 실시간 주변 방사선량(공공데이터포털: 한국수력원자력)</a></li>
              <!--   <li><a href="#" onclick="popupCloseEvent('public', 'greengas')">
                    온실가스배출량 조회 서비스(공공데이터포털: 한국지역난방공사)</a></li> -->
            </ul>
        </div>
<!-- current list-->
        <div data-role="popup" id="curList"  style="float:left; z-index:100;">
            <a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext"
               class="ui-btn-right">Close</a>
            <div id="localCurView" style="float:left" >
            </div>
            <div id="remoteCurView" style="float:left" >
            </div>
        </div>
<!-- input id PopUp-->
        <div data-role="popup" id="idInputDiv">
                <label for="idTextInput"> 아이디 입력 :</label>
                <input type="text" id="idTextInput" value="user">
                <input type="button" data-theme="b" id="editStartBtn" value="실시간 편집 시작">
        </div>

    </div>
</body>
</html>






