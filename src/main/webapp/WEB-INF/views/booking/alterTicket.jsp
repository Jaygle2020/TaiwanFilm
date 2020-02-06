<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<head>
<title>movie</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/movie2.css">
<style>
</style>
</head>
<body>
	<jsp:include page="../fragment/top.jsp" />

	<section>
		<div class="container">
			<h1 style="text-align: center">查看訂票</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">

	<section class="container">
		<fieldset class='form-horizontal'>
			<div class="form-group">
				<h4>
					<label class="control-label col-lg-2">電影名稱 </label>
				</h4>
				<h4>
					<label class="control-label col-lg-2" style="width: 17%;">放映資訊
					</label>
				</h4>
				<h4>
					<label class="control-label col-lg-2" style="width: 13%;">戲院</label>
				</h4>
				<h4>
					<label class="control-label col-lg-2 col-lg-2" style="width: 30%;">座位</label>
				</h4>
				<h4>
					<label class="control-label col-lg-2" style="width: 10%;">狀態</label>
				</h4>
				<h4>
					<label class="control-label col-lg-2" style="width: 10%;">編輯</label>
				</h4>
			</div>
			<c:forEach var='view' items='${views }'>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2">
						${view.movieName}<br>${view.englishName}
					</label> <label class="control-label col-lg-2 col-lg-2" style="width: 17%;">
						${view.sessionDate.substring(0, 4) }/
						${view.sessionDate.substring(4, 6) }/
						${view.sessionDate.substring(6, 8) }&emsp;${view.sessionTime } </label> <label
						class="control-label col-lg-2 col-lg-2" style="width: 13%;">
						${view.cinemaName} </label> <label class="control-label col-lg-2 col-lg-2"
						style="width: 30%;"> ${view.seat} </label> <label
						class="control-label col-lg-2 col-lg-2 status" style="width: 10%;">
						${view.status} </label>
					<div align="center" class="deleteBtn">
						<a
							href="<spring:url value='/deleteTicket?id=${view.ticketId}' />"
							class="btn btn-primary">取消</a>
					</div>
				</div>
				<br>
			</c:forEach>
		</fieldset>
	</section>

	<jsp:include page="../fragment/bottom.jsp" />

</body>
<script>
	$(".deleteBtn a").click(function() {
		if (!confirm("確定要刪除嗎?")) {
			return false;
		}
	});

	$(".status").css("color", "red");

	$(".status").css("color", function() {
		if ($(this).text().indexOf("已付款") != -1) {
			return "green";
		}
	})
</script>
</html>