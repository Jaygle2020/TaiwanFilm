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
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<style>
ul li {
	list-style-type: none;
}

i {
	position: absolute;
	left: 70px;
}

.titleImage {
	text-align: center;
}

.titleImage img {
	width: 84%;
}

.cinemaName {
	padding: 50px;
	/* 	height: 475px; */
}

.movieSession {
	background: LightGrey;
	padding: 50px;
	position: relative;
}

.hiddenInfo {
	/*  	margin-top: -200px;  */
	
}

.cinemaDetail {
	padding: 50px;
	font-family: Microsoft JhengHei;
}

.cinemaDetail ul {
	display: inline-block;
}

.cinemaDetail img {
	height: 270px;
	width: 406px;
	margin-left: 200px;
	display: inline-block;
}

.countryCategory {
	width: 200px;
	display: inline-block;
	vertical-align: top;
	display: inline-block;
}
</style>
</head>
<body>

	<jsp:include page="../fragment/top.jsp" />

	<h2>選擇戲院</h2>
	<div class="titleImage">
		<img src="${pageContext.request.contextPath }/img/booking/theater.jpg">
	</div>

	<div class="cinemaName">
		<div class="countryCategory">
			<h3>台北市</h3>
			<c:forEach var='cinema' items='${cinemas }'>
				<c:if test='${cinema.cinemaCountry.equals("台北市") }'>
					<h3>
						<a class="cinemas" id="${cinema.cinemaId }" href="">${cinema.cinemaName }</a>
					</h3>
				</c:if>
			</c:forEach>
		</div>
		<div class="countryCategory">
			<h3>新北市</h3>
			<c:forEach var='cinema' items='${cinemas }'>
				<c:if test='${cinema.cinemaCountry.equals("新北市") }'>
					<h3>
						<a class="cinemas" id="${cinema.cinemaId }" href="">${cinema.cinemaName }</a>
					</h3>
				</c:if>
			</c:forEach>
		</div>
		<div class="countryCategory">
			<h3>桃園市</h3>
			<c:forEach var='cinema' items='${cinemas }'>
				<c:if test='${cinema.cinemaCountry.equals("桃園市") }'>
					<h3>
						<a class="cinemas" id="${cinema.cinemaId }" href="">${cinema.cinemaName }</a>
					</h3>
				</c:if>
			</c:forEach>
		</div>
		<div class="countryCategory">
			<h3>新竹市</h3>
			<c:forEach var='cinema' items='${cinemas }'>
				<c:if test='${cinema.cinemaCountry.equals("新竹市") }'>
					<h3>
						<a class="cinemas" id="${cinema.cinemaId }" href="">${cinema.cinemaName }</a>
					</h3>
				</c:if>
			</c:forEach>
		</div>
		<div class="countryCategory">
			<h3>台中市</h3>
			<c:forEach var='cinema' items='${cinemas }'>
				<c:if test='${cinema.cinemaCountry.equals("台中市") }'>
					<h3>
						<a class="cinemas" id="${cinema.cinemaId }" href="">${cinema.cinemaName }</a>
					</h3>
				</c:if>
			</c:forEach>
		</div>
		<div class="countryCategory">
			<h3>嘉義市</h3>
			<c:forEach var='cinema' items='${cinemas }'>
				<c:if test='${cinema.cinemaCountry.equals("嘉義市") }'>
					<h3>
						<a class="cinemas" id="${cinema.cinemaId }" href="">${cinema.cinemaName }</a>
					</h3>
				</c:if>
			</c:forEach>
		</div>
		<div class="countryCategory">
			<h3>台南市</h3>
			<c:forEach var='cinema' items='${cinemas }'>
				<c:if test='${cinema.cinemaCountry.equals("台南市") }'>
					<h3>
						<a class="cinemas" id="${cinema.cinemaId }" href="">${cinema.cinemaName }</a>
					</h3>
				</c:if>
			</c:forEach>
		</div>
		<div class="countryCategory">
			<h3>高雄市</h3>
			<c:forEach var='cinema' items='${cinemas }'>
				<c:if test='${cinema.cinemaCountry.equals("高雄市") }'>
					<h3>
						<a class="cinemas" id="${cinema.cinemaId }" href="">${cinema.cinemaName }</a>
					</h3>
				</c:if>
			</c:forEach>
		</div>
	</div>

	<div class="hiddenInfo">
		<div class="movieSession">
			<h2>電影場次</h2>
			<span style="color: red;">*網路訂票僅開放部份座位訂票，實際剩餘座位數請洽現場售票窗口</span>&ensp;*黃色底時間代表即將售完
			/ 紅色底時間為完售
			<c:forEach var='session' items='${sessions }' varStatus='count'>
				<div class="sessionDetail" id="${session.cinemaId }">
					<p>${session.sessionDate.substring(0, 4) }年
						${session.sessionDate.substring(4, 6) } 月
						${session.sessionDate.substring(6, 8) } 日 ${session.sessionDay }</p>
					<input type="button" style="width: 200px; height: 30px;"
						value="${session.sessionTime }"
						onclick="javascript:location.href='<spring:url value='/seatChoose?id=${session.sessionId }' />'" />
					<%-- 					<a href="<spring:url value='/seatChoose?id=${session.sessionId }' />">${session.sessionTime }</a> --%>
				</div>
			</c:forEach>
		</div>

		<c:forEach var='cinema' items='${cinemas }'>
			<div class="cinemaDetail" id="${cinema.cinemaId }">
				<h2>戲院資訊</h2>
				<ul>
					<li><i class="fa fa-phone pr-10" style="font-size: 24px"></i>服務專線&ensp;:
						<p>${cinema.cinemaPhone }</p></li>
					<li><i class="fa fa-map-marker pr-10" style="font-size: 24px"></i>戲院地址&ensp;:
						<p>${cinema.cinemaAddress }</p></li>
					<li><i class="fa fa-bus pr-10" style="font-size: 24px"></i>交通資訊&ensp;:
						<p>-&ensp;捷運&ensp;:&ensp;${cinema.cinemaMrt }</p>
						<p>-&ensp;公車&ensp;:&ensp;${cinema.cinemaBus }</p></li>
				</ul>
				<img
					src="<c:url value='/getPicture/cinemaBean/${cinema.cinemaId }' />">
				<iframe width='100%' height='270' frameborder='0' scrolling='no'
					marginheight='0' marginwidth='0'
					src='https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=${cinema.cinemaName }&z=16&output=embed&t='></iframe>
			</div>
		</c:forEach>
	</div>

	<jsp:include page="../fragment/bottom.jsp" />

</body>

<script type="text/javascript">
	$(document).ready(function() {
		// $('.hiddenInfo').hide();
		$('.cinemaDetail').hide();
		$('.movieSession').hide();
		$('.cinemas').click(function() {
			$("html,body").animate({
				scrollTop:$(".hiddenInfo").offset().top
			}, 2000);
			// 			$('.hiddenInfo').hide();
			$('.cinemaDetail').hide();
			$('.sessionDetail').hide();
			$('.movieSession').slideDown(1000);
			$('[id=' + $(this).attr('id') + ']').slideDown(2000);
			return false;
		});
	});

	// 	function showInfo(id){
	// 		$('.hiddenInfo').slideDown(400);
	// 		$(#id).slideDown(400);
	// 		return false;
	// 	}
</script>
</html>