<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel=stylesheet type="text/css" href="${pageContext.request.contextPath}/css/create.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>
    <!-- 網頁就緒時執行的JS -->
        $(function () {
            $(".datepicker").datepicker();
            donateOptionElm();
            
        });
    </script>
</head>

<body>
    <div id="createWrapper" class="wrapper createWrapper">
        <div class="createContainer">
            <section class="createMenu">
                <ul class="createMenuList">
                    <li class="option1 opts selected">專案大綱</li>
                    <li class="option2 opts">專案內容</li>
                    <li class="option3 opts">回饋設定</li>
                    <li class="option4 opts">提案資料</li>
                </ul>
            </section>

            <section class="formSection">
                <form:form method="POST" modelAttribute="CrowdFundingBean" action="/submitProject" enctype="multipart/form-data" id="projectForm">
                    <div class="active create-basic productlist form-group">
                        <div class="createFormIntro partialWidthBlock">
                            <p>在這個區塊您將填寫專案內容中最吸引人募資影片、封面圖片和專案說明。</p>
                        </div>
                        <div class="partialWidthBlock projectCardGroup">
                            <div class="projectDataGroup">
                                <p>專案標題</p>
                                <input type="text" name="projectName">
                                <P>一個好的標題應該要好記、好搜尋、吸引人想點進去看，並讓瀏覽者能在最短的時間內瞭解專案的核心理念。</P>
                                <P>內容摘要</P>
                                <textarea name="projDescript" form="projectForm" rows="8" cols="80"
                                    maxlength="200"></textarea>
                                <p>使用吸引人的短文說明你的目標以及理念，強調你的獨一無二，讓贊助人對你或你的專案好奇，願意更進一步了解專案。</p>
                            </div>
                            <div class="createProjectCard">
                            </div>
                            <p>上傳專案圖片</p>
                            <input type="file" name="photoStr" accept="image/jpeg,image/png,image/bmp">
                            <P>專案影片</P>
                            <input type="url" name="vedio" placeholder="請輸入youtube影片連結網址">
                            <p>募資目標金額</p>
                            <p><form:input type="number" max="99999999" min="0" path="fundsGoal" />元</p>
                            <P>募資開始與結束日期</P>
                            <p>開始日期: <form:input  class="datepicker" path="dateBegin" /></p>
                            <p>結束日期: <form:input  class="datepicker" path="dateEnd" /></p>
                        </div>
                    </div>

                    <div class="create-story productlist form-group">
                        <h1>專案計畫描述</h1>
                        <div class="projectDetail">
                            <p>阿拉花瓜</p>
                            <span>寫死的固定版面</span>
                            <p>圖片要怎麼放還不確定</p>
                            <h3>此處的所有HTML都要包成字串回傳資料庫</h3>

                        </div>
                    </div>
                    <div class="create-info productlist form-group"></div>
                
                	<div class="create-reward productlist form-group">
                    
                        <div class="rewardItem form-group">
                            <div class="createCard">
                                <p>回饋金額，最低100元</p>
                                <input type="number" name="donateMoney" min="100"><br>
                                <p>內容摘要</p>
                                <textarea name="donateDescription" form="rewardPlan" rows="12" cols="40"></textarea>
                            </div>
                            <div class="previewCard">
                                <p>回饋封面</p>
                                <div id="photoPre">
                                    <p>目前沒有圖片</p>
                                </div>
                                <p>請提供 JPEG、PNG 或 BMP 檔，圖片尺寸至少 1024 x 768 px； 並將檔案大小控制在 1MB 以內。</p>
                                <input type="file" id="donatePhoto" name="pictureStr"
                                    accept="image/jpeg,image/png,image/bmp">
                            </div>
                            <div class="rewardInfo">
                                <p>運送區域</p>
                                <select name="shipping">
                                    <option value="none">請選擇</option>
                                    <option value="InTaiwan">台灣本島</option>
                                    <option value="OutOfTaiwan">外島地區</option>
                                    <option value="Foreign">其他國家</option>
                                </select>
                                <p>預計寄送時間</p>
                                <select  id="deliverYear"></select><select  id="deliverMonth"></select>
                                <input type="hidden" name="dliverDate" value="">
                                <p>限量份數</p>
                                <input type="number" name="limit" min="1" max="999999">
                            </div>
                        </div>
                	</div>
                </form:form>	
            </section>

        </div>

    </div>

    <script>
        $('.option1').click(function () {
            $('.productlist').removeClass('active');
            $('.opts').removeClass('selected');
            $('.create-basic').addClass("active");
            $('.option1').addClass("selected");
        });

        $('.option2').click(function () {
            $('.productlist').removeClass("active");
            $('.opts').removeClass('selected');
            $('.create-story').addClass("active");
            $('.option2').addClass("actived");
        });

        $('.option3').click(function () {
            $('.productlist').removeClass("active");
            $('.opts').removeClass('selected');
            $('.create-reward').addClass("active");
            $('.option3').addClass("actived");
        });
        $('.option4').click(function () {
            $('.productlist').removeClass("active");
            $('.opts').removeClass('selected');
            $('.create-info').addClass("active");
            $('.option4').addClass("actived");
        });

   
        $("#donatePhoto").change(function () {
            $("#photoPre").html(""); // 清除預覽
            readURL(this);
        });

        function readURL(input) {
            if (input.files && input.files.length >= 0) {
                for (var i = 0; i < input.files.length; i++) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var img = $("<img width='300' height='200'>").attr('src', e.target.result);
                        $("#photoPre").append(img);
                    }
                    reader.readAsDataURL(input.files[i]);
                }
            } else {
                var noPictures = $("<p>目前沒有圖片</p>");
                $("#photoPre").append(noPictures);
            }
        }

        function donateOptionElm(){
            for(var i= 1 ; i<13 ; i++){
                var optionMonth = null;
                if(i<10) optionMonth = $("<option value='"+"0"+i+"'>"+"0"+i+"</option>");
                else optionMonth = $("<option value='"+i+"'>"+i+"</option>");
                $('#deliverMonth').append(optionMonth);
            }
            var date = new Date().getFullYear();
            for(var j = date; j<date+4;j++){
                var optionYear = $("<option value='"+j+"'>"+j+"</option>");
                $('#deliverYear').append(optionYear);
            }
        }
        $("#puchido").click(function(){
            var year = $("#deliverYear").val();
            var month = $("#deliverMonth").val();
            $("#dliverDate").val(year+"-"+month);
            console.log(  $("#dliverDate").val())
        });

    </script>
</body>

</html>
