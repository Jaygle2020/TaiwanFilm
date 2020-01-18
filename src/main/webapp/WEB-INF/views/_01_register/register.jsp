<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>

<head>
	<html lang="zh-TW">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" >
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/movie.css" />
	<title>movie</title>
</head>
<body>

	<div class="registrTotalDiv">
		<div class="registrMainDiv">
			
			<div class="sign" id="sign-in">
				<h1>登入</h1>
				<form name="login" method='post' action='/login'>
				<input name="account" class="nobooder" type='text' placeholder='請輸入帳號'  required /><br>
				<input name="password" class="nobooder" type='text' placeholder='請輸入密碼' required /><br>
				<label for="remember" class="grey dark">
				
				<br><input type="checkbox" />記得我
				</label>
			
			<p style="font-size: 10px">忘記密碼?</p>
			
			<input type='reset' value='清除' />
			<input type='submit' value='確認加入' onclick='return check()' />
			</form>
			</div>
			
			<div class="sign" id="sign-up">
			<h1 >新使用者</h1>
			<p class="smalltext" >若您還未註冊會員</p>
			<p class="smalltext">我們將會請您提供必需資訊</p>
			<button type=""><a href="members/add">登入/註冊</a></button>
			
<!-- 			<input type ="button" onclick="location.href='http://localhost:8080/TaiwanFilm/_01_register/registerNewMember'"  -->
<!-- 			value="登入/註冊" /> -->
			
			</div>
		</div>
	</div>
</body>
</html>