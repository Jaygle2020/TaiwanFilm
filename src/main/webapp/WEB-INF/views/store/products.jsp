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
	href="https://fonts.googleapis.com/css?family=ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">




<title>顯示商品資訊</title>

<style type="text/css">
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

.productlist {
	width: 100%;
	display: none;
	position: relative;
	left: 40px;
	vertical-align: top;
	text-align: center;
}

.product {
	width: 25%;
	display: inline-block;
	border: 1px solid #cecaca;
	border-radius: 2%;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	margin: 5px;
}

.product:hover {
	transform: translateY(-10px);
	box-shadow: 0 15px 25px #D3E7E7;
}

.active {
	display: inline-block;
}

.optioneffect {
	padding-bottom: 20px;
	letter-spacing: 2px;
	padding-bottom: 20px;
}

.optioneffect:hover {
	color: gray;
}

a {
	text-decoration: none;
	color: black;
}

/* 分頁 */
.thispage {
	text-decoration: underline;
}

.pages {
	display: none;
}

.holder {
	font-size: 20px;
	text-align: center;
}
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>



</head>
<body style="background-color: #fffcfa;">
	<jsp:include page="topMVC.jsp" />


	<br>
	<br>
	<div class="productlist active">

		<div>
			<!-- 模糊查詢 -->
			<form action="${pageContext.request.contextPath}/keyQuery" type="Get">
				<p>
					搜尋：<input name="keyWord" type="text"></input>
				<p>
			</form>
			<!-- 類別搜尋 -->
			<form
				action="${pageContext.request.contextPath}/selectQuery"
				type="Get">
 				
			 	<select class="selectCategory" name="category" onchange="">
					<option style="display:none;" value="" selected disabled>類別</option>
					 <c:forEach var="categorys" items='${categoryList}'> 
						
						<option value="${categorys}">${categorys}</option>
					 </c:forEach> 
				</select>  
				<input style="display:none" class="categorySubmit" type="submit" value="Submit" onclick=""></input>
			</form>

		</div>

		<c:forEach var='product' items='${products}' varStatus="paging">
			<c:if test='${paging.last}'>
				<div class="pagingcount" style="display: none">${paging.count}
				</div>
			</c:if>
			<c:choose>
				<c:when test="${paging.count > 6}">
					<div id="pageproduct${paging.count}" class="product"
						style="display: none;">
				</c:when>
				<c:otherwise>
					<div id="pageproduct${paging.count}" class="product">
				</c:otherwise>
			</c:choose>
			<a href="<spring:url value='product?id=${product.productId}' />">

				<div style="width: 100%">
					<img style="width: 75%; height: 300px;"
						src="<c:url value='/getPicture/${product.productId}'/>" />
				</div>
				<div>
					<p>品名 : ${product.title}</p>
					<p>電影 : ${product.author}</p>
					<p>類別 : ${product.category}</p>
					<%-- <p>目前在庫數量 : ${product.stock}</p> --%>
				</div>
	</div>

	</c:forEach>
	</div>

	<!-- </div> -->

	<!-- <div class="productlist" id="newest">

		<div class="product">
							<a href="http://shop.studioa.com.tw/SalePage/Index/5249087">
			<div style="width: 100%">
				<img src="../images/BlackPanther.jpg" style="width: 100%">
			</div>
			<div>
				<h3>字字字字字字字</h3>
				<p>字字字字字字字字字字字字字字字字字</p>
			</div>
								</a>
		</div>

	</div>

	<div class="productlist" id="loaclfilms">

		<div class="product">
							<a href="http://shop.studioa.com.tw/SalePage/Index/5249087">
			<div style="width: 100%">
				<img src="../images/BlackPanther.jpg" style="width: 100%">
			</div>
			<div>
				<h3>字字字字字字字</h3>
				<p>字字字字字字字字字字字字字字字字字</p>
			</div>
		</div>

	</div>

	<div class="productlist" id="crossover">

		<div class="product">
							<a href="http://shop.studioa.com.tw/SalePage/Index/5249087">
			<div style="width: 100%">
				<img src="../images/BlackPanther.jpg" style="width: 100%">
			</div>
			<div>
				<h3>字字字字字字字</h3>
				<p>字字字字字字字字字字字字字字字字字</p>
			</div>
								</a>
		</div>
	</div>

	<div class="productlist" id="activity">

		<div class="product">
							<a href="http://shop.studioa.com.tw/SalePage/Index/5249087">
			<div style="width: 100%">
				<img src="../images/BlackPanther.jpg" style="width: 100%">
			</div>
			<div>
				<h3>字字字字字字字</h3>
				<p>字字字字字字字字字字字字字字字字字</p>
			</div>

		</div>
	<!-- </div> -->

	<br>
	<br>


	<!-- 分頁 -->
	<div class="holder">
		<a href="#" class="p-previous">← previous</a> <a href="#" id="page1"
			class="pages thispage">1</a> <a class="pages" href="#" id="page2">2</a>
		<a class="pages" href="#" id="page3">3</a> <a class="pages" href="#"
			id="page4">4</a> <a class="pages" href="#" id="page5">5</a> <a
			class="pages" href="#" id="page6">6</a> <a class="pages" href="#"
			id="page7">7</a><span>...</span> <a href="#" class="p-next">next
			→</a>
	</div>







	<script>
	
	$('.selectCategory').change(function(){
		console.log("123");
		$('.categorySubmit').click(); 
	});
		/*	$('.option1').click(function() {
		 $('.productlist').removeClass('active');
		 $('#popular').addClass("active");

		 });

		 $('.option2').click(function() {
		 $('.productlist').removeClass("active");
		 $('#newest').addClass("active");
		 });

		 $('.option3').click(function() {
		 $('.productlist').removeClass("active");
		 $('#loaclfilms').addClass("active");
		 });
		 $('.option4').click(function() {
		 $('.productlist').removeClass("active");
		 $('#crossover').addClass("active");
		 });
		 $('.option5').click(function() {
		 $('.productlist').removeClass("active");
		 $('#activity').addClass("active");
		 });
		 */

		$('#page1').click(function() {
			$('.holder a').removeClass("thispage");
			$('#page1').addClass("thispage");
			$('.product').hide();
			$('#pageproduct1').show();
			$("#pageproduct2").show();
			$("#pageproduct3").show();
			$("#pageproduct4").show();
			$("#pageproduct5").show();
			$("#pageproduct6").show();

		});
		$('#page2').click(function() {
			$('.holder a').removeClass("thispage");
			$('#page2').addClass("thispage");

			$('.product').hide();
			$("#pageproduct7").show();
			$("#pageproduct8").show();
			$("#pageproduct9").show();
			$("#pageproduct10").show();
			$("#pageproduct11").show();
			$("#pageproduct12").show();
		});

		$('#page3').click(function() {
			$('.holder a').removeClass("thispage");
			$('#page3').addClass("thispage");

			$('.product').hide();
			$("#pageproduct13").show();
			$("#pageproduct14").show();
			$("#pageproduct15").show();
			$("#pageproduct16").show();
			$("#pageproduct17").show();
			$("#pageproduct18").show();
		});
		$('#page4').click(function() {
			$('.holder a').removeClass("thispage");
			$('#page4').addClass("thispage");

			$('.product').hide();
			$("#pageproduct19").show();
			$("#pageproduct20").show();
			$("#pageproduct21").show();
			$("#pageproduct22").show();
			$("#pageproduct23").show();
			$("#pageproduct24").show();
		});
		$('#page5').click(function() {
			$('.holder a').removeClass("thispage");
			$('#page5').addClass("thispage");

			$('.product').hide();
			$("#pageproduct25").show();
			$("#pageproduct26").show();
			$("#pageproduct27").show();
			$("#pageproduct28").show();
			$("#pageproduct29").show();
			$("#pageproduct30").show();
		});
		$('#page6').click(function() {
			$('.holder a').removeClass("thispage");
			$('#page6').addClass("thispage");

			$('.product').hide();
			$("#pageproduct31").show();
			$("#pageproduct32").show();
			$("#pageproduct33").show();
			$("#pageproduct34").show();
			$("#pageproduct35").show();
			$("#pageproduct36").show();
		});
		$('#page7').click(function() {
			$('.holder a').removeClass("thispage");
			$('#page7').addClass("thispage");

			$('.product').hide();
			$("#pageproduct37").show();
			$("#pageproduct38").show();
			$("#pageproduct39").show();
			$("#pageproduct40").show();
			$("#pageproduct41").show();
			$("#pageproduct42").show();
		});

		$('.p-previous').click(function() {

			if ($('.pages').hasClass("thispage")) {
				var pagenumminus = $('.thispage').attr("id").substring(4) - 1;
				console.log(pagenumminus);
				$('[id=page' + pagenumminus + ']').click();
			}
		});

		$('.p-next').click(
				function() {
					if ($('.pages').hasClass("thispage")) {

						var pagenumadd = parseInt($('.thispage').attr("id")
								.substring(4)) + 1;
						if (pagenumadd <= pagemath) {

							console.log("pagenumadd=" + pagenumadd);
							$('[id=page' + pagenumadd + ']').click();
						}
					}
				});

		var pagingcount = $('.pagingcount').html();
		console.log(pagingcount);

		var pagemath = parseInt(((pagingcount - 1) / 6) + 1);
		console.log('pagemath=' + pagemath);

		var pagenum = $('.pages').attr('id').substring(4);
		console.log(pagenum);

		switch (pagemath) {
		case 7:
			$('#page7').show();
		case 6:
			$('#page6').show();
		case 5:
			$('#page5').show();
		case 4:
			$('#page4').show();
		case 3:
			$('#page3').show();
		case 2:
			$('#page2').show();
		case 1:
			$('#page1').show();
		};
		
		
		
	</script>
</body>
</html>