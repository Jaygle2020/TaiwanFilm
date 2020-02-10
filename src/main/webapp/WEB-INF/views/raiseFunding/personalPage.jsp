<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/movie.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalPage.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/UtilTool.js" ></script>
</head>


<body>
<jsp:include page="../fragment/top.jsp" />
    <div class="pageWrapper">   
        <div class="upper">
            <P class="memberName" data-memberId="${mbBean.memberId}">${mbBean.memberName}&ensp;&ensp;您好</P>
            <P>其他消息</P>
        </div>
        <div class="down">
            <P>已支持的項目</P>
            <c:if test="${pcBeans!=null}">
            <c:forEach items="${pcBeans}"  var="pcBean">
            <div class="inner" id="project12">
                <div class="projectThumb" style="background-image:url('${pageContext.request.contextPath}/img/supermark/ok.png');">
                </div>
                <div class="project">
                    <p class="title">${pcBean.projBean.projectName}</p>
                    <p class="small-title">${pcBean.projBean.projDescript}</p>
                    <div class="content"><span >購買方案</span><span>$${pcBean.dpBean.donateMoney}</span></div>
                </div>
                <div class="downMeta">
                    <div class="wholePercent"></div>
                    <div class="realPercent" style="width:${pcBean.projBean.cfBean.percent}%"></div>
                </div>
                <div class="plan">
                    <span class="money">目前募得$${pcBean.projBean.cfBean.fundsNow}元</span> <span
                        class="percent">${pcBean.projBean.cfBean.percent}%</span> <span class="date">還剩
                        <strong class="dayCount" data-endDay="${pcBean.projBean.cfBean.dateEnd}"></strong>天
                    </span>
                </div>
            </div>
            </c:forEach>
           </c:if>
        </div>


    </div>
    
</body>
</html>