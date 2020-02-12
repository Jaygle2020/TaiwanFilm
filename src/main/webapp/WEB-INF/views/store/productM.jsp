<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">

<title>顯示商品資訊</title>

<style type="text/css">
#paging {
	border-style: hidden;
	position: relative;
	left: 45%;
	top: 10px;
}

#pfirst {
	position: relative;
	left: 2px;
	top: 2px;
}

#pprev {
	position: relative;
	left: 2px;
	top: 2px;
}

#pnext {
	position: relative;
	left: 2px;
	top: 2px;
}

#plast {
	position: relative;
	left: 2px;
	top: 2px;
}

#main {
	position: relative;
	top: 5px;
	left: 40px;
	width: 100%;
}

#content {
	width: 820px;
	margin-left: auto;
	margin-right: auto;
}

.option {
	width: 15%;
	display: inline-block;
	left: 120px;
	position: relative;
	font-size: 40px;
	font-family: 'ZCOOL QingKe HuangYou', cursive;
	padding-bottom: 10px;
	text-align: center;
}

.productContent {
	width: 80%;
	display: inline-block;
	position: relative;
	left: 250px;
	vertical-align: top;
}

.productImage {
	width: 30%;
	display: inline-block;
	position: relative;
}

.productContext {
	width: 50%;
	display: inline-block;
	position: relative;
	vertical-align: top;
}

.optioneffect {
	padding-bottom: 20px;
	letter-spacing: 2px;
}

.optioneffect:hover {
	color: gray;
}

a {
	text-decoration: none;
	color: black;
}

.flip {
	margin: 0px;
	padding: 5px;
	cursor: pointer;
	font-family: 'Arial';
	width: 60%;
}

.panel {
	margin: 0px;
	padding: 5px;
	display: none;
	font-family: 'Arial';
	display: none;
	font-family: 'Arial';
	width: 60%;
}

.productDescription {
	width: 60%;
}

.productDescription-images {
	width: 100%;
}

.productDescription-notice p {
	margin: 0;
}

.productDescription-text li {
	font-size: 20px;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body style="background-color: #fffcfa;">
	<jsp:include page="topMVC.jsp" />


	<div class="option">

		<div>
			<p
				style="text-align: center; border-bottom: 5px solid #828080; padding-bottom: 20px; margin: 30px 0px;">分類</p>
		</div>
		<a href='${pageContext.request.contextPath}/productsM' style="text-decoration: none; color: black;">
			<div class="option1 optioneffect">人氣商品推薦</div>
			<div class="option2 optioneffect">最新商品推薦</div>
			<div class="option3 optioneffect">國片分類專區</div>
			<div class="option4 optioneffect">聯名商品專區</div>
			<div class="option5 optioneffect">活動商品專區</div>
		</a>
	</div>

	<div class="productContent">

		<div class="productImage">
			<div class="mainImage">
				<img src="" style="width: 100%; height: 70%;" class="mainImage1">
			</div>
			<div class="subImage">
				<img class="subImage1" src="<c:url value='getPicture/${product.productId}'/>"
					style="width: 25%; height: 30%;"> <img class="subImage2"
					src="${pageContext.request.contextPath}/images/2000x.jpg" style="width: 25%; height: 30%;"> <img
					class="subImage3" src="${pageContext.request.contextPath}/images/2000y.jpg"
					style="width: 25%; height: 30%;">
			</div>
		</div>

		<div class="productContext">
			<br>
			<h1>${product.title}</h1>
			<br>
			<div style="border-left: 5px solid gray; padding-left: 10px;">
				<p>至01/20 23:00截止 全店，新年大樂透！</p>
				<p>單筆消費滿$1688，即贈2020好運紅包</p>
				<p>全店，宅配費用｜免運優惠，滿1000元(含以上)免運費</p>
			</div>
			<div>
				<h2>NT $ ${product.price}</h2>
			</div>
<!-- 			<div> -->
<!-- 				<span> -->
<!-- 					<button id="minus-buyNums">-</button> <input  readonly id="buyNums" value="1" -->
<!-- 					style="text-align: right;"></input> -->
<!-- 					<button id="add-buyNums">+</button> -->
<!-- 				</span> -->
<!-- 				<button>放入購物車</button> -->
<!-- 			</div> -->
			<div>
				<h3 id="product-stock" style="color: red" value="${product.stock}">現庫存量
					: ${product.stock} 件</h3>
			</div>

			<!-- 		展開收和內容 -->
			<div>
				<div class="flip paymentfilp">

					<i class="fas fa-sort-up rightarrow-p"></i> <i
						class="fas fa-sort-down downarrowd-p" style="display: none;"></i>
					<span class="1">付款方式</span>
				</div>
				<div class="panel paymentpanel" style="border-top: 1px solid gray;">
					<ul>
						<li>信用卡一次付款</li>
						<li>網絡ATM</li>
						<li>ATM櫃員機</li>
						<li>LINE Pay (一次性付款，可同時使用Line Points折抵)</li>
					</ul>
				</div>

				<div class="flip deliverfilp">

					<i class="fas fa-sort-up rightarrow-d"></i> <i
						class="fas fa-sort-down downarrowd-d" style="display: none;"></i>
					<span class="2">送貨方式</span>
				</div>
				<div class="panel deliverpanel" style="border-top: 1px solid gray;">
					<ul>
						<li>序號E-mail發送_免運費</li>
					</ul>
				</div>
			</div>
		</div>


		<div
			style="border-top: 1px solid black; width: 60%; color: #82713d; margin-top: 40px">
			<h3>商品描述</h3>
		</div>
		<div class="productDescription">

			<div class="productDescription-text">
				<br>
				<ul>
					<li>42000Hz標準超音波頻率</li>
					<li>透明面蓋，清洗過程一目了然</li>
					<li>35瓦功率 / 750ml不鏽鋼清洗槽</li>
					<li>五段式定時設定，可自由設定清洗時間</li>
					<li>清水洗淨，乾淨又有效</li>
					<li>可清洗CD、VCD、DVD等光碟，有效去除髒污，避免刮痕</li>
				</ul>
				<br>
			</div>

			<div class="productDescription-images">
				<br> <img src="images/pantherbig.jpg" style="width: 100%;">
				<br>
			</div>

			<div class="productDescription-notice">
				<h4>【購物須知】</h4>
				<p>◎換貨：★STUDIO
					A行動商城不接受換貨★為節省您的等候時間，商城售出商品只退不換，若您有換貨需求，請辦理退貨後，重新下單訂購。</p>
				<p>◎退貨：如商品有瑕疵或不符所需，請務必於收到商品7天內，至 『訂單查詢
					』點選『退貨』，並將商品寄回『104台北市中山區八德路2段260號7樓 STUDIO
					A行動商城』，人員在收到您的退貨申請和寄回的退貨商品後，經確認符合退貨資格，即核准退貨，但原出貨運費因已有出貨程序，恕不歸還(商品瑕疵除外)。</p>
				<p>◎申請退貨的商品必須回復原狀（須回復至商品到貨時的原始狀態）並且保持完整包裝（包括商品本體、配件、贈品、保證書、原廠包裝及所有附隨文件或資料的完整性），切勿缺漏任何配件或損毀原廠外盒。如遺失原廠外包裝，需支付整新費售價30%，故下單前請謹慎考慮。</p>
				<p>◎提醒您：依《消費者保護法》的規定，消費者享有商品貨到日起7天(含例假日)猶豫期的權益★但猶豫期並非試用期★，如購買商品為全新品，拆封使用後即無法退貨。</p>
				<br>
				<h4>【退貨須知】</h4>
				<p>1)、退貨商品之本體、內外包裝及所有隨附文件或資料必須完整，勿缺漏任一配件。如遺失原廠外包裝，需支付整新費售價之30%，故下單前請謹慎考慮。</p>
				<p>2)、欲退貨之商品，請以紙盒完整包裝，避免物流配送過程中因商品損毀而影響您的退貨行使權利或需負擔毀壞之費用。</p>
				<p>3)、因STUDIO
					A商城為信用卡一次付款，如欲退貨，費用會整筆退回，如您整筆訂單購買兩樣以上品項，則不可單獨品項退貨，需將整筆訂單商品一併退回。</p>
				<p>4)、折價券經使用後即無法歸還，日後訂單退貨或取消，恕不歸還，請務必留意折價券使用說明。</p>
				<p>5)、STUDIO A行動商城無提供換貨。若您訂購之商品欲更換規格，請先將該筆訂單辦理退貨後．再重新下訂您所需要的商品。</p>
				<p>6)、如以產品瑕疵名義申請退貨，經確認產品並無瑕疵，將不會核准此筆退貨；因有誠信之疑慮，如有上述情形發生，將可能對該會員拒絕交易或永久取消會員資格辦理，請務必留意。</p>
				<p>7)、如發生會員大量退換貨，因已造成作業上之困擾，STUDIO
					A行動商城會視情況對該會員採取拒絕交易或永久取消其會員資格辦理，請務必留意。</p>
			</div>

			<div
				style="border-top: 1px solid black; width: 100%; color: #82713d; margin-top: 50px;">
				<h3>相關商品</h3>
			</div>
		</div>

		<script>
			//點擊展開訊息
			$(function() {
				$(".paymentfilp").click(function() {
					$(".paymentpanel").slideToggle("normal");
					$(".rightarrow-p").toggle();
					$(".downarrowd-p").toggle();
				});

				$(".deliverfilp").click(function() {
					$(".deliverpanel").slideToggle("normal");
					$(".rightarrow-d").toggle();
					$(".downarrowd-d").toggle();
				});
			});
			
			//點擊小圖轉大圖
			$(function() {
				$(".mainImage1").attr("src", $('.subImage1').attr('src'));
				$(".subImage1").click(function() {
					$(".mainImage1").attr("src", $('.subImage1').attr('src'));
				});
				$(".subImage2").click(function() {
					$(".mainImage1").attr("src", $('.subImage2').attr('src'));
				});
				$(".subImage3").click(function() {
					$(".mainImage1").attr("src", $('.subImage3').attr('src'));
				});
			});

			
			//點擊購買數量
			$(function() {
				var productStock = $('#product-stock').attr('value');
				var buyNums = $('#buyNums').attr('value');
				console.log(productStock);
				console.log(buyNums);

				$('#add-buyNums').click(function() {
					if (buyNums < productStock) {
						buyNums++;
					}
					$('#buyNums').attr('value', buyNums);
					console.log(buyNums);
				});

				$('#minus-buyNums').click(function() {
					if (buyNums > 0) {
						buyNums--;
					}
					$('#buyNums').attr('value', buyNums);
				});

			});
		</script>
</body>
</html>