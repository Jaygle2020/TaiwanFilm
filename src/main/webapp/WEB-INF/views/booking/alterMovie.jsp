<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/movie2.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<head>
<title>movie</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style>
</style>
</head>
<body>
	<jsp:include page="../fragment/top.jsp" />

	<section>
		<div class="container">
			<h1 style="text-align: center">編輯電影</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">

	<section class="container">
		<fieldset class='form-horizontal'>
			<div class="form-group">
				<h4>
					<label class="control-label col-lg-2">電影名稱</label>
				</h4>
				<h4>
					<label class="control-label col-lg-2" style="width: 40%;">英文名稱</label>
				</h4>
				<h4>
					<label class="control-label col-lg-2 col-lg-2" style="width: 20%;">上映日期
					</label>
				</h4>
				<label class="control-label col-lg-2 col-lg-2" style="width: 8%;">
				</label>
				<h4>
					<label class="control-label col-lg-2" style="width: 10%;">編輯</label>
				</h4>
			</div>
			<c:forEach var='movie' items='${movies }'>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2">
						${movie.movieName} </label><label class="control-label col-lg-2 col-lg-2"
						style="width: 40%;"> ${movie.englishName} </label> <label
						class="control-label col-lg-2 col-lg-2" style="width: 20%;">${movie.releaseDate }
					</label><label class="control-label col-lg-2 col-lg-2" style="width: 8%;">
					</label>
					<div align="center" class="deleteBtn">
						<a
							href="<spring:url value='/alterMovieDetail?id=${movie.movieId}' />"
							class='btn btn-primary'>修改</a> <a
							href="<spring:url value='/deleteMovieDetail?id=${movie.movieId}' />"
							class="btn btn-primary">刪除</a>
					</div>
				</div>
				<br>
			</c:forEach>
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" style="width: 85%;"></label>
				<div align="center">
					<a href="<spring:url value='/addMovie' />" class='btn btn-primary'>新增電影</a>
				</div>
			</div>
		</fieldset>
	</section>

</body>
<script>
	$(".deleteBtn a:nth-child(2)").click(function() {
		if (!confirm("確定要刪除嗎?")) {
			return false;
		}
	});
</script>
</html>