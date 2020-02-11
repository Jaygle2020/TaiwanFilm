<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<link rel="stylesheet" href="css/menuStyle.css">
</head>
<body>
<jsp:include page="../fragment/menu.jsp" />
<h2>感謝購買</h2>
<p>請至下列合作的超商進行付款</p>
<div><img src="${pageContext.request.contextPath}/img/supermark/familymart.png">
<img src="${pageContext.request.contextPath}/img/supermark/ipon.png">
<img src="${pageContext.request.contextPath}/img/supermark/life.png">
<img src="${pageContext.request.contextPath}/img/supermark/ok.png">
</div>


<script>
setTimeout(function(){ 
	alert("即將跳轉回首頁");
	window.location.replace("${pageContext.request.contextPath}/");
}, 3000);
</script>
</body>
</html>