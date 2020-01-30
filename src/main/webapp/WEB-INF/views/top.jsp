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
		<a href="">
			<div class="h-logo">FlyingV</div>
		</a>
		<div class="left-menu">
			<div><a href="">提案</a></div>
			<div><a href="${pageContext.request.contextPath}/createProject">探索</a></div>
			<div><a href="${pageContext.request.contextPath}/fundsCategory">探索</a></div>
		</div>
		<div class="right-menu">
			<div><a href="">關於我們</a></div>
			<c:if test="${not empty sessionScope.members.account}">
			<div class="myAccount" >
			<a>${sessionScope.members.account}</a>
			</div>
			</c:if>
<%-- 			<c:if test="${empty sessionScope.members.account}"> --%>
			<div class="myAccount" ><a href="register">登入/註冊</a>
			</div>
<%-- 			</c:if> --%>
			
			
		</div>
	</div>
	
	<script type="text/javascript">
	  $('.myAccount').mouseover(function(){
		  	$('.register-btn').show(); 
	    	
		});
	 $('.myAccount').mouseout(function(){
		  	$('.register-btn').hide(); 
	    	
		});
	
	</script>


</body>
</html>