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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/movie.css" />
<style>
.memberDetailTotalDiv2 {
	width: 100%;
	height:570px;
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
	input:not(.allBt){
	margin: 0px 10px;
	font-size: 20px;
    margin: 0px 10px 10px 10px;
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
.memimg{
	
 width:160;
 height:160;
 border-radius: 50%;
=======
>>>>>>> Stashed changes

b {
	font-size: 46px;
	margin-bottom: 10px;
}
	input:not(.allBt){
	margin: 0px 10px;
	font-size: 20px;
    margin: 0px 10px 10px 10px;
}
<<<<<<< Updated upstream

=======
.allBt{
    background-color: black;
    border: 0;
    color: white;
    font-size: 16px;
    padding: 10px 30px;
    border-radius: 5px;
    margin: 0px 10px 10px 10px;
}
/* #memberImage{ */
/*     background-color: black; */
/*     border: 0; */
/*     color: white; */
/*     font-size: 16px; */
/*     padding: 10px 30px; */
/*     border-radius: 5px; */
/* } */
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
				<table>
=======

				<table>
				<th><th><th><th>
>>>>>>> Stashed changes
					<tr>
						<td class="AllText">顯示名稱 <td class="AllText">性別
					<tr>
						<td><input name="memberName" id="memberName" type="text"
							value='${sessionScope.members.memberName}' />
<<<<<<< Updated upstream
							<td>
							<input type="radio"  name="gender" value="男生" />男生
							<input type="radio"  name="gender" value="女生" />女生
=======
							<td><input type="radio" id="gender" name="gender" value="男生" />男生
							<input type="radio" id="gender" name="gender" value="女生" />女生
>>>>>>> Stashed changes
					<tr>
						<td class="AllText">聯絡信箱<td class="AllText">生日
					<tr>
						<td><input name="email" id="email" type="email"
							value='${sessionScope.members.email}' />
						<td><input type="date" name="birthDay" id="birthDay" />
					<tr>
<<<<<<< Updated upstream
						<td class="AllText">個人照片<td class="AllText">照片預覽
					<tr>
						<td>
								<input type='file' name="memImage" id="memberImage" />
						<td>
						<img class="memimg" id="oldImg" style="display:block" src='${pageContext.request.contextPath}/crm/picture/${sessionScope.members.memberId}' />
						<img class="memimg" id="previewImg" style="display:none" src="#" />
						<!--accept="image/gif, image/jpeg, image/png" -->
					<tr>
						<td><input type="submit" class="allBt" id="bt1" value="確認" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" class="allBt" id="bt2" value="清空" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
=======
						<td class="AllText">個人照片
					<tr>
						<td><input type='file' name="memImage" id="memberImage"
							class='form:input-large' />

						
					<tr>
						<td><input type="submit" class="allBt" id="bt1" value="確認" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" class="allBt" id="bt2" value="清空" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 							<button> -->
<!-- 								<a href="/TaiwanFilm">回首頁</a> -->
<!-- 							</button> -->
>>>>>>> Stashed changes
				</table>
			</form>
			<!-- 			<input type="button" value="一鍵輸入" id="oneButtonInport" onclick="oneButtonInport()">			 -->
		</div>
	<input  id="oneEntry"type="button" onclick="oneEntry1()" value="DEMO用" />
	</div>
	<jsp:include page="../fragment/bottom.jsp" />
	<script>
<<<<<<< Updated upstream
	//預覽照片  
	 function readURL(input){
		  if(input.files && input.files[0]){//陣列第一個元素有東西 且INPUT是FILES時
		    var reader = new FileReader();
		    reader.onload = function (e) {//上傳
		       $("#previewImg").attr('src', e.target.result);
		       $("#previewImg").css("display","block");
		       $("#oldImg").css("display","none");
		    }
		    reader.readAsDataURL(input.files[0]);
		  }
	 }
	//預覽照片
	 $("#memberImage").change(function(){
	      //當檔案改變後，做一些事 
	     readURL(this);   // this代表<input id="imgInp">
	   });

		function oneEntry1() {
			 var email = "jeter@gmail.com";
			 var name = "DerekJeter";
			 var bir = "1974-06-26"; 
			$("input[name=gender][value='男生']").attr('checked',true); 
			 $("#email").val(email);
			 $("#birthDay").val(bir);
			 $("#memberName").val(name); 
			}
=======
		$(document).ready(function() {
			$("#oneButtonInport").onclick()
			{
				$("#memberName").text("管理員01");
				$("#memberName").val("管理員01");
				$("#email").val("eeit@gmail.com");
				$("#gender").val("男生");
				$("#birthDay").val("1989-01-26");

			}

		})
>>>>>>> Stashed changes
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