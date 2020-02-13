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
.activity-content{
	width: 100%;
	padding:10px;
	border-radius:10px;
	margin:10px;
	font-weight: bold;
	background: white;
	display: inline-block; 
	height: 100px;
}

.activity-content-show{
	width: 100%;
	padding:10px;
	border-radius:10px;
	margin:10px;
	font-weight: bold;
	display: inline-block;
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
	vertical-align: top;
	padding-top: 5px;
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
	<jsp:include page="../fragment/backStageInclud.jsp" />
	<div class="pageWrapper">
		<div class="functionWrapper">

			<h2>目前存在專案</h2>


		</div>
		<div class="formWrapper">
			<table>
				<thead>
					<th>募資名稱</th>
					<th>募資起始日</th>
					<th>募資截止日</th>
					<th>目前金額</th>
					<th>目標金額</th>
					<th>進度百分比</th>
				</thead>
				<c:if test="${cfBeans!=null}">
					<c:forEach items="${cfBeans}" var="cfBean">
						<tr>
							<td>${cfBean.projBean.projectName}</td>
							<td>${cfBean.dateBegin}</td>
							<td>${cfBean.dateEnd}</td>
							<td>${cfBean.fundsNow}</td>
							<td>${cfBean.fundsGoal}</td>
							<td>${cfBean.percent}</td>
							<td><button id="${cfBean.projBean.projectId}">修改</button></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div class="category-content">
				<div class="activity-content-show">  
				<div class="acitivityUpdateWidth">募資名稱</div> 
				<div class="acitivityUpdateWidth">募資起始日</div>
				<div class="acitivityUpdateWidth">募資截止日</div>
				<div class="acitivityUpdateWidth">目前金額</div>
				<div class="acitivityUpdateWidth">目標金額</div>
				<div class="acitivityUpdateWidth">進度百分比</div>
				<div class="activityUpdateButton">
				<div class="activityUpdateButtonStyle">上架</div>
				</div> 
			</div> 
				<c:if test="${cfBeans!=null}">
					<c:forEach items="${cfBeans}" var="cfBean">
				<div class="activity-inner"
					data-number="${cfBean.projBean.projectId}">
<!-- 					<div class="activityThumb" -->
<%-- 						style="background-image: url('/getDonatePlan/photo/${cfBean.}');background-size:cover	"> --%>
<!-- 					</div> -->
					<div class="activity-content">
						<p class="activity-title">${cfBean.projBean.projectName}</p>
					    <p class="activity-author">${cfBean.dateBegin}</p> 
						<p class="activity-maincontent">${cfBean.dateEnd}</p>
						<p class="activity-maincontent">${cfBean.fundsNow}</p>
						<p class="activity-maincontent">${cfBean.fundsGoal}</p>
						<p class="activity-maincontent">${cfBean.percent}</p>
						<p class="activity-Watched">
						<i class="fas fa-eye"></i>test</p>
					</div>
					<div class="downMeta"></div>
				</div>
				</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<script>
		function addProject() {
			window.location.href = "${pageContext.request.contextPath}/createProjectFirst";
		}

		$("td:last-child")
				.click(
						function() {
							var id = $(this).find("button").attr("id");
							window.location.href = "${pageContext.request.contextPath}/updateProject/"
									+ id;
						})
	</script>

</body>

</html>