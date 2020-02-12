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
						品名 </label>
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
					<label class='control-label col-lg-2 col-lg-2' for="category">
						類型 </label>
					<div class='col-lg-10'>
						<form:select path="category">
							<form:option value="-1" label="請挑選" />
							<form:options items="${categoryList}" />
						</form:select>
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
					<label class='control-label col-lg-2 col-lg-2' for="productNo">
						編號 </label>
					<div class='col-lg-10'>
						<form:input id="productNo" path="productNo" type='text'
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
				<a href="#" rel="external nofollow" rel="external nofollow"
					rel="external nofollow" id="AddMoreFileBox" class="btn btn-info">新增更多的input輸入框</a></span>
				</p>
				<div id="InputsWrapper">
					<div>
						<input type="text" name="mytext[]" id="field_1" value="Text 1" /><a
							href="#" rel="external nofollow" rel="external nofollow"
							rel="external nofollow" class="removeclass"><input
							type='button' value='刪除'></a>
					</div>
				</div>

			</fieldset>
		</form:form>
		<button onclick="add()">123</button>
		<div id="aaa"></div>

	</section>
</body>
<script>
	function add() {
		var cont = '<input type="text">';

		$('#aaa').append(cont);

	};
	$(document)
			.ready(
					function() {
						var MaxInputs = 8; //maximum input boxes allowed
						var InputsWrapper = $("#InputsWrapper"); //Input boxes wrapper ID
						var AddButton = $("#AddMoreFileBox"); //Add button ID
						var x = InputsWrapper.length; //initlal text box count
						var FieldCount = 1; //to keep track of text box added
						$(AddButton)
								.click(
										function(e) //on add input button click
										{
											if (x <= MaxInputs) //max input box allowed
											{
												FieldCount; //text box added increment
												//add input box
												$(InputsWrapper)
														.append(
																'<div><input type="text" name="mytext[]" id="field_'  FieldCount  '" value="Text '  FieldCount  '"/><a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" class="removeclass"><input type="button" value="刪除"></a></div>');
												x; //text box increment
											}
											return false;
										});
						$("body").on("click", ".removeclass", function(e) { //user click on remove text
							if (x > 1) {
								$(this).parent('div').remove(); //remove text box
								x--; //decrement textbox
							}
							return false;
						})
					});
</script>
</html>
