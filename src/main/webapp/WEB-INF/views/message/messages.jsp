<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>Messages</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/movie.css">
</head>
<body>
	<jsp:include page="../fragment/top.jsp"></jsp:include>
	<form type="get"
		action="${pageContext.request.contextPath}/queryMessages"
		id="search-bar" style="text-align: center">
		<input class="query" type="text" name="keyword" value=""
			placeholder="搜尋文章⋯">
	</form>
	<div
		style="display: inline-block; text-align: center; text-valign: center; width: 100%">
		<div
			style="display: inline-block; text-align: left; width: 80%; border-style: none">
			<div style="display: inline-block; text-align: center; width: 10%">
				<a herf="${pageContext.request.contextPath}/messages">全部主題</a>
			</div>
			<c:forEach var='messageCategory' items='${categoryList}'>
				<div style="display: inline-block; text-align: center; width: 10%">
					<a
						href='${pageContext.request.contextPath}/messages/${messageCategory}'>${messageCategory}</a>
				</div>
			</c:forEach>
			<div style="display: inline-block; text-align: right; width: 65%"">
				<a href='${pageContext.request.contextPath}/messages/add'>新增文章</a>
			</div>
		</div>
	</div>
	<form name="formm" method="post" action="" style="text-align: center">
		<div
			style="display: inline-block; text-align: center; width: 80%; border-style: none; background-color: #85C1E9">
			<div style="display: inline-block; text-align: center; width: 60%">
				<span>篩選</span>
			</div>
			<div style="display: inline-block; text-align: center; width: 35%">
				<span style="display: inline-block; text-align: center; width: 40%">互動
					/ 人氣 </span>
				<sapn style="display: inline-block; text-align: center; width: 58%">發文時間</span>
			</div>
		</div>
		<c:forEach var='message' items='${messages}' varStatus="reply">
			<c:if test="${message.messageDelete==1}">
				<div
					style="display: inline-block; text-align: center; width: 80%; border-style: none; border-color: yellow">
					<div style="display: inline-block; text-align: center; width: 10%">
						<a
							href='${pageContext.request.contextPath}/messages/${messageCategory}'>${message.messageCategory}</a><br>
						<span class="b-list__summary__gp b-gp b-gp--good">${message.messageId}</span>
					</div>
					<div style="display: inline-block; text-align: center; width: 50%">
						<a href="<spring:url value='/message?id=${message.messageId}' />">
							<div>${message.messageTitle}</div>
							<div>${message.messageContent}</div>
						</a>
					</div>
					<div style="display: inline-block; text-align: center; width: 15%">
						<span title="互動"></span>/ <span title="人氣">${message.messageLike }</span><br>
						<span>${message.memberBean.memberName }</span>
					</div>
					<div style="display: inline-block; text-align: center; width: 20%">
						<a href="<spring:url value='/message?id=${message.messageId}' />">${message.createDate }</a><br>
						<span>${message.memberBean.memberName }</span>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</form>
</body>
</html>