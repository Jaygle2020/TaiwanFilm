<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel=stylesheet type="text/css" href="${pageContext.request.contextPath}/css/purchase1.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/movie2.css" />
	
</head>

<body>
<jsp:include page="../fragment/top.jsp" />
    <div class="purchaseWrapper">
        <div class="purchaseContainer">
            <h1>${dpBean.projBean.projectName}</h1>
            <p>日期<span class="LocaleDate"></span></p>
            <section class="DataSection">
                <div class="buyerData">
                    <form:form method="post" modelAttribute="PurchaseBean"  action="${pageContext.request.contextPath}/newPurchase" >
                        <span class="bluequote">寄送區域</span><br>
                        <form:select path="buyerLocation" id="buyerLocation">
                            <form:option value="InTaiwan">台灣本島</form:option>
                            <form:option value="OutOfTaiwan">外島地區</form:option>
                            <form:option value="Foreign">國外區域</form:option>
                        </form:select><br> 
                        <span class="bluequote">寄送資訊</span><span>以下為贊助人聯絡資訊，請確實填寫</span>
                        <div class="form-group">
                            <div class="input-group topic">收件人姓名</div>
                            <div class="input-group textIn" ><form:input  path="buyerName" /></div><br>
                            <div class="input-group topic">郵遞區號</div>
                            <div class="input-group textIn"><form:input  path="postNumber" /></div><br>
                            <div class="input-group topic">收件地址</div>
                            <div class="input-group textIn"><form:input  path="adress" /></div><br>
                            <div class="input-group topic">連絡電話</div>
                            <div class="input-group textIn"><form:input path="phone" /></div><br>
                            <div class="input-group topic">聯絡信箱</div>
                            <div class="input-group textIn"><form:input path="email" /></div><br>
                            <div class="input-group topic">備註</div>
                            <div class="input-group textIn"><form:input path="note"  /></div><br>
                        </div>
                        <p class="bluequote">付款方式</p>
                        <div><img src="${pageContext.request.contextPath}/img/supermark/familymart.png">
							<img src="${pageContext.request.contextPath}/img/supermark/ipon.png">
							<img src="${pageContext.request.contextPath}/img/supermark/life.png">
							<img src="${pageContext.request.contextPath}/img/supermark/ok.png">
						</div>
                        <p class="bluequote">贊助金額</p>
                        <div class="whiteWell confirmData">
                            <div class="rewardData">
                                <div class="col-left-02">
                                    <small>贊助金額</small>
                                  <p><span id="donateMoney">${dpBean.donateMoney}</span>元</p>
                                </div>
                                <div class="col-middle-01">
                                    <small>運費</small>
                                  <p><span class="fare">0</span>元</p>
                                </div>
                                <div class="col-right-02">
                                    <small>總金額</small>
                                    <p ><span class="payAmount">${dpBean.donateMoney}</span>元</p>
                          
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="payAmount" id="payAmount" value="">
                        <input type="hidden" name="localeDate" id="localeDate" value="">
                        <form:checkbox path="incognito" />匿名贊助
                        <input type="hidden" name="planId" value="${dpBean.planId}">
                        <input type="submit" value="進行付款">
                    </form:form>    
                </div>
                <div class="choosenData">
                    <div class="rewardItem onlive" id="reward-${dpBean.planId}-card">
                        <img src="${pageContext.request.contextPath}/getDonatePlan/photo/${dpBean.planId}" class="img-responsive">
                        <div class="cardrow rewardDes">
                            <P><c:out value="${dpBean.donateDescription}" default="✓單純贊助，不需回饋，小額贊助給予劇組鼓勵和支持。" /></P>
                        </div>
                        <div class="cardrow rewardMeta">
                            <div class="row">
                                <div class="col-left-01">
                                    <p class="shipping-label">寄送地點</p>
                                    <p class="shipping-label">${dpBean.shipping}</p>
                                </div>
                                <div class="col-right-01">
                                     <P class="remain">剩餘數量${dpBean.limitNum}份</P>
                                    <p class="shipping-detail">寄送時間</p>
                                    <p class="shipping-detail">${dpBean.dliverDate}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    
    <script>
    
    $(function(){
    	var date = new Date().toLocaleDateString();
    	alert(date);
    	$(".LocaleDate").text(date);
    	$("#localeDate").val(date);
    	$("#payAmount").val($(".payAmount").text());
    });
    
    $("#buyerLocation").change(function(){
    	alert("on change")
    	var position = $("#buyerLocation").val();
    	switch (position) {
		case "InTaiwan":
			$(".fare").text("60");
			var price = Number($("#donateMoney").text()) + Number($(".fare").text());	
			alert(price);
			$(".payAmount").text(price);
			break;
		case "OutOfTaiwan":
			$(".fare").text("100");
			var price = Number($("#donateMoney").text()) + Number($(".fare").text());
			alert(price);
			$(".payAmount").text(price);
			break;
		case "Foreign":
			$(".fare").text("200");
			var price = Number($("#donateMoney").text()) + Number($(".fare").text());
			alert(price);
			$(".payAmount").text(price);	
			break;
    	}
    	$("#payAmount").val($(".payAmount").text());
    })
    </script>
</body>

</html>