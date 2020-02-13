<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/movie2.css">
<style type="text/css">
fieldset {
	border: 1px solid white;
	width: 80%;
	margin: auto;
}
</style>
<title>AddMessage</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
<style>
#messageBackground {
	background-image: url(${pageContext.request.contextPath}/img/wall1.jpeg);
}
</style>
</head>
<body>
			<jsp:include page="../fragment/menu.jsp"></jsp:include>
	<div id="messageBackground">
		<section>
			<div class="container">
				<h1 style="text-align: center; font-size: 40px">新增文章</h1>
			</div>
		</section>
		<hr
			style="height: 1px; border: none; color: #333; background-color: white;">
		<fieldset>
			<div class="toolBar">
				<form class="formArea" id="forArea" method="post"
					action="${pageContext.request.contextPath}/messages/add"
					enctype="multipart/form-data">
					<div style="font-size: 20px;padding:10px 0px" >分類</div>
					<div class="form-group">
						<select name="messageCategory"
							style="font-size: 20px; width: 108px; height: 30px;">
							<option value="國片討論">國片討論
							<option value="募資討論">募資討論
						</select> <br>
					</div>
					<div style="font-size: 20px;padding:10px 0px" >標題</div>
					<div class="col-lg-10">
						<input id="messageTitle" name="messageTitle" type='text' style="height:30px; width:600px ;font-size:15px ;height:30px"><br>
					</div>
					<div style="font-size: 20px;padding:10px 0px" >內文</div>
					<div style="margin: 0 auto; width: 100%;padding:10px 0px ;font-size:15px">
						<textarea id="editor" name="messageContent"></textarea>
					</div>
					<div style="font-size: 2-px">
					<input name="messageDelete" value="1" type="hidden" > <input
						type="submit" value="輸入" /> <input type="reset" value="重寫" /></div>
				</form>
			</div>
		</fieldset>
	</div>
	<script>
		CKEDITOR.replace('editor');
	</script>
	<jsp:include page="../fragment/bottom.jsp"></jsp:include>
</body>
</html>
