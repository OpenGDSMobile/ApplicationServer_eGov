<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width" />

    <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-select/bootstrap-select.min.css"/>
    <link rel="stylesheet" href="css/humane/libnotify.css"/>
    <link rel="stylesheet" href="css/collected/main.css"/>
    <link rel="stylesheet" href="css/collected/c3.min.css"/>
    <link src="stylesheet" href="css/ol3/ol.css"/>

    <script type="text/javascript"  src="js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
    <script type="text/javascript"  src="js/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript"  src="js/bootstrap-select/bootstrap-select.min.js"></script>


    <script type="text/javascript"  src="js/d3/d3.min.js"></script> 
    <script type="text/javascript" src="js/humane/humane.min.js"/></script> 
    <script type="text/javascript" src="js/proj4/proj4.js"></script>
    <script type="text/javascript" src="js/proj4/EPSGdefs.js"></script>


    <script src="js/ol3/ol-debug.js"></script>
    <script src="js/collected/geojson.min.js"></script>
    <script src="js/openGDSMobile/openGDSMobile-2.0.js"></script>
 
    <script>
        var contextRoot ='${pageContext.request.contextPath}' + '/';
    </script>

    <script src="js/collected/map.js"></script>

    <title>Dashboard for Open Data Management</title>
</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#siderbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><span">Dashboard for</span>
                                                <span class="blue">Open Data</span>
                                                <span>Management</span>
                </a>
            </div>
        </div>
    </nav>
    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <div class="brand"><img src="images/logo_hansung.png" width="120px"/></div>
        <ul class="nav menu">
            <li class="active">
                <a href="./ODM_Dashobard.do">
                    <span class="glyphicon glyphicon-off icon"></span>
                    <span>Dashboard</span>
                </a>
            </li>
            <li>
                <a href="./ODM_Management.do">
                    <span class="glyphicon glyphicon-scale icon"></span>
                    <span>Collect Management Process</span>
                </a>
            </li>
            <li class="parent">
                <a href="#">
                    <span data-toggle="collapse" href="#sub-item-1">
                        <span class="glyphicon glyphicon-chevron-down icon"></span>
                        <span>Visualization</span>
                    </span>
                </a>
                <ul class="children collapse" id="sub-item-1">
                    <li>
                        <a href="./ODM_Original.do">
                            <span class="glyphicon glyphicon-list-alt icon"></span>
                            <span>Source</span>
                        </a>
                    </li>
                    <li>
                        <a href="./ODM_Chart.do">
                            <span class="glyphicon glyphicon-signal icon"></span>
                            <span>Chart</span>
                        </a>
                    </li>
                    <li>
                        <a href="./ODM_Map.do">
                            <span class="glyphicon glyphicon-globe icon"></span>
                            <span>Map</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row" style="padding-bottom: 20px;">
        <h1>Data visualization (Map) </h1>
    </div>
    <div class="row" style="margin-bottom:20px;">
        <h2>Selecting geo-based data</h2>
        <select class="selectpicker" data-style="btn-primary" id="geoBasedName" data-width="95%"
                title="GeoServer or Public Data" data-size="10">
            <optgroup label="GeoServer" id="selectGeoServer">

            </optgroup>
            <optgroup label="Public Data" id="selectPublicData">

            </optgroup>
        </select>
    </div>
    <div class="row" id="addValues"  style="margin-bottom:20px;">
        <select class="bs-select-hidden add-values" data-style="btn-success" id="latValue" data-width="35%"
                title="Select latitude field" data-size="4">
        </select>

        <select class="bs-select-hidden add-values" data-style="btn-success" id="longValue" data-width="35%"
                title="Select longitude field" data-size="4">
        </select>

        <select class="bs-select-hidden add-values" data-style="btn-success" id="typeValue" data-width="10%"
                title="Select data type" data-size="4">
            <option value="point">point</option>
            <option value="polygon">polygon</option>
        </select>

        <select class="bs-select-hidden add-values" data-style="btn-success" id="coordValue" data-width="15%"
                title="Select coordinate type(EPSG)" data-size="4">
            <option value="EPSG:3857">EPSG:3857(Spherical Mercator)</option>
            <option value="EPSG:4326">EPSG:4326(WGS84)</option>
        </select>

    </div>

    <div class="row" >
        <div id="visMap" style="width:95%; height: 500px;">

        </div>
    </div>

</div>
</body>
</html>