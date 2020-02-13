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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>

<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 400px;
	margin: auto;
}
</style>
<title>Products</title>
</head>
<body style="background-color: #fffcfa;">
	<section>
		<div class="container">
			<h1 style="text-align: center">新增產品資料</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="productbean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='title'>
						商品 </label>
					<div class="col-lg-10">
						<form:input id="title" path="title" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='author'>
						電影 </label>
					<div class="col-lg-10">
						<form:input id="author" path="author" type='text'
							class='form:input-large' />
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='productDescription'>
						商品描述 </label>
					<div class="col-lg-10">
						<form:input id="productDescription" path="productDescription" type='textarea'
							class='form:input-large' />
					</div>
				</div>

				 <div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category">
						類別 </label>
					<div class='col-lg-10'>
						<form:input id="category" path="category" type='text'
							class='form:input-large' />
					</div>
				</div> 
			

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="price">
						價格 </label>
					<div class='col-lg-10'>
						<form:input id="price" path="price" type='text'
							class='form:input-large' />
					</div>
				</div>
				
					<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="stock">
						庫存 </label>
					<div class='col-lg-10'>
						<form:input id="stock" path="stock" type='text'
							class='form:input-large' />
					</div>
				</div>
				

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="companyId">
						廠商 </label>
					<div class='col-lg-10'>
						<form:select path="companyId">
							<form:option value="-1" label="請挑選" />
							<form:options items="${companyList}" />
						</form:select>
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
				
				<div class="form-group subImg2" style="display:none;">
					<label class='control-label col-lg-2 col-lg-2' for="productImage2">
						圖片2 </label>
					<div class='col-lg-10'>
						<input id="productImage2" name="productImage2" type='file'
							class='form:input-large' />
					</div>
				</div>
				<div class="form-group subImg3" style="display:none;">
					<label class='control-label col-lg-2 col-lg-2' for="productImage3">
						圖片3 </label>
					<div class='col-lg-10'>
						<input id="productImage3" name="productImage3" type='file'
							class='form:input-large' />
					</div>
				</div>
				
				<a href="#" id="addImages" >加入圖片</a>
				



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
<script>
		
		//新增圖片按紐
		var count = 0;
		$('#addImages').click(function(){
			$('.subImg2').show();
			count++;
		if(count == 2){
			$('.subImg3').show();
		}
		});
		
		
		
		


</script>
</html>
