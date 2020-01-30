<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel=stylesheet type="text/css"
	href="${pageContext.request.contextPath}/css/fund.css">


</head>

<body>
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
								<div class="progressBarWrapper">
									<div class="fundProgressBar twoGoal">
										<div class="progressBar"></div>
										<div class="progressPoints">
											<div class="progressSection porgressSuccess">
												<div class="progressPoint"></div>
												<span class="progressMoney">$0</span> <span
													class="progressTitle">募資開始</span>
												<div class="progressSummary">
													<p></p>
												</div>
											</div>
											<div class="progressSection">
												<div class="progressPoint"></div>
												<span class="progressMoney">${cfBean.fundsGoal}</span> <span
													class="progressTitle">募資成功</span>
												<div class="progressSummary">
													<P>募資目標達成!</P>
												</div>

											</div>
										</div>
									</div>

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
								<h1>60</h1>
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
							<div class="story">
								<h1 class="projectContentHeading">專案內容</h1>
							</div>
						</div>
						<div class="col-right rewardBar" id="rewards">
							<c:if test="${dpBeans!=null}">
								<c:forEach items="${dpBeans}" var="dpBean">
									<div class="plan">
										<div>
											<h2 class="donateMoney">$${dpBean.donateMoney}</h2>
										</div>
										<div class="projectThumb">
											<img
												src="${pageContext.request.contextPath}/getDonatePlan/photo/${dpBean.planId}">
										</div>
										<div class="planText">
											<span class="shipping">${dpBean.shipping}</span> <span
												class="deliverDate">預計寄送日期 ${dpBean.dliverDate}</span> <span
												class="limit">限量 <strong>${dpBean.limit}</strong>份
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

</html>