<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https:///code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel=stylesheet type="text/css"
	href="${pageContext.request.contextPath}/css/fund.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/UtilTool.js" ></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/movie2.css" />
</head>

<body>
<jsp:include page="../fragment/top.jsp" />
	<div class="wrapper">
		<section>
			<!-- 企劃上半部 -->
			<section class="projectContentUpper">
				<div class="container stickyNavTrigger">
					<div class="projectTitle">

						<div class="projectShare">
							<a href=""></a> <span class="metaText">提醒我</span>
						</div>
						<h1 class="text-center ptitle">${cfBean.projBean.projectName}</h1>
					</div>
					<div class="upperContent">
						<div class="col-left">
							<div class="videoBlock">
								<iframe width="100%" height="100%"
									src="https://www.youtube.com/embed/${cfBean.projBean.videoLink}"
									frameborder="0"
									allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"></iframe>
							</div>
							<div class="projectTitle_mobile"></div>
							<div id="projectShowWrapper">
								<div class="progressBar">
                                     <div class="wholePercent"></div>
                                     <div class="realPercent" style="width:${cfBean.percent/2}%"></div>
                                </div>   
                                <div class="progressPoint"></div> 
                                <div class="progressSection">
                                     <span class="progressMoney">$0</span><br>
                                     <pre class="space">  
                                     </pre>
                                     <span class="progressTitle">募資開始</span>
                                </div>
                                <div class="porgressSuccess">
                                     <span class="progressMoney">$${cfBean.fundsGoal}</span><br>
                                     <pre class="space"> 
                                     </pre>
                                     <span class="progressTitle">募資成功</span>
                                     <span class="percentNow">${cfBean.percent}%</span>
                                </div>
								
							</div>
						</div>
						<div class="col-right">
							<div class="numberRow totalFund">
								<h1 class="number moneyFormat">${cfBean.fundsNow}</h1>
								<p class="metaText">目標 $${cfBean.fundsGoal}</p>
							</div>
							<div class="numberRow totalPeople">
								<h1>${cfBean.backerNum}</h1>
								<p class="metaText">人</p>
							</div>
							<div class="numberRow totalDays">
								<h1 id="dayCount" data-endDay="${cfBean.dateEnd}"></h1>
								<p class="metaText">天結束</p>
							</div>
							<blockquote>
								專案正在募資中!!<br> 在${cfBean.dateEnd}
								23:59募資結束前，至少募得$${cfBean.fundsGoal}便募資成功。
							</blockquote>
							<a href="連結到贊助專案網址" class="btn fRed btn-block">贊助專案</a>
							<div class="splitButtonContainer">
								<a href="聯絡提案人" class="btn btn-red-ghost btn-block">聯絡提案人</a> <a
									href="分享連結" class="splitShares share">分享</a>
							</div>
						</div>
					</div>
				</div>
				<nav class="projectNav"></nav>
			</section>

			<!-- 企劃下半部 -->
			<section class="projectContentDown">
				<div class="container">
					<div class="row">
						<div class="col-left" id="user_content">
							<div id="tabs">
                                <ul>
                                  <li><a href="#tabs-1">專案緣起</a></li>
                                  <li><a href="#tabs-2">專案討論區</a></li>
                                  <li><a href="#tabs-3">贊助者們</a></li>
                                </ul>
                               
							<div class="story" id="tabs-1">
								<h1 class="projectContentHeading">${infoBean.projectTittle}</h1>
									<div id="viewArea">${infoBean.innerText}</div>
							</div>
							 <div id="tabs-2">
                                    <div class="middleFrame">
                                        <c:if test="${pcBeans!=null }">
                                        	<c:forEach items="${pcBeans}" var="pcBean">
                                        <div class="memberBox"  title="${pcBean.mbBean.memberName}" style="background-image:url('${pageContext.request.contextPath}/img/supermark/ok.png')"  ></div>
											</c:forEach>
										</c:if>				
                                    </div>
                            </div>
                            <div id="tabs-3">
                                <p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
                                <p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
                            </div>
                            </div>
						</div>
						<div class="col-right rewardBar" id="rewards">
							<c:if test="${dpBeans!=null}">
								<c:forEach items="${dpBeans}" var="dpBean">
									<div class="plan" id="donatePlan${dpBean.planId}" >
										<div>
											<h2 class="donateMoney">$${dpBean.donateMoney}</h2>
										</div>
										<div class="projectThumb">
											<img
												src="${pageContext.request.contextPath}/getDonatePlan/photo/${dpBean.planId}">
										</div>
										<div class="planText">
											<div class="description">
											<c:out value="${dpBean.donateDescription}" default="單純贊助，不需回饋，小額贊助給予劇組鼓勵和支持。"></c:out>
											</div>
											<span class="shipping"  data-shipping="${dpBean.shipping}" >沒有運送服務</span> <span
												class="deliverDate">預計寄送時間 ${dpBean.dliverDate}</span> <span
												class="limit">限量 <strong>${dpBean.limitNum}</strong>份
											</span>
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</section>
		</section>
	</div>
</body>

<script>
$(function(){
	
	$( "#tabs" ).tabs();
	var count = ${infoBean.photoCount};
	for(var i = 0 ; i<count;i++){
		var url =  "${pageContext.request.contextPath}/infoPhoto/"+${infoBean.projBean.projectId}+"/"+i;          
	$("#image"+i).attr("src", url);
	}
	
})

//日期倒數
var gg = $("#dayCount").attr("data-endDay");

$("#dayCount").text(DaysCountdown(gg));
//點擊回饋標籤跳轉
$(".plan").click(function(){
	var id = $(this).attr("id");
	var url = "${pageContext.request.contextPath}/"+id;
	$(location).attr('href',url);
})
//顯示運送方式的中文
$(".shipping").text(function(){
	var location = null;
	var value = $(this).attr("data-shipping")
	switch (value) {
	case 'InTaiwan':
		location = "台灣本島";
		break;
	case 'OutOfTaiwan':
		location = "外島地區";
		break;
	case 'Foreign':
		location = "其他國家";
		break;
	default: location = "沒有運送服務";
	}
	return location;
})
	

</script>

</html>