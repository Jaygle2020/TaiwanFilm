<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/movie2.css" />
<meta charset="UTF-8">
<title>新增會員</title>

<style type="text/css">
   span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}
.memberNewTotalDiv{
	width:100%;
	background-color: #ebebeb;
	text-align:center;
}
.memberNewMainDiv {
	margin-top: 30px;
	width:300px;
	display: inline-block;
	background-color: white;
       }
#focusToBlue:hover{
      color: blue
      }

</style>
</head>
<body style="background: #ebebeb">
	<form:form method='POST' modelAttribute="MembersBean" 
	action="${pageContext.request.contextPath}/_01_register/registerNewMember"
	 enctype='multipart/form-data' >
	 <div class="memberNewTotalDiv">
		<div class="memberNewMainDiv">
			<h3>
				<font style="font-size: 30px;">輸入會員資料</font>
			</h3>	

				<table>
					<tr><td><span style="color: red;">*</span>
						<td><form:input  path="email" id="email" placeholder='電子信箱' required='required' value=""/>	
						<td id="errorBox" style="font-size:8px;text-align:left"></td>					
					</tr>					
					<tr><td><span style="color: red;">*</span>
						<td><form:input  path="memberName" id="memberName" 
						placeholder='會員姓名' required='required' value=""/>
						<td id="nameErrorBox" style="font-size:8px;text-align:left"></td>
					</tr>						
					<tr><td><span style="color: red;">*</span>
						<td><form:password path="password" id="password" 
						placeholder='密碼' required='required' maxlength="16" 
						pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
						title="密碼請符合輸入格式!"/>
						<tr><td><td><small style="color: red; font-size:8px;">請輸入8-16碼英數字(包含英文大小寫)</small></tr>
					<tr><td><span style="color: red;">*</span>
						<td><form:password  path="password1" id="password1"
							placeholder='確認密碼'  required='required' maxlength="16" 
						pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"/>
						<td id="pwdErrorBox" style="color: red; font-size:8px;text-align:left" ></td>
<%-- 						<td> <form:input type='file' path="memImage"  --%>
<%-- 			id="memberImage"  class='form:input-large' src="../img/NoImage_Male.png"  />   --%>
<!-- 						<td><img  id="" src="../img/NoImage_Male.png" style="display:none" > -->
					</tr>
					<tr><td>
						<td>
							<input type="reset" id="bt2" value="取消"/>
							<input  type="submit" id="bt1" value="確認" disabled onclick="registerOK()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</tr>
				</table>
			<div style="text-align:left">
				已經有帳號了?&nbsp;&nbsp;<input type="button" id="backToLogin" class="backToLogin"
					onclick="location.href='http://localhost:8080/TaiwanFilm/register'"
					value="回到登入頁" />
<%-- <a href='${pageContext.request.contextPath}/views/_01_register/register.jsp'><input type="button" value="登入"></a> --%>
			</div>
	<br>
			<input type="button"
				   onclick="location.href='http://localhost:8080/TaiwanFilm/'"
				   value="回首頁" />
<!-- 				  <button><a href="/TaiwanFilm/">回首頁</a></button> -->
<br>
				<div style="color: red; font-size:8px; text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;*為必填欄位</div>
				<div  style="font-size:8px;"> 已閱讀並同意：
				<b id="focusToBlue" style="font-size:8px;" >使用者協定</b>和
				<b id="focusToBlue"> 隱私政策</b></div>
		</div>
		</div>
</form:form>
		<script	src="${pageContext.request.contextPath }/js/registerNewMember.js"></script>
		<script>
		
		function registerOK(){		
			alert("註冊成功")}
		//當密碼欄有更動時 確認密碼相同 全部有值 =>開啟確認按鈕
	$(function() {
			$("#password").change(function() {
				var pwd1 = $("#password").val();
				var pwd2 = $("#password1").val();
				var email = $('#email').val();
				var mname = $('#memberName').val();
				if (pwd2 == pwd1 ) {
					$('#pwdErrorBox').text("");
					if(mname !=""){
						if(email !=""){
					$("#bt1").prop("disabled", false);
						}
					}
				}else {
					$("#bt1").prop("disabled", true);
					$('#pwdErrorBox').text("確認密碼不符");

					}
				})
			//當確認密碼欄有更動時 確認密碼相同 全部有值 =>開啟確認按鈕
			$("#password1").change(function() {
				var pwd1 = $("#password").val();
				var pwd2 = $("#password1").val();
				var email = $('#email').val();
				var mname = $('#memberName').val();
				if (pwd2 == pwd1 ) {
					$('#pwdErrorBox').text("");
					if(mname !=""){
						if(email !=""){
					$("#bt1").prop("disabled", false);
						}
					}
				}else {
					$("#bt1").prop("disabled", true);
					$('#pwdErrorBox').text("確認密碼不符");
					}
			})
		})	
		$(document).ready(function(){
			$('#memberName').blur(function(){
				var pwd1 = $("#password").val();
				var pwd2 = $("#password1").val();
				var email = $('#email').val();
				var mname = $('#memberName').val();	
				if(mname != ""){
					$('#nameErrorBox').text("");
					if(email != "" && pwd1 == pwd2 && pwd1 != ""){
						$("#bt1").prop("disabled", false);
					}
				}else{
					$('#nameErrorBox').css("color","red").text("請輸入名稱");
					
				}
			})
			
		})
		//email 更動時 確認信箱能否使用
		$(document).ready(function(){
			$("#email").blur(function(){
				var pwd1 = $("#password").val();
				var pwd2 = $("#password1").val();
				var email = $('#email').val();
				var mname = $('#memberName').val();
				 $.ajax({
					url:"${pageContext.request.contextPath}/emailChecker?email="+email,
					type: "GET",
					error: function(data){
						console.log('error');
					},
					success: function(data){
						if(data){
							$('#errorBox').css("color","red").text("此帳號重複");
							$("#bt1").prop("disabled", true);
						}else if(email !="" ){
							$('#errorBox').css("color","green").text("帳號可使用");
							if(pwd1 == pwd2 && mname != ""){
								$('#pwdErrorBox').text("");
								$("#bt1").prop("disabled", false);
							}
								
						}else{
							$('#errorBox').css("color","red").text("請輸入帳號");
							$("#bt1").prop("disabled", true);
						}
						console.log('success');
					}
				 })
			})
		})
		
		</script>	
</body>
</html>