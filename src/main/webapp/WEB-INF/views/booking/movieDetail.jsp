<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<style>
img {
	width: 300px;
	height: 420px;
}

.movieMain {
	padding: 50px 300px;
/* 	height: 550px; */
	margin-bottom: 50px;
}

.movieMain figure {
	display: inline-block;
	margin: 0px 100px;
}

.movieInfo {
	width: 60%;
	display: inline-block;
	vertical-align: text-bottom;
}

.infoArea {
	font-family: Microsoft JhengHei;
}

.infoArea td {
	min-width: 50px;
}

.movieVideo {
	height: 550px;
	text-align: center;
	background: LightGrey;
}

.movieVideo iframe {
	padding-top: 40px;
}

.movieStory {
	font-family: Microsoft JhengHei;
	padding: 50px 300px;
}
</style>
</head>
<body>

	<jsp:include page="../fragment/top.jsp" />

	<h2>電影介紹</h2>
	<div class="movieMain">
		<figure>
			<img src="<c:url value='/getPicture/movieBean/${movie.movieId }' />"
				alt="${movie.movieName }" title="${movie.movieName }">
		</figure>
		<section class="movieInfo">
			<div class="markArea">
				<span class="bigchild"> <mark>${movie.rate }</mark></span><span
					class="hot">
				</span>
			</div>
			<div class="titleArea">
				<h1>${movie.movieName }</h1>
				<h2 style="width: 600px;">${movie.englishName }</h2>
				<time>上映日期：${movie.releaseDate }</time>
			</div>
			<div class="infoArea">

				<h3>MOVIE INFO</h3>
				<table>
					<tr>
						<td>導演：</td>
						<td>${movie.director }</td>
					</tr>
					<tr>
						<td style="vertical-align: text-top;">演員：</td>
						<td width="500px">${movie.actor }</td>
					</tr>
					<tr>
						<td>類型：</td>
						<td>${movie.type }</td>
					</tr>
					<tr>
						<td>片長：</td>
						<td>${movie.movieLength }</td>
					</tr>
				</table>
				<br> <input type="button" style="width: 200px; height: 30px;"
					value="前往訂票" onclick="javascript:location.href='<spring:url value='/booking?id=${movie.movieId}' />'" />
			</div>
		</section>
	</div>

	<div class="movieVideo">${movie.youtube }</div>

	<div id="info" class="movieStory">
		<article class="article">
			<h2>
				劇情簡介<span>ABOUT THE STORY</span>
			</h2>
			<div class="bbsArticle">
				<p>${movie.movieStory }</p>
				<p></p>
			</div>
		</article>
	</div>

	<jsp:include page="../fragment/bottom.jsp" />

</body>
</html>