<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Manage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/menuStyle.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/movie.css' type="text/css" />

<style>
.activity-content {
	width: 100%;
	padding: 10px;
	border-radius: 10px;
	margin: 10px;
	font-weight: bold;
	background: white;
	display: inline-block;
	height: 100px;
}

.activity-content-show {
	width: 100%;
	padding: 10px;
	border-radius: 10px;
	margin: 10px;
	font-weight: bold;
	display: inline-block;
}

.allActivityM-width {
	width: 25%;
	height: 200px;
	display: inline-block;
}

.acitivityUpdateWidth {
	width: 21%;
	padding: 20px;
	display: inline-block;
	vertical-align: top;
	text-align: center;
	color: black;
}

.activityUpdateButton {
	width: 7%;
	display: inline-block;
	margin-top: 12px;
	text-align: center;
	vertical-align: top;
	padding-top: 5px;
}

.activityUpdateButtonStyle {
	width: 100%;
	color: white;
	background-color: red;
	padding: 3px;
	border-radius: 3px
}
</style>

<style>


.content {
	width: 90%;
	background: white;
	border-radius: 10px;
	margin: 10px 0px;
	display: inline-block
}

.content-area {
	width: 90px;
	display: inline-block;
	height: 50px;
	padding-top: 15px;
	text-align: center
}
</style>
</head>

<body style="background: #d5d6db;">
	<jsp:include page="../fragment/backStageInclud.jsp" />
	<div class="pageWrapper">
		<div class="">
			<h2>目前存在專案</h2>
		</div>
		<div class="formWrapper">
			
	<div class="name">
		<div class="content">
			<div class="content-area" >募資名稱</div>
			<div class="content-area">募資起始日</div>
			<div class="content-area">募資截止日</div>
			<div class="content-area">目前金額</div>
			<div class="content-area">目標金額</div>
			<div class="content-area">進度百分比</div>
			<div class="content-area" content="  "></div>
		</div>
		<!--  寫foreach -->
		<c:if test="${cfBeans!=null}">
			<c:forEach items="${cfBeans}" var="cfBean">
				<div class="content project">
					<div class="content-area" >${cfBean.projBean.projectName}</div>
					<div class="content-area">${cfBean.dateBegin}</div>
					<div class="content-area">${cfBean.dateEnd}</div>
					<div class="content-area">${cfBean.fundsNow}</div>
					<div class="content-area">${cfBean.fundsGoal}</div>
					<div class="content-area">${cfBean.percent}</div>
					<div class="content-area"><button id="${cfBean.projBean.projectId}">修改</button></div>
				</div>
			</c:forEach>
		</c:if>
		<!--  寫foreach -->
	</div>
		</div>
	</div>



	<script>
		$("button").click(
						function() {
							var id = $(this).attr("id");
							window.location.href = "${pageContext.request.contextPath}/updateProject/"
									+ id;
						})
	</script>

</body>

</html>