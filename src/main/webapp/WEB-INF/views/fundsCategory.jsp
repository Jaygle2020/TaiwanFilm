<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/FlyingV.css"
	type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/movie2.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
</head>
<body>
<jsp:include page="fragment/top.jsp" />
	<div class="section" id="category">
		<div class="width-limit">
			<!-- 分頁按鈕 -->
			<div class="change-category">
				<div class="change-menu">
					<div class="buttonBorder-active buttonBorder" id="hot-button">熱門項目</div>
					<div class="buttonBorder" id="new-button">最新發起</div>
					<div class="buttonBorder" id="coming-button">即將開始</div>
					<div class="buttonBorder" id="end-button">即將結束</div>
					<div class="buttonBorder" id="money-button">募資金額</div>
				</div>
			</div>


			<!-- 熱門分頁區塊 -->
			<div class="category-content active" id="hot">
				<c:forEach items="${Fundings}" var="proj">
					<div class="inner" id="project${proj.projBean.projectId}">
						<div class="projectThumb">
							<img
								src="${pageContext.request.contextPath}/getProject/photo/${proj.projBean.projectId}">
						</div>
						<div class="project">
							<p class="title"></p>
							<p class="small-title">${proj.projBean.projectName}</p>
							<p class="content">${proj.projBean.projDescript}</p>
						</div>
						<div class="downMeta">
							<div class="wholePercent"></div>
							<div class="realPercent" style="width:${proj.percent}%"></div>
						</div>
						<div class="plan">
							<span class="money">$ ${proj.fundsNow}</span> <span
								class="percent">${proj.percent}%</span> <span class="date">還剩
								<strong>22小時</strong>
							</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script>
	
		$(".inner").click(function(){
			console.log("success");
			var id = $(this).attr("id");
			var url = "${pageContext.request.contextPath}/"+id;
			$(location).attr('href',url);

		});
	</script>
</body>
</html>