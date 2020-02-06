<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/movie.css" />
<link rel="script"
	href="${pageContext.request.contextPath}/js/registerNewMember.js">

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
	width:25%;
	display: inline-block;
	background-color: white;
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
						<td><form:input  path="email" id="email" placeholder='電子信箱' required='required'/>
					</tr>						
					<tr><td><span style="color: red;">*</span>
						<td><form:password path="password" id="password" 
						placeholder='密碼' required='required' maxlength="16" 
						pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
						title="密碼請符合輸入格式!"/>
					</tr>
					<tr><td><span style="color: red;">*</span>
						<td><form:password  path="password1" id="password1"
							placeholder='確認密碼'  required='required' maxlength="16" 
						pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"/>
					</tr>
					<tr><td><span style="color: red;">*</span>
						<td><form:input  path="memberName" id="memberName" 
						placeholder='會員姓名' required='required'/>
					</tr>
<!-- 					<tr><td><td>性別</tr> -->
<!-- 					<tr><td><span style="color: red;">*</span> -->
<%-- 						<td><form:radiobutton  path="gender" name="gender"  value="男生" />男生   --%>
<%-- 							<form:radiobutton  path="gender" name="gender" value="女生" />女生 --%>
<!-- 					</tr> -->
<!-- 					<tr><td><td>生日</tr> -->
<!-- 					<tr><td> -->
<%-- 						<td><form:input type="date" path="birthDay" id="birthDay" /> --%>
<!-- 					</tr> -->
<!-- 					<tr><td><td>電話</tr> -->
<!-- 					<tr><td> -->
<%-- 						<td><form:input  path="phone" id="phone" pattern="\d{10}"  --%>
<%-- 						placeholder='請輸入電話'/> --%>
<!-- 					</tr> -->
					
<!-- 					<tr><td><td>照片</tr> -->
<!-- 					<tr><td> -->
<%-- 						<td><form:input type='file' path="memImage" --%>
<%--  								id="memberImage"  class='form:input-large' /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
<!-- 					</tr> -->
					<tr><td>
						<td>
							<input type="submit" id="bt1" value="確認" disabled/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" id="bt2" value="取消"/>
					</tr>
				</table>
			<div>
				<input type="button" value="Google登入">
			</div>

			<div>
				已經有帳號了?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
					onclick="location.href='http://localhost:8080/TaiwanFilm/register'"
					value="登入" />
<%-- <a href='${pageContext.request.contextPath}/views/_01_register/register.jsp'><input type="button" value="登入"></a> --%>
			</div>

			<input type="button"
				   onclick="location.href='http://localhost:8080/TaiwanFilm/'"
				   value="回首頁" />
<!-- 				  <button><a href="/TaiwanFilm/">回首頁</a></button> -->

		</div>
		</div>

		<script	src="${pageContext.request.contextPath }/js/registerNewMember.js">
			
		</script>
</form:form>
</body>
</html>