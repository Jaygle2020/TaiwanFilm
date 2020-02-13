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
	<!--       三個地方要完全一樣 -->
	<fieldset>
		<form:form method='POST' modelAttribute="messageBean"
			class='form-horizontal' enctype="multipart/form-data">
			<div class="toolBar">

				<div class="form-group">
					<select name="messageCategory">
						<option value="國片討論">國片討論
						<option value="募資討論">募資討論
							<%-- <options items="${categoryList}"></options> --%>
					</select>
				</div>
				<div>標題</div>
				<div class="col-lg-10">
					<input id="messageTitle" name="messageTitle" type='text'>
				</div>
				<div style="margin: 0 auto; width: 700px">
					<textarea id="editor" name="messageContent"></textarea>
				</div>
				<input name="messageDelete" value="1" type="hidden"> <input
					type="submit" value="輸入" /> <input type="reset" value="重寫" />
			</div>

		</form:form>
	</fieldset>
	<script>
		CKEDITOR.replace('editor');
	</script>
</body>
</html>