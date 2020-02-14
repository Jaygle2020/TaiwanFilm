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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/menuStyle.css" />
<style>
.memberDetailTotalDiv2 {
	width: 100%;
	height: 570px;
	background-color: white;
	text-align: center;
}

.loginOrOut {
	display: none;
}

.memberDetailMainDiv {
	margin-top: 30px;
	width: 680px;
	display: inline-block;
}

.memberDetailMainDiv tr {
	text-align: left;
}

body {
	background-color: white;
}
<<<<<<< Updated upstream
b {
	font-size: 46px;
	margin-bottom: 10px;
}

input:not (.allBt ){
	margin: 0px 10px;
	font-size: 20px;
	margin: 0px 10px 10px 10px;
}

.allBt {
	background-color: black;
	border: 0;
	color: white;
	font-size: 16px;
	padding: 10px 30px;
	border-radius: 5px;
	margin: 0px 10px 10px 10px;
}
.memimg{
	
 width:160;
 height:160;
 border-radius: 50%;
}
.DEMOONE{
	position:absolute;
	top:100px;
	right:100px;
}

.allBt{
    background-color: black;
    border: 0;
    color: white;
    font-size: 16px;
    padding: 10px 30px;
    border-radius: 5px;
    margin: 0px 10px 10px 10px;
}
b {
    font-size: 46px;
    margin-bottom: 30px;
}
/* #memberImage{ */
/*     background-color: black; */
/*     border: 0; */
/*     color: white; */
/*     font-size: 16px; */
/*     padding: 10px 30px; */
/*     border-radius: 5px; */
/* } */

</style>
</head>
<body>
	<jsp:include page="../fragment/menu.jsp" />
	<div class="memberDetailTotalDiv2">
		<div class="memberDetailMainDiv">
			<h3>
				<b>修改會員資料</b>
			</h3>
			<form method="POST" id="UpdateMember"
				action="${pageContext.request.contextPath}/_01_register/DoUpdateMember"
				enctype='multipart/form-data'>
				<table>

					<tr>
						<td>
						<td><input name="password" id="password" type="text"
							value='${sessionScope.members.password}' style="display: none" />
					<tr>
						<td class="AllText">顯示名稱
						<td class="AllText">性別
					<tr>
						<td><input name="memberName" id="memberName" type="text"
							value='${sessionScope.members.memberName}' />
						<td><input type="radio" id="gender" name="gender" value="男生" />男生
							<input type="radio" id="gender" name="gender" value="女生" />女生
					<tr>
						<td class="AllText">聯絡信箱
						<td class="AllText">生日
					<tr>
						<td><input name="email" id="email" type="email"
							value='${sessionScope.members.email}' />
						<td><input type="date" name="birthDay" id="birthDay" value="${sessionScope.members.birthDay}"/>
					<tr>
						<td class="AllText">個人照片
						<td class="AllText">預覽照片
					<tr>

						<td><input type='file' name="memImage" id="memberImage"
							class='form:input-large' />
							<BR>
							<BR>
							<BR>
							<BR>
							<input type="submit" class="allBt" id="bt1" value="確認" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" class="allBt" id="bt2" value="清空" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<td><img style="dsiplay: inline-block" id="oldMemberImage"
							src='${pageContext.request.contextPath}/crm/picture/${sessionScope.members.memberId}' />
							<img id="preview_memImage" src="#" style="display: none" />
					<tr>
						<td>
							
				</table>
			</form>
			

		</div>
	<div class="DEMOONE" style="text-align:left"><input type="button" value="DEMO用" onclick="oneButtonInport()" > </div>
	</div>
	
	<jsp:include page="../fragment/bottom.jsp" />

	<script>
	

		$(document).ready(function() {

			if(${sessionScope.members.gender =='男生'}){
				$("input[name='gender'][value=男生]").attr("checked",true); 
			}else if(${sessionScope.members.gender =='女生'}){
				$("input[name='gender'][value=女生]").attr("checked",true); 
			}
		});
	
		$("#memberImage").change(function() {
			//當檔案改變後，做一些事 
			readURL(this); // this代表<input id="memberImage">
			$("#preview_memImage").css("display", "inline-block");
			$("#oldMemberImage").css("display", "none");
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#preview_memImage").attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		function oneButtonInport() {
			var name = "王曉明";
			var em = "eeit11040@gmail.com";
			var gerd = 	"男生";
			var birt = "1988-01-26";
			$("#memberName").val(name);			
			$("#email").val(em);
			$("input[name='gender'][value=男生]").attr("checked",true); 
			$("#birthDay").val(birt);
		}
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