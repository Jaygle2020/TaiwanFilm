<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script type='text/javascript'
	src='${pageContext.request.contextPath}/javascript/jquery-1.9.1.js'></script>

<title>所有會員資料</title>
<style>
.name {
	padding: 100px 0px 0px 17%;
	text-align: center;
}

.content {
	width: 80%;
	background: white;
	border-radius: 10px;
	margin: 10px 0px;
	display: inline-block;
}

.content-area {
	width: 19%;
	display: inline-block;
	height: 50px;
	padding-top: 15px;
	text-align: center;
	font-weight: bold;
}

.content-form {
	width: 49%;
	display: inline-block;
	height: 50px;
	padding-top: 15px;
	text-align: center;
	font-weight: bold;
}

.but1 {
	background-color: #428bca;
	border-color: #357ebd;
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	line-height: 1.428571429;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	cursor: pointer;
	border: 1px solid transparent;
	border-radius: 4px;
}

h1 {
	text-align: center;
	font-size: 36px;
}

.query {
	
}

#search {
	text-align: left;
	border: 0;
	padding: 0;
	border-bottom: 1px solid black;
	background-color: #ebebeb;
	font-size: 20px;
	vertical-align: super;
}

.forForm {
	width: 38%;
	display: inline-block;
}
</style>
</head>
<body>
	<jsp:include page="../backstage.jsp" />
	<div class="name">
		<h1>會員資料</h1>
		<hr>
		<div style="text-align: left;"></div>
		<c:choose>
			<c:when test="${empty members}">沒有任何會員資料<br>
			</c:when>
			<c:otherwise>
				<div class="">

						<form action="${pageContext.request.contextPath}/FuzzyQuery">
							<input id="search" class="query" type="text" name="keyword"
								placeholder="搜尋文章⋯"> <img width='23' height='23'
								src='${pageContext.request.contextPath}/img/search.png' />
						</form>
						<br><br>
					<div class="content">
						<div class="content-area">編號</div>
						<div class="content-area">信箱</div>
						<div class="content-area">姓名</div>
						<div class="content-area">會員狀態</div>
						<div class="content-area">確認</div>
					</div>
					<c:forEach var='member' items='${memberlist}'>
						<div class="content">
							<div class="content-area">
								<a
									href="${pageContext.request.contextPath}/_01_register/modify/${member.memberId}">${member.memberId}</a>
							</div>
							<div class="content-area">${member.email}</div>
							<div class="content-area">${member.memberName}</div>
							<div class="forForm">
								<form method="POST"
									action="${pageContext.request.contextPath}/_01_register/DoNotMember">
									<div class="content-form">
										<input style="display: none;" name="memberId" id="memberId"
											value="${member.memberId}" /> <input style="display: none;"
											name="email" id="email" value="${member.email}" /> <select
											name="memberMode" required>
											<!-- 										從資料庫確認狀態給預設值 -->
											<option value="2"
												<c:if test="${member.memberMode =='2'}"> selected="true"</c:if>>管理員</option>
											<option value="1"
												<c:if test="${member.memberMode =='1'}"> selected="true"</c:if>>一般會員</option>
											<option value="0"
												<c:if test="${member.memberMode =='0'}"> selected="true"</c:if>>非會員</option>
										</select>
									</div>
									<div class="content-form ">
										<div>
											<input class="but1" type="submit" id="bt2" value="確認"
												onclick="DomodifyMode()" />
										</div>
									</div>
								</form>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
		<button>
			<a href="<c:url value='/backstage' />">回前頁</a>
		</button>


		<hr>

	</div>
	<script type='text/javascript'>
		function DomodifyMode() {
			alert("會員狀態修改成功");

		}
		$(document).ready(function() {
			$('.deletelink').click(function() {
				if (confirm('確定刪除此筆紀錄? ')) {
					var href = $(this).attr('href');
					$('form').attr('action', href).submit();
				}
				return false;

			});
		})
	</script>

</body>
</html>