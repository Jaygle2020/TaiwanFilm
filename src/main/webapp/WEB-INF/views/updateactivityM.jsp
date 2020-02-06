<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<title>updateactivityM</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/movie.css' type="text/css" />
<style>
.container h2{
	font-size: 40px;
	font-weight: bold;
	text-align: center;
}
.row{
	min-width: 1000px;
}
.row img{
	width:75%;
	height: 100%;
}

.col-md-5{
	width: 100%;
	font-size: 20px;
}

.activityImg{
	text-align: center;
	background-position: center;
	background-repeat: no-repeat;
	height: 500px;
}
</style> 
</head>
<body>

	<div class="header">
		<div class="h-logo" style="letter-spacing:-3px">
			<a href="<spring:url value='/activitiesM' />">
				<p class="Theme">TaiwanFilmsGuide
			</a>
		</div>
		
		
		
		<div class="left-menu">
			<div>
				<a href="">提案</a>
			</div>
			<div>
				<a href="">探索</a>
			</div>
			<div>
				<a href="">探索</a>
			</div>                                                                                               
		</div>
		<div class="right-menu">
			<div>
			<a href="<spring:url value='/activity?id=${activity.activityId}' />">登出</a>
			</div>
			<div>
				<a href="">我的帳戶</a>
			</div>
		</div>
	</div>




	<section class="container">
		<h2>${activity.activityTitle}(後台)</h2>
		<hr>
		<div class="row">
			<div class="activityimg" style="background-image: url('../../getPicture/${activity.activityId}');">
				<%--  <img src="<c:url value='/getPicture/${activity.activityId}'/>" />  --%>
			</div>	
			<hr>
			<div class="col-md-5">
				<h2>${activity.activityTitle}</h2>
				<h3 style="font-size: 20px;text-align: center">${activity.activityMainContent}</h3>
				<p style="font-size: 18px">${activity.activityContent}</p>
				<p style="font-size: 18px">活動狀態: ${activity.status}</p>	
					<strong>活動編號: </strong> <span class='label label-warning'>
						${activity.activityId} </span>
				</p>
				<p>
					<a href="<spring:url value='/activitiesM' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回
					</a> 
					<a href="<spring:url value='/update/activities/${activity.activityId}' />"
						class="btn btn-default"> <span
						class="glyphicon-hand-left glyphicon" style="width: 40%;display: inline-block"></span>修改
					</a> 
					<a href='#' class='btn btn-warning btn-large'>❤按讚
					</a>
				</p>
			</div>
		</div>
	</section>




</body>
</html>
