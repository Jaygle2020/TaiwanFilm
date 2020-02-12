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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<style>
p {
	margin: 0;
}
</style>
</head>
<body>
	<jsp:include page="../fragment/menu.jsp"></jsp:include>
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
			<div  id="query" style ="display: inline-block; text-align: center; width: 10%">
				<a href="${pageContext.request.contextPath}/messages">全部主題</a>
			</div>
			<c:forEach var='messageCategory' items='${categoryList}'>
				<div  id="query${ messageCategory }" style="display: inline-block; text-align: center; width: 10%">
					<a
						href='${pageContext.request.contextPath}/messages/${messageCategory}'>${messageCategory}</a>
				</div>
			</c:forEach>
			<div id="query3"style="display: inline-block; text-align: center; width: 10% ">
			<a href="${pageContext.request.contextPath}/messageLike">依讚數查詢</a>
			</div>
			<div  id="query1"style="display: inline-block; text-align: center; width: 10%">
			<a href="${pageContext.request.contextPath}/createDate">依時間查詢</a>
			</div>
			<div id="query2" style="display: inline-block; text-align: center; width: 10%"">
				<a href='${pageContext.request.contextPath}/messages/add'>新增文章</a>
			</div>
		</div>
	</div>
	<form name="formm" method="post" action="" style="text-align: center">
		<div
			style="display: inline-block; text-align: center; width: 80%; border-style: none; background-color: #85C1E9">
			<div style="display: inline-block; text-align: center; width: 71%">
				<span>篩選</span>
			</div>
			<div style="display: inline-block; text-align: center; width: 24%">
				<span style="display: inline-block; text-align: center; width: 44%">按讚數/發文者 </span>
				<sapn style="display: inline-block; text-align: center; width: 53%">發文時間</span>
			</div>
		</div>
		<c:forEach var='message' items='${messages}' varStatus="reply">
			<c:if test="${message.messageDelete==1}">
				<div
					style="display: inline-block; text-align: center; width: 90%; border-style: none; border-color: yellow">
					<div style="display: inline-block; text-align: center; width: 9%">
						<a
							href='${pageContext.request.contextPath}/messages/${messageCategory}'>${message.messageCategory}</a><br>
						<span class="b-list__summary__gp b-gp b-gp--good">${message.messageId}</span>
					</div>
	
					<div style="display: inline-block; text-align: center; width: 55%">
						<a href="<spring:url value='/message?id=${message.messageId}' />">
							<div>${message.messageTitle}</div>
							<div id="viewArea">${message.messageContent}</div>
						</a>
					</div>
					<div style="display: inline-block; text-align: center; width: 9%">
				  
						<span title="按讚數">${message.messageLike }</span><br>
						<span title="發文者">${message.memberBean.memberName }</span>
					</div>
					<div style="display: inline-block; text-align: center; width: 19%">
						<a href="<spring:url value='/message?id=${message.messageId}' />">${message.createDate }</a><br>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</form>
	<script>
		$(function() {
			$("#viewArea img").remove();
		})
	$(function(){
      $("p").each(function(){
          var xx=$(this).html();
          $(this).replaceWith(xx);
      })
  })  
  
$("#query").mouseover(function(){
	 $(this).css("border-bottom","3px solid red");
})
$("#query").mouseout(function(){
   $(this).css("border-bottom","0px solid ");
})
$("#query1").mouseover(function(){
	 $(this).css("border-bottom","3px solid red");
})
$("#query1").mouseout(function(){
   $(this).css("border-bottom","0px solid ");
})
$("#query2").mouseover(function(){
   $(this).css("border-bottom","3px solid red");
})
$("#query2").mouseout(function(){
   $(this).css("border-bottom","0px solid ");
})
$("#query3").mouseover(function(){
	 $(this).css("border-bottom","3px solid red");
})
$("#query3").mouseout(function(){
   $(this).css("border-bottom","0px solid ");
})
$("#query國片討論").mouseover(function(){
	 $(this).css("border-bottom","3px solid red");
})
$("#query國片討論").mouseout(function(){
   $(this).css("border-bottom","0px solid ");
})
$("#query募資討論").mouseover(function(){
	 $(this).css("border-bottom","3px solid red");
})
$("#query募資討論").mouseout(function(){
   $(this).css("border-bottom","0px solid ");
})
	</script>
</body>
</html>