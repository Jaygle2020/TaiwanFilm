<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 400px;
	margin: auto;
}

.inner {
	vertical-align: top;
}

#status {
	width: 80px;
	height: 30px;
}
</style>
<title>Products</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/movie.css' type="text/css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body style="background-color: #fffcfa;">

	<section>
		<div class="container">
			<h1 style="text-align: center">修改產品資料</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!-- 三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="ProductBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='title'>
						書名 </label>
					<div class="col-lg-10">
						<form:input id="title" path="title" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='author'>
						作者 </label>
					<div class="col-lg-10">
						<form:input id="author" path="author" type='text'
							class='form:input-large' />
					</div>
				</div>



				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category">
						類別</label>
					<div class='col-lg-10'>
						<form:input id="category" path="category" type='text'
							class='form:input-large' />
					</div>
				</div>





				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="price">
						價格</label>
					<div class='col-lg-10'>
						<form:input id="price" path="price" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="stock">
						庫存</label>
					<div class='col-lg-10'>
						<form:input id="stock" path="stock" type='text'
							class='form:input-large' />
					</div>
				</div>
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="fileName">
						圖片名稱</label>
					<div class='col-lg-10'>
						<form:input id="fileName" path="fileName" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productImage">
						圖片 </label>
					<div class='col-lg-10'>
						<form:input id="productImage" path="productImage" type='file'
							class='form:input-large' />

					</div>
				</div>


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="status">
						狀態</label>
					<div class='col-lg-10'>
						<form:select class='form:select-large' id="status" path="status">
							<form:option selected="true" value="-1" disabled="true"
								label="請選擇" />
							<form:option value="上架中" label="上架" />
							<form:option value="下架" label="下架" />
						</form:select>
					</div>
				</div>



				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
					</div>
				</div>


			</fieldset>
		</form:form>
	</section>



</body>
</html>