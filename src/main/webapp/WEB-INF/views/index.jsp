<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Mukta&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/finalIndex.css" type="text/css">
<!-- 	<link href="https://fonts.googleapis.com/css?family=Mukta&display=swap" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei&display=swap" rel="stylesheet"> -->
<!-- <link id="MonoTypeFontApiFontTracker" type="text/css" rel="stylesheet" href="https://fast.fonts.net/t/1.css?apiType=js&amp;projectid=b2d946f7-734c-4b45-a07f-3923a384b0dd"> -->

<body style="margin: 0">
	
	<jsp:include page="fragment/menu.jsp" />
	
	<div class="bottom-bar">
		<div class="bottom-bar-content">豐盛之城－臺灣三部曲 Formosa Wonderland -
			「勇士計畫」預計2021年啟動</div>
	</div>

	<div class="indexWidth">
		<div class="mainContent">
			<div class="mainContent-coverImg"></div>
			<div class="mainContentimg">
				<div class="mainContent-img-left"></div>
				<div class="mainContent-img-right"></div>
			</div>
		</div>

		<!-- ttttttttt -->

<!-- 		<div class="activityContent">
			<div class="activityTitle">Activity</div>
			<div class="activity-menu">
				<div>最新活動</div>
				<div>熱門活動</div>  
				<div>即將開始</div>
			</div>
			<div class="activityArea">
				<div class="activityAreaContent1 activityAreaContentStyle"></div>
				<div class="activityAreaContent2 activityAreaContentStyle"></div>
				<div class="activityAreaContent3 activityAreaContentStyle"></div>
			</div>
		</div> -->

		<jsp:include page="activity/activities.jsp" />

		<div class="funds-trailer">
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
				<div class="movie-inner">
					ドキュメンタリー部分で赤裸々に自身の経験や考えを語るのは、2017年に発売した写真集『きっとぜんぶ大丈夫になる』が女性を中心に支持されているヌードモデルの兎丸愛美（うさまる・まなみ）と、2018年の東京国際映画祭に正式出品された、MOOSIC
					LAB 2018長編部門作品『月極オトコトモダチ』（監督：穐山茉由）で主題歌を担当しているシンガーソングライターのBOMI（ボーミ）。

					兎丸も出演する劇映画部分で、フェミニズムに関するドキュメンタリーの監督・池田を演じるのは、『イエローキッド』（監督：真利子哲也）に主演し、河瀨直美プロデュースの日韓合作映画『ひと夏のファンタジア』（監督：チャン・ゴンジェ）で韓国でも注目される岩瀬亮。西原監督が2014年に監督した実写映画『Starting
					Over』に出演した遠藤新菜（『無伴奏』）、秋月三佳（『母さんがどんなに僕を嫌いでも』）、戸塚純貴（『銀魂2
					掟は破るためにこそある』）が再集結し、それぞれ、兎丸の友達の女子大生・美帆、池田の彼女、美帆の彼氏を演じる。また、秋月演じるモデル・女優の後輩役として、「新潟美少女図鑑」で注目を集め、テレビ東京の音楽番組「音流〜ONRYU〜」のMCも務める現役女子高生で女優の栗林藍希（あいの）も出演。</div>
			</div>
			<div class="area">
				<div class="movie-pad">
					<div class="background1 pictures" id="test1"></div>
					<div class="background2 pictures" id="test2"></div>
					<div class="background3 pictures" id="test3"></div>
					<div class="background4 pictures" id="test4"></div>
					<div class="background5 pictures" id="test5"></div>
					<div class="background6 pictures" id="test6"></div>
				</div>
			</div>
		</div>
	</div>


		</div>
		<jsp:include page="fragment/bottom.jsp" />


<script>
/* 	$(".menu-click").click(function() {
		$(".right-bar").hide(500);
		$(".menu-bar").css("display", "inline-block");
		$(".menu-bar").animate({
			right : "0%"
		});
		$(".fixed").show(500);
		$(".fixed").animate({
			width : "100%"
		});
		$('body').css('overflow', 'hidden');

	});

	$(".close-menu").click(function() {
		$(".right-bar").show();
		$(".menu-bar").animate({
			right : "-40%"
		});
		$(".indexWidth").animate({
			opacity : "1"
		});
		$(".fixed").hide(500);
		$(".fixed").animate({
			width : "0%"
		});
		$('body').css('overflow', 'visible');

	}), */

	$(window).scroll(function() {
		var scrollVal = $(this).scrollTop();
		$("span.qScrollTop").text(scrollVal);

		/*  console.log(scrollVal);  */ 
		if (1239 > scrollVal && scrollVal > 422) {
			$(".goToMid-l").css("color", "white");
			$(".right-bar").css("color", "white");
			$('.dot').removeClass("dot-pink");
			$('#activity-area').addClass("dot-pink");

		} else if (1981 > scrollVal && scrollVal > 1240) {
			$(".right-bar").css("color", "black");

		} else if (2499 > scrollVal && scrollVal > 1981) {
			$(".goToMid-l").css("color", "black");

			$('.dot').removeClass("dot-pink");
			$('#funds-area').addClass("dot-pink");

		} else if (9999 > scrollVal && scrollVal > 2530) {
			$(".goToMid-l").css("color", "white");
			$(".right-bar").css("color", "white");

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
			scrollTop : 860
		}, 'fast');
	});
	$("#funds-area").click(function() {
		$('html,body').animate({
			scrollTop : 1671
		}, 'fast');
	});
	$("#movie-area").click(function() {
		$('html,body').animate({
			scrollTop : 3027
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