<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="header">
	<div class="h-logo">
		<a href="/TaiwanFilm">FlyingV</a>
	</div>
	<div class="left-menu">
		<div>
			<a href="movieIntro">網路訂票</a>
		</div>
		<div>
			<a href="">娛樂購物</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/getAllProject">贊助電影</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}//createProjectFirst">贊助電影</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/fundsCategory">贊助電影</a>
		</div>
	</div>
	<div class="right-menu">
		<div>
			<a href="alterMovie">後台</a>
		</div>
		<c:if test="${not empty sessionScope.members.email}">
			<div class="myAccount">
				<span id="memberButton"> ${sessionScope.members.memberName}</span> <a
					href="${pageContext.request.contextPath}/UpdateMember">會員資料</a>
				<%-- 			<a>${sessionScope.members.memberImage}</a> --%>
			</div>
		</c:if>
		<c:if test="${empty sessionScope.members.email}">
			<div class="myAccount">
				<a href="${pageContext.request.contextPath}/register">登入/註冊</a>
			</div>
		</c:if>
	</div>
</div>
<div id="memberDetail"
	style="padding: 5px; display: none; width: 100px; height: 200px; background: #ebebeb; position: absolute; right: 5px; top: 68px; z-index: 100">
	<a href="${pageContext.request.contextPath}/UpdateMember">會員資料</a> <br>
	<a href="alterTicket">訂票資料</a> <br>
	<a href="${pageContext.request.contextPath}/logout">登出</a>
</div>
<script type="text/javascript">
	$("#memberButton").click(function() {
		$("#memberDetail").fadeToggle(500);
	});
</script>


</body>
</html>