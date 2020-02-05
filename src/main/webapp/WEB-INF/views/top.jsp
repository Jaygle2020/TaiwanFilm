<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header">
		<a href="${pageContext.request.contextPath}/getAllProject">
			<div class="h-logo">FlyingV</div>
		</a>
		<div class="left-menu">
			<div><a href="${pageContext.request.contextPath}/getAllProject">提案</a></div>
			<div><a href="${pageContext.request.contextPath}/createProject">探索</a></div>
			<div><a href="${pageContext.request.contextPath}/fundsCategory">探索</a></div>
		</div>
		<div class="right-menu">
			<div><a href="">關於我們</a></div>
			<c:if test="${not empty sessionScope.members.email}">
			<div class="myAccount" >
			<span id="memberButton"> ${sessionScope.members.memberName}</span>
			<a href="${pageContext.request.contextPath}/UpdateMember">會員資料</a>
<%-- 			<a>${sessionScope.members.memberImage}</a> --%>
			</div>
			</c:if>
			<c:if test="${empty sessionScope.members.email}">
			<div class="myAccount" ><a href="${pageContext.request.contextPath}/register">登入/註冊</a>
			</div>
			</c:if>			
		</div>
	</div>
	<div id="memberDetail"style="padding: 5px;display:none;width: 100px;
	height:200px;background:#ebebeb;position:absolute;right:5px;top:68px;z-index:100">
		<a href="${pageContext.request.contextPath}/UpdateMember">會員資料</a>
		<br>
		<a href="${pageContext.request.contextPath}/logout">登出</a>	
	</div>
	<script type="text/javascript">

	 $("#memberButton").click(function(){
		 $("#memberDetail").fadeToggle(500);
	 });
	
	</script>


</body>
</html>