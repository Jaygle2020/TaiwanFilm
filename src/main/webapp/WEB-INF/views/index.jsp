<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
   
<!DOCTYPE html>
<html>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<title>Taiwam Films</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Mukta&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/finalIndex.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menuStyle.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/movie.css"
	type="text/css">
<!-- 	<link href="https://fonts.googleapis.com/css?family=Mukta&display=swap" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei&display=swap" rel="stylesheet"> -->
<!-- <link id="MonoTypeFontApiFontTracker" type="text/css" rel="stylesheet" href="https://fast.fonts.net/t/1.css?apiType=js&amp;projectid=b2d946f7-734c-4b45-a07f-3923a384b0dd"> -->

<body style="margin: 0;background-image: url(img/wall1.jpeg)">

	<jsp:include page="fragment/menu.jsp" />
 <!-- 改改改 -->

	<div class="bottom-bar">	
		<div class="bottom-bar-content">豐盛之城－臺灣三部曲 Formosa Wonderland -
			「勇士計畫」預計2021年啟動</div>
	</div>
		<div class="dots" style="writing-mode: tb-rl;z-index: 200">
			<div id="home-area" class="dot dot-pink"></div>  
			<div id="activity-area" class="dot"></div>
			<div id="funds-area" class="dot"></div>  
			<div id="movie-area" class="dot"></div>
		</div>
	

	<div class="indexWidth">
		<div class="mainContent">
			<div class="mainContent-coverImg"></div>
			<div class="mainContentimg">
				<div class="mainContent-img-left"></div>
				<div class="mainContent-img-right"></div>
			</div>
		</div>
			


	 <jsp:include page="activity/activities.jsp" /> 

		<div class="funds-trailer" >  
			<div class="Ftrailer-video">
				<iframe width="800px" height="400px"
					src="https://www.youtube.com/embed/eZxkpvoJI2Q" frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>
			<div class="Ftrailer-title">FUNDS</div>
			<div class="Ftrailer-txt">測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字</div>
		</div>
		<div class="funds">      
			<div class="introduction">
				<div class="f-inner">
					<div class="f-img1 f-img-style"></div>  
					<div class="f-img2 f-img-style"></div>
					<div class="f-img3 f-img-style"></div>
					<!-- <img src="img/test1.jpg">
					<img src="img/test2.jpg">
					<img src="img/test3.jpg"> -->
				</div>
				<div class="f-content">
					<div class="f-content-pad">
						<h3>募資介紹</h3>
						<p>
							ドキュメンタリー映画では、2016年に学生団体「SEALDs」の活動を追った『わたしの自由について』が北米最大のドキュメンタリー映画祭・HotDocsに正式出品、毎日映画コンクール
							ドキュメンタリー部門にノミネートされ、2017年に、目と耳の両方に障害のある「盲ろう者」の日常を追った『もうろうをいきる』を発表し、劇映画では、『Starting
							Over』(2014)が東京国際映画祭をはじめ、国内外10以上の映画祭に正式招待され高い評価を得た西原孝至監督が、初めてドキュメンタリーと劇映画が混在した実験的なモノクロ映画を制作。

							西原監督は、2015年から、東京に住んでいる若い女性たちの生き方をオムニバスで紹介するドキュメンタリー映画を作ろうと動き始めたが、2017年10月に#MeToo運動が広がると、劇映画部分を思いつき、4年間撮り貯めてきた登場人物の生活に加え、新たに劇映画の要素を撮影し、1本の映画にまとめた。もともとは、“フェミニズム”をテーマにして制作を始めたが、性別に限らず、「世の中にはいろいろな生き方があって、その人がその人であることがまず素晴らしいということを大切にしたい。」という、“多様性”を肯定する映画に仕上がった
						</p>
					</div>
				</div>
				<div class="f-txt">測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測</div>
			</div>
			<div class="story">
				<div class="f-content">
					<div class="f-content-pad">
						<h3>募資故事</h3>
						<p>東京で暮らす私たち。
							ドキュメンタリー映画監督の池田（岩瀬亮）は、フェミニズムに関するドキュメンタリーの公開に向け、取材を受ける日々を送っている。池田はある日、パートナーのユカ（秋月三佳）に、体調の悪い母親の介護をするため、彼女が暮らすカナダに移住すると告げられる。
							ヌードモデルの兎丸（兎丸愛美）は、淳太（戸塚純貴）との関係について悩んでいる友人の大学生・美帆（遠藤新菜）に誘われて、池田の資料映像用のインタビュー取材に応じ、自らの家庭環境やヌードモデルになった経緯を率直に答えていく。
							独立レーベルで活動を続けている歌手のBOMI（BOMI）がインタビューで語る、“幸せとは”に触発される池田。
							それぞれの人間関係が交錯しながら、人生の大切な決断を下していく。</p>
					</div>
				</div>
				<div class="f-inner">
					<div class="f-img4 f-img-style"></div>
					<div class="f-img5 f-img-style"></div>
					<div class="f-img6 f-img-style"></div>
				</div>
			</div>
		</div>


		<div class="movie">
			<div class="cast">
				<div class="movie-title">電影</div>
				<div class="movie-inner" style="text-align: left; font-size: 20px;">
					<p>二輪戲院流行的時期，錄影帶剛成為一種價格實惠的家庭影音放映技術，很多預算有限的觀眾寧可等影片在二輪影院上映，而非花更多的錢去首輪電影院。</p>
					<p>但隨著21世紀的到來，有兩個因素促使許多二輪戲院停業：</p>
					<ol>
						<li>電影院影廳供過於求，導致電影在首映電影院的停留時間更長</li>
						<li>戲院上映和VHS或DVD發行的時間間隔持續縮小</li>
					</ol>
					<p>後一個因素讓許多觀影人認為不值得花錢和精神在可能遇到的吵鬧顧客及骯髒環境上，使二輪戲院成為夕陽產業。</p>
					<br>
					<div style="color: #d2b48c;">
						<p>上班太忙錯過了首輪強檔好片嗎？</p>
						<p>首輪秒下口碑卻爆棚的好片來不及看嗎？</p>
						<p>荷包緊緊但想要大螢幕環繞音響的享受嗎？</p>
						<p>二輪電影的文化不該被沒落，錯過的電影不知道去哪看嗎？</p>
						<p>我們來幫你訂票，讓你不在錯過你想看的電影！！</p>
					</div>
				</div>
			</div>
			<div class="area">
				<div class="movie-pad">
					<c:forEach var='movie' end="5" items='${movies }'>
						<a href="<spring:url value='/movieDetail?id=${movie.movieId}' />"><div
								class="background${movie.movieId } pictures"
								id="test${movie.movieId }"
								style="background-image:url('<c:url value='/getPicture/movieBean/${movie.movieId }' />');"></div></a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp" /> 

</body>


<script>

	$(window).scroll(function() {
		var scrollVal = $(this).scrollTop();
		$("span.qScrollTop").text(scrollVal);
	 	console.log(scrollVal);     
		if (1231 > scrollVal && scrollVal > 422) {
			$(".goToMid-l").css("color", "black");
			$(".menu-click").css("color", "black");
			$('.dot').removeClass("dot-pink");
			$('#activity-area').addClass("dot-pink");

		} else if(1000 > scrollVal && scrollVal > 100){
			$(".mainContent-coverImg").css("margin-top",test())
			function test(){
				var y =($(this).scrollTop()/50 + "%");                      
				return y;        
			}      
		} 
		
		else if (1950 > scrollVal && scrollVal > 1232)  {
			$(".goToMid-l").css("color", "white");
			$(".menu-click").css("color", "white");

		}else if(3314 > scrollVal && scrollVal > 2683) {	
			$(".goToMid-l").css("color", "black");
		} else if (3314 > scrollVal && scrollVal > 1951) {
			$(".goToMid-l").css("color", "white");
			$(".menu-click").css("color", "black"); 
			$('.dot').removeClass("dot-pink");
			$('#funds-area').addClass("dot-pink");

		} else if (9999 > scrollVal && scrollVal > 3315) {
			$(".goToMid-l").css("color", "white");
			$(".menu-click").css("color", "white");

			$('.dot').removeClass("dot-pink");
			$('#movie-area').addClass("dot-pink");

		} else {
			$(".goToMid-l").css("color", "black");
			$(".right-bar").css("color", "black");

			$('.dot').removeClass("dot-pink");
			$('#home-area').addClass("dot-pink");
		}

	});

	//點dot移動畫面

	$("#home-area").click(function() {
		$('html,body').animate({
			scrollTop : 0
		}, 'fast');
	});
	$("#activity-area").click(function() {
		$('html,body').animate({
			scrollTop : 872
		}, 'fast');
	});
	$("#funds-area").click(function() {
		$('html,body').animate({
			scrollTop : 1620
		}, 'fast');
	});
	$("#movie-area").click(function() {
		$('html,body').animate({
			scrollTop : 3773
		}, 'fast');
	});

	$(".pictures").mouseover(function() {
		$(".pictures").addClass("dark");

		$('#test1').mouseover(function() {
			$('.pictures').removeClass("light");
			$(this).addClass("light");
		});
		$('#test2').mouseover(function() {
			$('.pictures').removeClass("light");
			$(this).addClass("light");
		});
		$('#test3').mouseover(function() {
			$('.pictures').removeClass("light");
			$(this).addClass("light");
		});
		$('#test4').mouseover(function() {
			$('.pictures').removeClass("light");
			$(this).addClass("light");
		});
		$('#test5').mouseover(function() {
			$('.pictures').removeClass("light");
			$(this).addClass("light");
		});
		$('#test6').mouseover(function() {
			$('.pictures').removeClass("light");
			$(this).addClass("light");
		});
	});

	// 移出照片區時(mouseout) 去掉所有移入時加入的dark
	$(".pictures").mouseout(function() {
		$(".pictures").removeClass("dark");
	});
</script>
</body>
</html>