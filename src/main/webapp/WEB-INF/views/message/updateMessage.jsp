<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>編輯訊息</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/movie.css">
<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 400px;
	margin: auto;
}
</style>
</head>
<body>
	<jsp:include page="../fragment/top.jsp"></jsp:include>
	<section>
		<div class="container">
			<h1 style="text-align: center">編輯文章</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: blue;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="messageBean"
			class='form-horizontal' enctype="multipart/form-data"
			>
			<fieldset>
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2'
						for="messageCategory"> 分類 </label>
					<div class='col-lg-10'>
						<form:select path="messageCategory">
							<form:option value="國片討論">
								國片討論
							</form:option>
							<form:option value="募資討論">
								募資討論
							</form:option>
							<%-- 					<form:options items="${categoryList}" /> --%>
						</form:select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='messageTitle'>
						標題 </label>
					<div class="col-lg-10">
						<form:input id="messageTitle" path="messageTitle" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for=messageContent>
						內文 </label>
					<div class="col-lg-10">
						<form:textarea id="messageContent" path="messageContent"
							type='text' class='form:input-large' rows="5" cols="45" />
					</div>
				</div>

				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" /> <input type="reset" value="重寫"> <input
							type="button" value="回上一頁" onClick="history.back()">
					</div>
				</div>
			</fieldset>
		</form:form>
	</section>
</body>
</html>