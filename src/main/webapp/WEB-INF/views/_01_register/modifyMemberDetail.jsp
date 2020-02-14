<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>    
    
<!DOCTYPE html>
<html>
<head>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<style>

body { 
  background-color: #ebebeb;
  font-family: verdana;
  font-size: 15pt;
}

input{
    font-size:18px
}
input[type="submit"] [type="reset"]{
    font-size:18px
}
button{
font-size:18px
}
select {
    font-size:18px
}

.title_font {
	color: #0000FF;
	font-size:17px;	
	background-color: #FFCF90;
}

.table_color {
	color: #660000;
	background-color: #EEE8AA;
}

.customer_color {
	color: #800080;
	background-color: #99cc99;
}

input.rightAligned {
     text-align: right;
}

.InputClass { 
  font-size: 15px; 
} 

#message {
  position:absolute;
  left:620px;
  top:30px;
  color: #FF0660;
  background-color: #EEE8AA;
}


#insert {
position:relative;
left:280px;
top:70px;
}
#deleteMsg {
position:relative;
left:280px;
top:10px;
}

#backToBookMaintainList {
position:relative;
left:280px;
top:70px;
}

#afterBookInsert {
position:relative;
left:0px;
top:100px;
}

#bpaging {
position:relative;
left:120px;
top:5px;
}  
#blfirst {
position:relative;
left:2px;
top:2px;
}

#blprev {
position:relative;
left:2px;
top:2px;
}
#blnext {
position:relative;
left:2px;
top:2px;
}
#bllast {
position:relative;
left:2px;
top:2px;
}

   span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}
.name{
 padding:100px 0px 0px 17%
}
</style>
<meta charset="UTF-8">
<title>更新會員資料</title>
</head>
<body>
<jsp:include page="../backstage.jsp" />
<div class="name">
<div align='center'>
<h3>更新會員資料</h3>
<hr>
		<form method='POST' id="modifyMember" action="${pageContext.request.contextPath}/_01_register/DomodifyMember"
			enctype='multipart/form-data'>
			<input type="hidden" name="noname"  id='putOrDelete'   value="" >
    		<table>
    			<c:if test='${members.memberId != null}'>
    			<tr><td width='60'>編號:<td width='360'> ${sessionScope.members.memberId}<td>
    			<tr><td width='60'>信箱:<td width='360'><input name="email" id="email" value="${sessionScope.members.email}"/> <td>
    			<tr><td width='60'>名稱:<td width='360'><input name="memberName" id="memberName" value="${sessionScope.members.memberName}"  /><td>
    			<tr><td width='60'>密碼:<td width='360'><input name="password" id="password" value="${sessionScope.members.password}"  /><td>
    			<tr><td width='60'>生日:<td width='360'><input type="date" name="birthDay" id="birthDay" value="${sessionScope.members.birthDay}" /><td>
   				<tr><td width='60'>性別:<td width='360'>
				<input type="radio"  id="gender" name="gender" value="男生" />男生 
 				<input type="radio"  id="gender" name="gender" value="女生" />女生    		   				
   				<td>
   				<tr><td width='60'>照片:<td width='360'><input type='file' name="memImage"
				id="memberImage"  class='form:input-large' /> 
				<tr><td width='60'><td width='360'>
				<img width='100' height='100' src='${pageContext.request.contextPath}/crm/picture/${sessionScope.members.memberId}' />
    			</c:if> 
    		<c:if test='${empty members.memberId }'>無此會員!</c:if>
			</table>
			<input type="submit" id="bt1" value="確認" style="text-alien:left" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

			<div>
			<hr>
			<button ><a href="/TaiwanFilm/ShowAllMembers" style="text-decoration: none; color: black;">回到管理會員</a></button>
<!-- 			<button ><a href="/TaiwanFilm/_01_register/MemberBackstage" style="text-decoration: none; color: black;">管理者頁面</a></button> -->
				
		</form>



</div>
</div>
</body>
</html>