<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Manage.css" >
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menuStyle.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" >
</head>

<body>
<jsp:include page="../fragment/backStageInclud.jsp" />
    <div class="pageWrapper">
    <div class="functionWrapper">
        
        <h2>目前存在專案</h2>
       
        
    </div>
    <div class="formWrapper">
        <table>
            <thead>
                <th>募資名稱</th>
                <th>募資起始日</th>
                <th>募資截止日</th>
                <th>目前金額</th>
                <th>目標金額</th>
                <th>進度百分比</th><button type="button" onclick="addProject()">新增專案內容</button>
            </thead>
            <c:if test="${cfBeans!=null}">
            <c:forEach items="${cfBeans}" var="cfBean">
            <tr>
                <td>${cfBean.projBean.projectName}</td>
                <td>${cfBean.dateBegin}</td>
                <td>${cfBean.dateEnd}</td>
                <td>${cfBean.fundsNow}</td>
                <td>${cfBean.fundsGoal}</td>
                <td>${cfBean.percent}</td>
                <td><button id="${cfBean.projBean.projectId}">修改</button>
                </td>
            </tr>
            </c:forEach>
            </c:if>
        </table>
    </div>
</div>
    <script>
    function addProject(){
    	window.location.href = "${pageContext.request.contextPath}/createProjectFirst";
    }
    
    $("td:last-child").click(function () {
       var id  = $(this).find("button").attr("id");
       window.location.href = "${pageContext.request.contextPath}/updateProject/"+id;
    })
    </script>

</body>

</html>