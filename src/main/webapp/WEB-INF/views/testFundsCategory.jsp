<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/FlyingV.css" type="text/css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	<title>FlyingV</title>
</head>


<body>
	<div class="header">
		<div class="h-logo" style="letter-spacing:-3px">
			<a href='<c:url value="/index" />'>
				<p class="Theme">FlyingV
			</a>
		</div>
		
		<div class="left-menu">
			<div>
				<a href="">提案</a>
			</div>
			<div>
				<a href="">探索</a>
			</div>
			<div>
				<a href="">探索</a>
			</div>                                                                                               
		</div>
		<div class="right-menu">
			<div>
				<a href="">關於我們</a>
			</div>
			<div>
				<a href="">我的帳戶</a>
			</div>
		</div>
	</div>


	<div class="section" id="main">
		<div class="width-limit">
			<div class="thisWeekend">
				<ul class="Weekend">
					<li class="title">本周動態</li>
					<br>
					<li>6建新專案</li>
					<li>有36件案子再募資</li>
				</ul>
			
				<ul class="Weekendcategory">
					<li>設計</li>
					<li>音樂</li>
					<li>影視</li>
				</ul>
				<ul class="Weekendcategory">
					<li>科技</li>
					<li>藝術</li>
					<li>休閒</li>
				</ul>
				<ul class="Weekendcategory">
					<li>公共<span>new</span></li>
					<li>在地<span>new</span></li>
					<li>運動<span>new</span></li>
				</ul>
				<ul class="Weekendcategory">
					<li>遊戲<span>new</span></li>
					<li>出版</li>
					<li>旅行</li>
				</ul>
			</div>
		</div>
	</div>





	<div class="section" id="category">
		<div class="width-limit">
			<!-- 分頁按鈕 -->
			<div class="change-category">
				<div class="change-menu">
					<div class="buttonBorder-active buttonBorder" id="hot-button">熱門項目</div>
					<div class="buttonBorder" id="new-button">最新發起</div>
					<div class="buttonBorder"  id="coming-button">即將開始</div>
					<div class="buttonBorder"  id="end-button">即將結束</div>
					<div class="buttonBorder"  id="money-button">募資金額</div>
				</div>
			</div>


			<!-- 熱門分頁區塊 -->
			<div class="category-content active" id="hot">
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic05.jpg">
					</div>
					<div class="project">
						<p class="title">很火熱的</p>
						<p class="small-title">POIEMA</p>
						<p class="content">PPOIEMA 2019年度最新作品！萬元以內的親民價格，卻擁有零耗材、高效能、低噪音等人性化技術特色。</p>
					</div>
					<div class="downMeta">
						<div class="wholePercent"></div>
						<div class="realPercent"></div>
					</div>
					<div class="plan">
						<span class="money">$10,000</span>
						<span class="percent">10%</span>
						<span class="date">還剩
							<strong>22小時</strong>
						</span>
					</div>
				</div>
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic05.jpg">
					</div>
					<div class="project">
						<p class="title">結束的</p>
						<p class="small-title">POIEMA</p>
						<p class="content">POIEMA 2019年度最新作品！萬元以內的親民價格，卻擁有零耗材、高效能、低噪音等人性化技術特色。</p>
					</div>
					<div class="downMeta">
						<div class="wholePercent"></div>
						<div class="realPercent"></div>
					</div>
					<div class="plan">
						<span class="money">$10,000</span>
						<span class="percent">10%</span>
						<span class="date">還剩
							<strong>22小時</strong>
						</span>
					</div>
				</div>
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic05.jpg">
					</div>
					<div class="project">
						<p class="title">結束的</p>
						<p class="small-title">POIEMA</p>
						<p class="content">POIEMA 2019年度最新作品！萬元以內的親民價格，卻擁有零耗材、高效能、低噪音等人性化技術特色。</p>
					</div>
					<div class="downMeta">
						<div class="wholePercent"></div>
						<div class="realPercent"></div>
					</div>
					<div class="plan">
						<span class="money">$10,000</span>
						<span class="percent">10%</span>
						<span class="date">還剩
							<strong>22小時</strong>
						</span>
					</div>
				</div>
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic05.jpg">
					</div>
					<div class="project">
						<p class="title">結束的</p>
						<p class="small-title">POIEMA</p>
						<p class="content">POIEMA 2019年度最新作品！萬元以內的親民價格，卻擁有零耗材、高效能、低噪音等人性化技術特色。</p>
					</div>
					<div class="downMeta">
						<div class="wholePercent"></div>
						<div class="realPercent"></div>
					</div>
					<div class="plan">
						<span class="money">$10,000</span>
						<span class="percent">10%</span>
						<span class="date">還剩
							<strong>22小時</strong>
						</span>
					</div>
				</div>
			</div>
			
			<!-- 新募資分頁區塊 -->
			<div class="category-content" id="new">
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic05.jpg">
					</div>
					<div class="project">
						<p class="title">很新的</p>
						<p class="small-title">POIEMA</p>
						<p class="content">POIEMA 2019年度最新作品！萬元以內的親民價格，卻擁有零耗材、高效能、低噪音等人性化技術特色。</p>
					</div>
					<div class="downMeta">
						<div class="wholePercent"></div>
						<div class="realPercent"></div>
					</div>
					<div class="plan">
						<span class="money">$10,000</span>
						<span class="percent">10%</span>
						<span class="date">還剩
							<strong>22小時</strong>
						</span>
					</div>
				</div>

			</div>

			<!-- 即將加入的分頁區塊 -->
			<div class="category-content" id="coming">
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic05.jpg">
					</div>
					<div class="project">
						<p class="title">要來的</p>
						<p class="small-title">POIEMA</p>
						<p class="content">POIEMA 2019年度最新作品！萬元以內的親民價格，卻擁有零耗材、高效能、低噪音等人性化技術特色。</p>
					</div>
					<div class="downMeta">
						<div class="wholePercent"></div>
						<div class="realPercent"></div>
					</div>
					<div class="plan">
						<span class="money">$10,000</span>
						<span class="percent">10%</span>
						<span class="date">還剩
							<strong>22小時</strong>
						</span>
					</div>
				</div>
			</div>

			<!-- 已結束分頁區塊 -->
			<div class="category-content" id="end">
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic05.jpg">
					</div>
					<div class="project">
						<p class="title">結束的</p>
						<p class="small-title">POIEMA</p>
						<p class="content">POIEMA 2019年度最新作品！萬元以內的親民價格，卻擁有零耗材、高效能、低噪音等人性化技術特色。</p>
					</div>
					<div class="downMeta">
						<div class="wholePercent"></div>
						<div class="realPercent"></div>
					</div>
					<div class="plan">
						<span class="money">$10,000</span>
						<span class="percent">10%</span>
						<span class="date">還剩
							<strong>22小時</strong>
						</span>
					</div>
				</div>
			</div>

			<!-- 募資金額 -->
			<div class="category-content" id="money">
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic05.jpg">
					</div>
					<div class="project">
						<p class="title">募資</p>
						<p class="small-title">POIEMA</p>
						<p class="content">POIEMA 2019年度最新作品！萬元以內的親民價格，卻擁有零耗材、高效能、低噪音等人性化技術特色。</p>
					</div>
					<div class="downMeta">
						<div class="wholePercent"></div>
						<div class="realPercent"></div>
					</div>
					<div class="plan">
						<span class="money">$10,000</span>
						<span class="percent">10%</span>
						<span class="date">還剩
							<strong>22小時</strong>
						</span>
					</div>
				</div>
			</div>
			<div class="loadingMore">
				<button>載入更多</button>
			</div>
		</div>

	</div>

	<div class="section" id="footer">
		<div class="width-limit">
			<div class="footer-content">
				<h3>關於</h3>
				<ul>
					<li>關於我們</li>
					<li>人才招募</li>
					<li>媒體資源</li>
					<li>商標使用規範</li>
				</ul>
			</div>
			<div class="footer-content">
				<h3>條款</h3>
				<ul>
					<li>網站使用條款</li>
					<li>探索者合約</li>
				</ul>
			</div>
			<div class="footer-content">
				<h3>協助</h3>
				<ul>
					<li>常見問題</li>
					<li>使用手冊</li>
					<li>提案百科</li>
				</ul>
			</div>
			<div class="footer-content">
				<h3>更多</h3>
				<ul>
					<li>關於我們</li>
					<li>人才招募</li>
					<li>媒體資源</li>
					<li>商標使用規範</li>
				</ul>
			</div>
			<div class="copyright">
				<p>FLYINGV © 2012-2020.</p>
				<p>ALL RIGHTS RESERVED.</p>
			</div>
		</div>
	</div>
	





<script type="text/javascript"></script>
<script>

 $('#hot-button').click(function(){
    	$('.category-content').removeClass("active active-bottom"); 
    	$('#hot').addClass("active"); 
    	$('.buttonBorder').removeClass("buttonBorder-active");
    	$('#hot-button').addClass("buttonBorder-active");

	});
    $('#new-button').click(function(){
    	$('.category-content').removeClass("active active-bottom"); 
    	$('#new').addClass("active"); 
    	$('.buttonBorder').removeClass("buttonBorder-active");
    	$('#new-button').addClass("buttonBorder-active");
	});
	 $('#coming-button').click(function(){
	 	$('.category-content').removeClass("active active-bottom"); 
    	$('#coming').addClass("active"); 
    	$('.buttonBorder').removeClass("buttonBorder-active");
    	$('#coming-button').addClass("buttonBorder-active");
	});
	  $('#end-button').click(function(){
	  	$('.category-content').removeClass("active active-bottom");
    	$('#end').addClass("active"); 
    	$('.buttonBorder').removeClass("buttonBorder-active");
    	$('#end-button').addClass("buttonBorder-active");
	});
	    $('#money-button').click(function(){
	  	$('.category-content').removeClass("active active-bottom"); 
    	$('#money').addClass("active"); 
    	$('.buttonBorder').removeClass("buttonBorder-active");
    	$('#money-button').addClass("buttonBorder-active");
	});




	


</script>
</body>
</html>
