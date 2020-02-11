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
	<style>
	.sign {
    vertical-align: top;
    width: 300px;
    height: 230px;
    display: inline-block;
}
	
	</style>
</head>
<body style="background: #ebebeb">

	<div class="registrTotalDiv">
		<div >
			
			<div class="sign" id="sign-in">
				<h1>登入</h1>
				<form action='${pageContext.request.contextPath}/Checklogin' method='post'>
				<input name="email" class="nobooder" type='email' placeholder='電子信箱'  required /><br>
				<input name="password" class="nobooder" type='password' placeholder='密碼' required /><br>
			
			<input type='reset' value='清除' />
			<input type='submit' value='確認加入' onclick='return check()' />
			</form>
				<label for="remember" class="grey dark">			
				<br><input type="checkbox" />記得我</label>		
			<p style="font-size: 10px">忘記密碼?</p>
			</div>
			
			<div class="sign" id="sign-up">
			<h1 >新使用者</h1>
			<p class="smalltext" >若您還未註冊會員</p>
			<p class="smalltext">我們將會請您提供必需資訊</p>
			<button type=""><a href="members/add">登入/註冊</a></button>
					
			</div>
		</div>
	</div>
</body>
</html>