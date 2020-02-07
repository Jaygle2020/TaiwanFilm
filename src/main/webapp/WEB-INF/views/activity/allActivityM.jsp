<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/movie.css' type="text/css" />
<title>allActivityM</title>

<style>
body {
	background: #f1f1f1;
}

.activity-content{
	width: 100%;
	padding:10px;
	border-radius:10px;
	margin:10px;
	font-weight: bold;
	background: white;
}

.activity-content-show{
	width: 100%;
	padding:10px;
	border-radius:10px;
	margin:10px;
	font-weight: bold;
}

.allActivityM-width {
	width: 25%;
	height: 200px;
	display: inline-block;
}


.acitivityUpdateWidth{
	width:21%;
	padding:20px;
	display: inline-block;
	vertical-align:top; 
	text-align: center;
	color: black;
	
}

.activityUpdateButton{
	width: 7%;
	display:inline-block;
	margin-top:12px;
	text-align: center;
}

.activityUpdateButtonStyle{
	width:100%;
	color:white;
	background-color:red;
	padding:3px;
	border-radius:3px
}
</style>
</head>
<body>
	<div class="header">
		<div class="h-logo" style="letter-spacing: -3px">
			<a href="activitiesM">
				<p class="Theme">TaiwanFilmsGuide
			</a>
		</div>

		<div class="left-menu"></div>
		<div class="right-menu">
			<div>
				<a href="allActivity">登出</a>
			</div>

		</div>
	</div>


	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>全部活動內容(員工後台)</h1>
				<a href='activities/add' style="font-size: 25px; font-weight: bold;">新增活動消息</a>
			</div>
		</div>
	</section>

	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
  
	<section class="container">
		<div class="category-content">
			<a href="activitiesM">
				<div style="position:relative;right:20px;width:30%;font-weight: bold;display: inline-block;">回到分類頁面</div>
			</a>
			<div class="activity-content-show">
				<div class="acitivityUpdateWidth">活動序號</div>
				<div class="acitivityUpdateWidth">活動主題</div>
				<div class="acitivityUpdateWidth">活動廠商</div>
				<div class="acitivityUpdateWidth">活動開始時間</div>
				<div class="activityUpdateButton">
					<div class="activityUpdateButtonStyle">上架</div>
				</div> 
			</div> 
			<c:forEach var='activity' items='${activities}'>
				<c:if test="${activity.category == '1'}">
					<a href="<spring:url value='/activity?id=${activity.activityId}' />"
						class="anchor-style"> 
						<a href="<spring:url value='/queryMyActivity/${activity.activityId}' />">
							<div class="activity-inner"
								data-number="${activity.activityWatched}">
								<div class="activity-content">  
									<div class="acitivityUpdateWidth"style="color:red">${activity.activityNumber}</div>
									<div class="acitivityUpdateWidth">${activity.activityTitle}</div>
									<div class="acitivityUpdateWidth">${activity.activityAuthor}</div>
									<div class="acitivityUpdateWidth">${activity.startTime}</div>
									<div class="activityUpdateButton"><a href="<spring:url value='/update/activities/${activity.activityId}' />"
											class="btn btn-primary"> <span
											class="glyphicon-info-sigh glyphicon"></span>編輯 
										</a>  
									</div>  
								</div> 	
							</div>    
						</a> 
					</a> 
				</c:if>
			</c:forEach>

			<div class="activity-content-show">
				<div class="acitivityUpdateWidth">活動序號</div>
				<div class="acitivityUpdateWidth">活動主題</div>
				<div class="acitivityUpdateWidth">活動廠商</div>
				<div class="acitivityUpdateWidth">活動開始時間</div>
				<div class="activityUpdateButton">
					<div class="activityUpdateButtonStyle">未上架</div>
				</div> 
			</div>
			<c:forEach var='activity' items='${activities}'>
				<c:if test="${activity.category == '3'}">
					<a href="<spring:url value='/activity?id=${activity.activityId}' />"
						class="anchor-style"> 
						<a href="<spring:url value='/queryMyActivity/${activity.activityId}' />">
							<div class="activity-inner"
								data-number="${activity.activityWatched}">
								<div class="activity-content">  
									<div class="acitivityUpdateWidth"style="color:red">${activity.activityNumber}</div>
									<div class="acitivityUpdateWidth">${activity.activityTitle}</div>
									<div class="acitivityUpdateWidth">${activity.activityAuthor}</div>
									<div class="acitivityUpdateWidth">${activity.startTime}</div>
									<div class="activityUpdateButton"><a href="<spring:url value='/update/activities/${activity.activityId}' />"
											class="btn btn-primary"> <span
											class="glyphicon-info-sigh glyphicon"></span>編輯 
										</a>  
									</div>  
								</div> 	
							</div>    
						</a> 
					</a> 
				</c:if>
			</c:forEach>












		</div>
	</section>




</body>
</html>
