<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html  lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 
    <meta name="viewport" content="width=device-width" />

    <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/humane/libnotify.css"/>
    <link rel="stylesheet" href="css/collected/main.css"/>
    <link rel="stylesheet" href="css/collected/c3.min.css"/>

    <script type="text/javascript"  src="js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
    <script type="text/javascript"  src="js/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript"  src="js/d3/d3.min.js"></script>
    <script type="text/javascript"  src="js/d3/c3.min.js"></script>


    <script type="text/javascript" src="js/humane/humane.min.js"/></script>


 
    <script>
        var contextRoot ='${pageContext.request.contextPath}' + '/';
    </script>
 
    <script src="js/collected/main.js"/></script>

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
                <a href="./ODM_Dashboard.do">
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
    <div class="col-sm-9 col-sm-offset-2 col-lg-10 col-lg-offset-2 main">
        <div class="row" style="padding-bottom: 20px;">
            <h1>Status of open data collected</h1>
        </div>
        <div class="row" style="padding-bottom: 50px;">
            <div id="dataStat" style="float :left; width:45%; margin-left:10px;"></div>
            <div id="dataTypeStat" style="float :left; width:45%;"></div>
        </div>
        <div class="row">
            <div class="table-responsive">
                <table class="table" id="indexTable">
                    <thead>
                        <tr>
                            <th >Num</th>
                            <th >Name of open data</th>
                            <th >Provider</th>
                            <th >Provider URL</th> 
                            <th >Time(unit: minute)</th>
                            <th >Remark</th>
                            <th >Collecting stage</th>
                            <th >Request type</th>
                        </tr>
                    </thead>
                    <tbody>
                      <!--
                        <tr>&lt;!&ndash;test data&ndash;&gt;
                            <td>1</td>
                            <td>Seoul Environment in Korea</td>
                            <td>Seoul</td>
                            <td>data.seoul.go.kr</td>
                            <td>http://openAPI.seoul.go.kr:8088</td>
                            <td>1 Hour</td>
                            <td>ON</td>
                        </tr>
                       -->
                    </tbody>
                </table>
            </div>
        </div>


    </div>
</body>
</html>