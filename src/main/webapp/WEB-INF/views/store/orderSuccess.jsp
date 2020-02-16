<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<head>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/favicon.ico" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menuStyle.css">
<title>Taiwan Films - 訂購成功</title>
<style>
.productContent {
	padding: 30px 150px 50px 150px;
}

.productOrder {
	width: 80%;
	border: solid;
	padding: 20px;
	margin: 20px 0px 50px 0px;
}

body {
	background-image: url(img/wall1.jpeg);
}

.whole {
	text-align: center;
	width: 100%
}

.ball-area {
	width: 80%;
	display: inline-block
}

.number {
	position: relative;
	padding-top: 7px;
	color: white;
	font-weight: bold;
}

.Process {
	width: 100%;
}

.Process-area {
	text-align: center;
	width: 100%;
	display: inline-block;
}

.ball1 {
	width: 70px;
	height: 40px;
	display: inline-block;
	font-size: 14px;
}

.ball2 {
	width: 270px;
	display: inline-block;
}

.ball-area1 {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background: #cccccc;
	display: inline-block
}

.ball-area2 {
	width: 300px;
	height: 5px;
	background: #f8f9fa;
	display: inline-block;
}

.area {
	width: 80%;
	display: inline-block;
	text-align: center
}

.process3 {
	background: #9c9c90;
}

.shopping {
	text-align: center;
	display: inline-block;
	width: 80%;
	background: #f6f6f6;
}

.shopping-title {
	text-align: left;
	padding: 20px;
	font-size: 20px;
}

.content {
	width: 100%;
	background: white;
	padding: 10px 0px;
	display: inline-block;
}

.content-area {
	width: 13%;
	display: inline-block;
	padding-top: 15px;
	text-align: center
}

.Information {
	width: 15%;
	text-align: left;
}

.img {
	width: 100%;
	display: inline-block;
	margin-left: -17px;
}

.desc {
	width: 65%;
	display: inline-block;
}

.ball-area {
	width: 80%;
	text-align: center;
}

.ball {
	width: 50px;
	height: 50px;
	margin: 0px 50px;
	border-radius: 50%;
	display: inline-block;
	background: red;
}
</style>
</head>
<body>

	<jsp:include page="../fragment/menu.jsp" />
	<div class="ball-area" style="padding-left: 150px; padding-top: 85px;">
		<div class="Process">
			<div class="Process-area">
				<div class="ball-area1  process1">
					<div class="number">1</div>
				</div>
				<div class="ball-area2"></div>
				<div class="ball-area1  process2">
					<div class="number">2</div>
				</div>
				<div class="ball-area2"></div>
				<div class="ball-area1  process3">
					<div class="number">3</div>
				</div>
			</div>
		</div>
		<div class="Process">
			<div class="Process-area">
				<div class="ball1">購物車</div>
				<div class="ball2"></div>
				<div class="ball1">填寫資料</div>
				<div class="ball2"></div>
				<div class="ball1">訂單確認</div>
			</div>
		</div>
	</div>


	<div class="productContent">
		<!-- 訂購成功提示訊息 -->
		<div>

			<h3>訂購成功！</h3>

			<%-- 		<p>
				請於 <span style="color: red">${session.sessionDate.substring(4, 6) }/
					${session.sessionDate.substring(6, 8) }&ensp;${session.sessionTime.substring(0, 2) - 1 }:${session.sessionTime.substring(3, 5) }
					(${session.sessionDay })</span> 前完成付款。
			</p> --%>
			<p>請於 7 內完成付款。</p>
		</div>

		<!--行程0訂單-->
		<div>
			<div>
				訂票代碼為&ensp;
				<div style="display: inline-block; color: red;">Ａftcg1099</div>
			</div>
			<div>
				<!-- 訂票人&ensp;<span style="font-size: 24px">${member.memberName }</span> -->
			</div>
			<!-- 列車資訊表格 -->
			<%-- 		<table
		style="margin-left: auto; margin-right: auto; width: 810; border-collapse: collapse;">

			<tr id='borderA' height='50'>
			<th id='borderA' colspan="4" align="center">${members.memberName}的訂購紀錄</th>
		</tr>
		<tr id='borderA' height='60'>
			<th id='borderA' style="background: cadetblue;">訂單編號</th>
			<th id='borderA' style="background: cadetblue;">訂購日期</th>
			<th id='borderA' style="background: cadetblue;">總金額</th>
			<th id='borderA' style="background: cadetblue;">送貨地址</th>
		</tr>
		<c:forEach var="anOrderBean" varStatus="stat" items="${memberOrders}">
			<TR id='borderA' style="height: 50">
				<TD id='borderA' height="40" width="90" align="center"><a
					href='<c:url value='orderDetail.do?memberId=${members.memberId}&orderNo=${anOrderBean.orderNo}' />'>
						A000${anOrderBean.orderNo} </a></TD>
				<TD id='borderA' height="40" width="250" align="center">${anOrderBean.orderDate}</TD>
				<TD id='borderA' height="40" width="100" align="center">${anOrderBean.totalAmount}</TD>
				<TD id='borderA' height="40" width="400" align="center">&nbsp;${anOrderBean.shippingAddress}</TD>

			</TR>
		</c:forEach>
		<tr height='36' id='borderA' style="background: #76d293;">
			<td id='borderA' align="center" colspan="4" ><a style="text-decoration:blink;"
				href="<c:url value='products' />">再去逛逛</a></td>
		</tr>
	</TABLE> --%>
		</div>
		<br> <br> <br> <br>

		<div class="mart">
			<p>
				<strong>支援以下超商付款:</strong>
			</p>
			<img src="${pageContext.request.contextPath }/img/supermark/ipon.png"
				alt="7-11 ibon" title="7-11 ibon"> <img
				src="${pageContext.request.contextPath }/img/supermark/familymart.png"
				alt="全家 FamiPort" title="全家 FamiPort"> <img
				src="${pageContext.request.contextPath }/img/supermark/ok.png"
				alt="OK OK-go" title="OK OK-go"> <img
				src="${pageContext.request.contextPath }/img/supermark/life.png"
				alt="萊爾富 Life-ET" title="萊爾富 Life-ET">
		</div>
	</div>

	<jsp:include page="../fragment/bottom.jsp" />
</body>
<script>
	var num = $
	{
		Order.orderNo
	};
	for (var len = (num + "").length; len < 7; len = num.length) {
		num = "0" + num;
	}
	$("#ticketId").text(num);
</script>
</html>