<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel=stylesheet type="text/css" href="${pageContext.request.contextPath}/css/fund.css">


</head>

<body>
    <div class="wrapper">
        <section>
            <!-- 企劃上半部 -->
            <section class="projectContentUpper">
                <div class="container stickyNavTrigger">
                    <div class="projectTitle">

                        <div class="projectShare">
                            <a href=""></a>
                            <span class="metaText">提醒我</span>
                        </div>
                        <h1 class="text-center ptitle">這裡是專案的TITLE</h1>
                    </div>
                    <div class="upperContent">
                        <div class="col-left">
                            <div class="videoBlock"><iframe width="100%" height="100%" src="https://www.youtube.com/embed/BAmB9hQw2ho" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" ></iframe></div>
                            <div class="projectTitle_mobile">
                            </div>
                            <div id="projectShowWrapper">
                                <div class="progressBarWrapper">
                                    <div class="fundProgressBar twoGoal">
                                        <div class="progressBar"></div>
                                        <div class="progressPoints">
                                            <div class="progressSection porgressSuccess">
                                                <div class="progressPoint"></div>
                                                <span class="progressMoney">$0</span>
                                                <span class="progressTitle">募資開始</span>
                                                <div class="progressSummary">
                                                    <p></p>
                                                </div>
                                            </div>
                                            <div class="progressSection">
                                                <div class="progressPoint"></div>
                                                <span class="progressMoney">${FundsGoal}</span>
                                                <span class="progressTitle">募資成功</span>
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
                                <h1 class="number moneyFormat">1235</h1>
                                <p class="metaText">目標 $${targetPrice}</p>
                            </div>
                            <div class="numberRow totalPeople">
                                <h1>51</h1>
                                <p class="metaText">人</p>
                            </div>
                            <div class="numberRow totalDays">
                                <h1>60</h1>
                                <p class="metaText">天結束</p>
                            </div>
                            <blockquote>
                                專案正在募資中!!<br>
                                在${dateEnd} 23:59募資結束前，至少募得$${targetPrice}便募資成功。
                            </blockquote>
                            <a href="連結到贊助專案網址" class="btn fRed btn-block">贊助專案</a>
                            <div class="splitButtonContainer">
                                <a href="聯絡提案人" class="btn btn-red-ghost btn-block">聯絡提案人</a>
                                <a href="分享連結" class="splitShares share">分享</a>
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
                        <div class="col-right rewardBar" id="rewards"></div>
                    </div>
                </div>
            </section>
        </section>
    </div>
</body>

</html>