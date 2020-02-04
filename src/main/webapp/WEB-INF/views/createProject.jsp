<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel=stylesheet type="text/css"
	href="${pageContext.request.contextPath}/css/create.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/movie2.css" />
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
<!-- 網頁就緒時執行的JS -->
	$(function() {
		$(".datepicker").datepicker();
		donateOptionElm();
		$("#dliverDate").val(
				$("#deliverYear").val() + "-" + $("#deliverMonth").val());
	});
</script>
</head>

<body>
	<jsp:include page="top.jsp" />
	<div id="createWrapper" class="wrapper createWrapper">
		<div class="createContainer">
			<section class="createMenu">
				<ul class="createMenuList">
					<li class="option1 opts selected">專案大綱</li>
					<li class="option2 opts">專案內容</li>
					<li class="option3 opts">贊助設定</li>
				</ul>
			</section>

			<section class="formSection">
				<form:form method="POST" modelAttribute="CrowdFundingBean"
					action="${pageContext.request.contextPath}/submitProject"
					enctype="multipart/form-data" id="projectForm">
					<div class="active create-basic productlist form-group">
						<div class="createFormIntro partialWidthBlock">
							<p>在這個區塊您將填寫專案內容中最吸引人募資影片、封面圖片和專案說明。</p>
						</div>
						<div class="partialWidthBlock projectCardGroup">
							<div class="projectDataGroup">
								<h2>專案標題</h2>
								<input type="text" name="projectName" value="${ProjectBean.projectName}">
								<P>一個好的標題應該要好記、好搜尋、吸引人想點進去看，並讓瀏覽者能在最短的時間內瞭解專案的核心理念。</P>
								<h2>內容摘要</h2>
								<textarea name="projDescript" form="projectForm" rows="8" 	cols="80" maxlength="200">
								${ProjectBean.projDescript}
								</textarea>
								<p>使用吸引人的短文說明你的目標以及理念，強調你的獨一無二，讓贊助人對你或你的專案好奇，願意更進一步了解專案。</p>
							</div>
							<div class="createProjectCard"></div>
							<h2>上傳專案圖片</h2>
							<input type="file" name="photoStr"
								accept="image/jpeg,image/png,image/bmp">
							<h2>專案影片 &nbsp; (注意某些私人youtube影片是不開放其他網站載入)</h2>
							
							<input type="text" name="vedio" value="https://www.youtube.com/watch?v=${ProjectBean.videoLink}" placeholder="請輸入youtube影片連結網址">
							<h2>募資目標金額</h2>
							<p>
								<form:input type="number" max="99999999" min="0"
									path="fundsGoal" />
								元
							</p>
							<h2>募資開始與結束日期</h2>
							<p>
								開始日期:
								<form:input class="datepicker" path="dateBegin" />
							</p>
							<p>
								結束日期:
								<form:input class="datepicker" path="dateEnd" />
							</p>
						</div>
						<div id="submitAll">
							<input type="submit" value="送出專案"><BR> <input
								type="reset" value="取消專案">
						</div>
					</div>
				</form:form>

				<div class="create-info productlist form-group"></div>

				<div class="create-reward productlist form-group">

					<div class="rewardItem form-group">
						<div class="createCard">
							<p>回饋金額，最低100元</p>
							<input type="number" name="donateMoney" min="100"><br>
							<p>內容摘要</p>
							<textarea name="donateDescription" form="projectForm" rows="12"
								cols="40"></textarea>
						</div>
						<div class="previewCard">
							<p>回饋封面</p>
							<div id="photoPre">
								<p>目前沒有圖片</p>
							</div>
							<p>請提供 JPEG、PNG 或 BMP 檔，圖片尺寸至少 1024 x 768 px； 並將檔案大小控制在 1MB
								以內。</p>
							<input type="file" id="donatePhoto" name="pictureStr"
								accept="image/jpeg,image/png,image/bmp">
						</div>
						<div class="rewardInfo">
							<p>運送區域</p>
							<select name="shipping">
								<option value="InTaiwan">台灣本島</option>
								<option value="OutOfTaiwan">外島地區</option>
								<option value="Foreign">其他國家</option>
							</select>
							<p>預計寄送時間</p>
							<select id="deliverYear"></select><select id="deliverMonth"></select>
							<input type="hidden" name="dliverDate" id="dliverDate">
							<p>限量份數</p>
							<input type="number" name="limit" min="1" max="999999">
							<input type="hidden" name="projectId" value="${ProjectBean.projectId}">
						</div>
					</div>
				</div>
				<div class="create-story productlist form-group">
					<h1>專案計畫描述</h1>
					<div class="projectDetail">
						<div class="textTable">
							<h2>輸入的文章預覽</h2>
							<span><input type="type" id="enterTittle" placeholder="請輸入主題標頭" ></span><br>
							<div id="viewArea"></div>
						</div>
						<div class="toolBar">
							<textarea name="" id="enterTable" cols="50" rows="10" placeholder="請在此輸入段落文章"></textarea>
							<br>
							<button type="button" onclick="enterText()">送出段落</button>
							<form class="formArea" id="formArea" method="post" action="${pageContext.request.contextPath}/createPjInfo"
								enctype="multipart/form-data">
								<input type="hidden" name="projectId" value="${ ProjectBean.projectName}"  >
								<input type="hidden" id="textTittle" name="textTittle" value="" >
								<input id="innerTesxt" type="hidden" name="innerText" value="" >
								<input id="photoCount" type="hidden" name="photoCount" value="" >
								<input class="imageUpload" type="file" name="">
							</form>
							<span>可插入圖片上限4張</span><br>
							<button id="formSubmit" type="button" onclick="formSubmit()">儲存結果</button>
							<button id="restForm" type="button" onclick="resetForm()">清除</button>
						</div>

					</div>
				</div>
			</section>

		</div>

	</div>
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/createProj.js"></script>
	<script>
	//分頁按鈕
	$('.option1').click(function() {
		$('.productlist').removeClass('active');
		$('.opts').removeClass('selected');
		$('.create-basic').addClass("active");
		$('.option1').addClass("selected");
	});

	$('.option2').click(function() {
		$('.productlist').removeClass("active");
		$('.opts').removeClass('selected');
		$('.create-story').addClass("active");
		$('.option2').addClass("actived");
	});

	$('.option3').click(function() {
		$('.productlist').removeClass("active");
		$('.opts').removeClass('selected');
		$('.create-reward').addClass("active");
		$('.option3').addClass("actived");
	});
	</script>
</body>

</html>
