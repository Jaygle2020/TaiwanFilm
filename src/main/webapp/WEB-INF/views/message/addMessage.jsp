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
	border: 1px solid rgb(255, 232, 57);
	width: 400px;
	margin: auto;
}
</style>
<title>AddMessage</title>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>x
</head>
<body>
	<jsp:include page="../fragment/top.jsp"></jsp:include>


	<section>
		<div class="container">
			<h1 style="text-align: center">新增文章</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: blue;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="messageBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2'
						for="messageCategory">分類 </label>
					<div class='col-lg-10'>
						<form:select path="messageCategory">
							<form:option value="國片討論">
								國片討論
							</form:option>
							<form:option value="募資討論">
								募資討論
							</form:option>
							<%-- 							<form:options items="${categoryList}" /> --%>
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

				<!-- 				<div class="form-group"> -->
				<!-- 					<label class="control-label col-lg-2 col-lg-2" for=messageContent> -->
				<!-- 						內文 </label> -->
				<!-- 					<div class="col-lg-10"> -->
				<%-- 						<form:textarea id="messageContent" path="messageContent" --%>
				<%-- 							type='text' class='form:input-large' rows="5" cols="45" /> --%>
				<!-- 					</div> -->
				<!-- 				</div> -->

				<div class="textTable">
					<div>輸入的文章預覽</div>
					<div id="viewArea"></div>
				</div>
				<div class="toolBar">
					<textarea name="" id="enterTable" cols="40" rows="8"></textarea>
					<br>
					<button type="button" onclick="enterText()">送出段落</button>
					<form class="formArea" id="forArea" method="post" action=""
						enctype="multipart/form-data">
						<input id="innerTesxt" type="hidden" name="innerText" value="">
						<input id="photoCount" type="hidden" name="photoCount" value="">
						<input class="imageUpload" type="file" name="">
					</form>
					<button id="formSubmit" type="button" onclick="formSubmit()">儲存結果</button>
					<button id="restForm" type="button" onclick="resetForm()">清除</button>
				</div>

				說明書: 目前功能是在底下打字區每打完一個段落主動案送出段落就可以傳到上面(ENTER鍵只有換行沒有送資料功能)<br>
				然後圖片每次按上傳會自動預覽穿插在上面的文字區間按照順序排<br> SUBMIT送出的資料結構在FORM當中，列表如下<br>
				name=innerText 把格式直接存成str檔 type="text" name=photoCount
				數字為圖片總共有幾張要去後台用FORM迴圈跑圖片數讀取 type="text" name="image"+n n是上面圖片數量從0開始
				type="file"



				<script>
					//將輸入的文字傳到上面的預覽區
// 					function enterText() {
// 						if ($("#enterTable").val().length != 0) {
// 							var str = "<pre>";
// 							str += $("#enterTable").val();
// 							str += "</pre>";
// 							var allStr = $("#viewArea").html() + str;
// 							$("#viewArea").html(allStr);
// 							$("#enterTable").val("");
// 						}

// 					}

					//將上傳的圖片傳到預覽區
					var imageNum = 0;
					//限制圖片數量的參數
					var maxImageNum = 4;
					$(".imageUpload").change(function() {
						$(this).attr("name", "image" + imageNum);
						readURL(this);
					})

					// 上傳圖片的功能 和 製造下一個圖片表單
					function readURL(input) {
						if (input.files && input.files.length >= 0) {
							for (var i = 0; i < input.files.length; i++) {
								var reader = new FileReader();
								reader.onload = function(e) {
									var num = imageNum - 1;
									var img = $(
											"<img class='viewImage' width='600' height='400' id='image" + num + "'>")
											.attr('src', e.target.result);
									$("#viewArea").append(img);
								}
								reader.readAsDataURL(input.files[i]);
							}
							$(input).css("display", "none");
							imageNum++;
							console.log(imageNum);
							if (imageNum < maxImageNum) {
								var newInput = $("<input class='imageUpload' type='file'  name='' >");
								$(".formArea").append(newInput);
								$(".imageUpload").change(function() {
									$(this).attr("name", "image" + imageNum);
									readURL(this);
								})
							}
						}
					}
					// 送出表單按鈕
					function formSubmit() {
						$(".viewImage").attr("src", "");
						var dataHtml = "" + $("#viewArea").html();
						$("#innerTesxt").val(dataHtml);
						$("#photoCount").val(imageNum);
						$("#viewArea").html("");
						$("#forArea").submit();
					}
					//清除剛剛的操作重來
					function resetForm() {
						$("#viewArea").html("");
						$(".formArea [type='file']").remove();
						$(".formArea")
								.append(
										$("<input class='imageUpload' type='file' name='' >"));
						$(".imageUpload").change(function() {
							$(this).attr("name", "image" + imageNum);
							readURL(this);
						})
					}
				</script>
				<!-- 				<div class="form-group"> -->
				<!-- 					<label class='control-label col-lg-2 col-lg-2' for="productImage"> -->
				<%-- 						<spring:message code='spring.addProduct.form.image.label' /> --%>
				<!-- 					</label> -->
				<!-- 					<div class='col-lg-10'> -->
				<%-- 						<form:input id="productImage" path="productImage" type='file' --%>
				<%-- 							class='form:input-large' /> --%>
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 				<br> -->

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
	<%-- 		<form id="form1" runat="server">  --%>
	<!-- 	<div class="col-lg-10"> -->
	<%-- 					<form:input name="messageDelete" id="messageDelete" --%>
	<%-- 						path="messageDelete" value="1" type='hidden' /> --%>
	<!-- 				</div> -->
	<%-- 	 	</form>  --%>
	<!-- 	<script> -->
	<!--     ClassicEditor -->
	<!--          .create(document.querySelector('#editor')) -->
	<!--          .then(editor => { -->
	<!-- /           console.log(editor); -->
	<!--          }) -->
	<!-- </script> -->

</body>
</html>
