<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<script type='text/javascript' src='${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js'></script>
<title>所有會員資料</title>
<style>

body { 
  background-color: #ebebeb;
  font-family: verdana;
  font-size: 15pt;
}

input[type="text"] {
    font-size:18px
}
input[type="submit"] {
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
</style>
</head>
<body>
<div align='center'>
<h3>會員資料</h3>
<hr>
<!-- <form method='POST'> -->
<!-- 	<input type='hidden' name='_method' value='DELETE'> -->
<!-- </form> -->

<c:choose>
	<c:when test="${empty members}">
	    沒有任何會員資料<br> 
	</c:when>
	<c:otherwise>
		<table border='1' cellpadding="3" cellspacing="1" >
			<tr>
			   <th width='56'>編號</th>
			   <th width='180'>信箱</th>
			   <th width='140'>姓名</th>
<!-- 			   <th width='130'>密碼</th> -->
<!-- 			   <th width='64'>生日</th> -->
<!-- 			   <th width='56'>性別</th>		    -->
<!-- 			   <th>照片</th> -->
			</tr>
			<c:forEach var='member' items='${members}'>			
				<tr>
					<td style="text-align:center"><a
                        href="${pageContext.request.contextPath}/_01_register/modify/${member.memberId}">${member.memberId}</a></td>
					<td>${member.email}</td>
					<td>${member.memberName}</td>
<%-- 					<td><img width='60' height='72' src='crm/picture/${member.memberId}' /></td> --%>
				</tr>
			</c:forEach>
		</table>
<br> <button><a href="<c:url value='/backstage' />">回前頁</a></button>
	</c:otherwise>
</c:choose>
<hr>

</div>
<script type='text/javascript'>
    $(document).ready(function() {
        $('.deletelink').click(function() {
        	if (confirm('確定刪除此筆紀錄? ')) {
        		var href = $(this).attr('href');
                $('form').attr('action', href).submit();
        	} 
        	return false;
            
        });
    })
</script>

</body>
</html>