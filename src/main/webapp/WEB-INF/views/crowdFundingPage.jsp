<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>募資頁面首頁</h2>
<div>
<form:form method="post" modelAttribute="CrowdFundingBean" >
專案ID<form:input type="text" name="projectId" path="projectId" /><br>
專案日起始日期<form:input type="text" name="dateBegin" path="dateBegin" /><br>
專案結束日期<form:input type="text" name="dateEnd" path="dateEnd" /><br>
專案募資目前金額<form:input type="number" max="99999999" min="0" name="fundsNow" path="fundsNow" /><br>
專案達成金額<form:input type="number" max="99999999" min="0" name="fundsGoal" path="fundsGoal" /><br>
贊助人數<form:input type="number" max="99999999" min="0" name="backerNum" path="backerNum" />人<br>
<input type="submit" value="送出"><br>
</form:form>
</div>	
<%! String test; %>

<% test = (String)request.getAttribute("check"); 
if(test!= null){
out.print(test);	
}
%>

</body>
</html>