<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel=stylesheet type="text/css" href="${pageContext.request.contextPath}/css/purchase.css">

</head>

<body>
    <div class="purchaseWrapper">
        <div class="purchaseContainer">
            <h1>Project Title</h1>
            <p>assisten</p>
            <section class="DataSection">
                <div class="buyerData">
                    <form action="">
                        <span class="bluequote">寄送區域</span><br>
                        <select name="" id="">
                            <option value="">請選擇</option>
                            <option value="">台灣本島</option>
                            <option value="">外島地區</option>
                            <option value="">國外區域</option>
                        </select><br>
                        <span class="bluequote">寄送資訊</span><span>以下為贊助人聯絡資訊，請確實填寫</span>
                        <div class="form-group">
                            <div class="input-group topic">收件人姓名</div>
                            <div class="input-group textIn" ><input type="text" name=""></div><br>
                            <div class="input-group topic">郵遞區號</div>
                            <div class="input-group textIn"><input type="text" name=""></div><br>
                            <div class="input-group topic">收件地址</div>
                            <div class="input-group textIn"><input type="text" name=""></div><br>
                            <div class="input-group topic">連絡電話</div>
                            <div class="input-group textIn"><input type="text" name=""></div><br>
                            <div class="input-group topic">聯絡信箱</div>
                            <div class="input-group textIn"><input type="text" name=""></div><br>
                            <div class="input-group topic">備註</div>
                            <div class="input-group textIn"><input type="text" name=""></div><br>
                        </div>
                        <p class="bluequote">付款方式</p>
                        <div>信用卡</div>
                        <div>PAY PAL</div>
                        <p class="bluequote">贊助金額</p>
                        <div class="whiteWell confirmData">
                            <div class="rewardData">
                                <div class="col-left-02">
                                    <samll>贊助金額</samll>
                                    <p>$100</p>
                                </div>
                                <div class="col-middle-01">
                                    <samll>運費</samll>
                                    <p>$0</p>
                                </div>
                                <div class="col-right-02">
                                    <samll>總金額</samll>
                                    <p>$100</p>
                                </div>
                            </div>
                        </div>
                        <input type="checkbox" name="">匿名贊助
                        <input type="submit" value="進行付款">
                    </form>    
                </div>
                <div class="choosenData">
                    <div class="rewardItem onlive" id="reward-12345-card">
                        <img src="Image01.jpg" class="img-responsive">
                        <div class="cardrow rewardDes">
                            <P>✓單純贊助，不需回饋，小額贊助給予劇組鼓勵和支持。 ▶︎請於備註欄填寫您出示於片尾感謝名單的姓名</P>
                        </div>
                        <div class="cardrow rewardMeta">
                            <div class="row">
                                <div class="col-left-01">
                                    <p class="shipping-label">寄送地點</p>
                                    <p class="shipping-label">台灣本島</p>
                                </div>
                                <div class="col-right-01">
                                    <p class="shipping-detail">寄送時間</p>
                                    <p class="shipping-detail">2020/02/20</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</body>

</html>