<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/movie.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/movie.css" />
	<style>
	.memberDetailTotalDiv2{
	width:100%;
	background-color: #ebebeb;
	text-align:center;
}
	.memberDetailMainDiv{
	margin-top: 30px;
	width:25%;
	display: inline-block;
	background-color: white;

}
	.memberDetailMainDiv tr{
		text-align: left;
	}
	</style>
</head>
<body style="background: #ebebeb">
	<div class="memberDetailTotalDiv2">
		<div class="memberDetailMainDiv">
			<h3>
				<font style="font-size: 30px;">會員資料</font>
			</h3>
	<form method="POST" id="UpdateMember" 
			action="${pageContext.request.contextPath}/_01_register/DoUpdateMember"
			enctype='multipart/form-data'> 

			<table>
			<tr><td>顯示名稱
			<tr><td>
			<input  name="memberName" id="memberName" type="text" value='${sessionScope.members.memberName}' />	
			<tr><td>聯絡信箱
			<tr><td>
			<input  name="email" id="email" type="email" value='${sessionScope.members.email}'/>
			<tr><td>性別
			<tr><td>
			<input type="radio"  id="gender" name="gender" value="男生" />男生 
 			<input type="radio"  id="gender" name="gender" value="女生" />女生
			<tr><td>生日
			<tr><td>
			<input type="date" name="birthDay" id="birthDay" />
			<tr><td>個人照片
			<tr><td>
			<input type='file' name="memImage"
			id="memberImage"  class='form:input-large' /> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<tr><td>
			<input type="submit" id="bt1" value="確認" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" id="bt2" value="清空"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button><a href="/TaiwanFilm">回首頁</a></button>			
			</table>
			</form>	
<!-- 			<input type="button" value="一鍵輸入" id="oneButtonInport" onclick="oneButtonInport()">			 -->
		</div>
	</div>
	<script>
	$(document).ready(function(){
		$("#oneButtonInport").onclick(){
			$("#memberName").text("管理員01");
			$("#memberName").val("管理員01");
			$("#email").val("eeit@gmail.com");
			$("#gender").val("男生");
			$("#birthDay").val("1989-01-26");
			
		}
		
	})
	
	
	</script>
</body>
</html>
<%-- 			<form:form method="POST" modelAttribute="MembersBean"  --%>
<%-- 			action="${pageContext.request.contextPath}/_01_register/DoUpdateMember" --%>
<%-- 			enctype='multipart/form-data'>  --%>	
<%-- 			<form:input  path="memberName" id="memberName"  --%>
<%-- 						value='${sessionScope.members.memberName}' />					  --%>
<%-- 			<form:input  path="email" id="email" value='${sessionScope.members.email}'/> --%>
<%-- 			<form:radiobutton  path="gender" name="gender" value="男生" />男生  --%>
<%--  			<form:radiobutton  path="gender" name="gender" value="女生" />女生 --%>
<%-- 			<form:input type="date" path="birthDay" id="birthDay" /> --%>
<%-- 			<form:input type='file' path="memImage" --%>
<%-- 			id="memberImage"  class='form:input-large' />  --%>
<%-- 			</form:form> --%>