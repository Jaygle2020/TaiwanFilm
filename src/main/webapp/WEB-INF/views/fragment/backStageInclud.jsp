<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

	<div class="backStage-top">      
		<a href="/TaiwanFilm">
			<div class="TaiwanFilms">TaiwanFilms</div>
		</a>
		<a href="backstage" style="float:right"> 
			<div class="TaiwanFilms">回到後台首頁</div>
		</a>  
	</div>         
	<div class="backStage-bar">
		<div class="backStage-title">
			<div class="back-member backstage-title">會員管理</div>
			<div class="choose-list-member choose-list">  
				<a href="${pageContext.request.contextPath}/ShowAllMembers">
					<div class="m-bar1">查詢全部會員</div>
				</a>  
				<a href="">
					<div class="m-bar2">模糊查詢</div>
				</a>
<!-- 				<a href=""> -->
<!-- 					<div class="m-bar3">新增活動</div> -->
<!-- 				</a>       -->
				
			</div> 
		</div>
		<div class="backStage-title">
			<div class="back-activity backstage-title">活動</div>
			<div class="choose-list-activity choose-list">  
				<a href="${pageContext.request.contextPath}/allActivityM"> 
					<div class="a-bar1">查詢全部活動</div>
				</a>  
				<a href="${pageContext.request.contextPath}/activitiesM">
					<div class="a-bar2">查詢分類活動</div>
				</a>
				<a href="${pageContext.request.contextPath}/addActivities">
					<div class="a-bar3">新增活動</div>
				</a>      
				
			</div> 
		</div>
		<div class="backStage-title">
			<div class="back-funds backstage-title">募款</div>
			<div class="choose-list-funds choose-list">
				<a href="${pageContext.request.contextPath}/manage/getAllProject"><div class="f-bar1">目前的募款清單</div></a>
<!-- 				<a href=""><div class="f-bar2">f2</div></a> -->
<!-- 				<a href=""><div class="f-bar3">f3</div></a> -->
			</div>
		</div>
		<div class="backStage-title">
			<div class="back-movie backstage-title">電影</div>
			<div class="choose-list-movie choose-list">
				<a href=""><div class="m-bar1">m1</div></a>
				<a href=""><div class="m-bar2">m2</div></a>
				<a href=""><div class="m-bar3">m3</div></a>
			</div>
		</div>
		<div class="backStage-title">
			<div class="back-shopping backstage-title">購物</div>
			<div class="choose-list-shopping choose-list">
				<a href=""><div class="s-bar1">s1</div></a>
				<a href=""><div class="s-bar2">s2</div></a>
				<a href=""><div class="s-bar3">s3</div></a>
			</div>
		</div>   
		<div class="backStage-title">
			<div class="back-message backstage-title">留言板</div>
			<div class="choose-list-message choose-list">
				<a href=""><div class="i-bar1">i1</div></a>
				<a href=""><div class="i-bar2">i2</div></a>
				<a href=""><div class="i-bar3">i3</div></a>
			</div>
		</div>
	</div> 
	<div style="width: 80%;display: inline-block">
		<%-- <jsp:include page="activity/allactivityM.jsp" /> --%>
	</div>
<!-- 	 style="width: 80%;display: inline-block;vertical-align:top;background:gray;height: 700px" -->
<!-- </body> -->            
 
	<script>

		$(".back-member").click(function(){
		$(".choose-list-member").slideToggle();
		})
		$(".back-funds").click(function(){
			$(".choose-list-funds").slideToggle();
		})
		$(".back-movie").click(function(){
			$(".choose-list-movie").slideToggle();
		})
		$(".back-shopping").click(function(){
			$(".choose-list-shopping").slideToggle();
		})
		$(".back-message").click(function(){
			$(".choose-list-message").slideToggle();
		})
		$(".back-activity").click(function(){
			$(".choose-list-activity").slideToggle();
			
		}) 
</script>