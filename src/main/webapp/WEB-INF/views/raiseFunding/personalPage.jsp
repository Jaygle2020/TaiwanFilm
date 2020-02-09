<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalPage.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
</head>


<body>
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
                    <div class="content"><span >購買方案</span><span>$100</span></div>
                </div>
                <div class="downMeta">
                    <div class="wholePercent"></div>
                    <div class="realPercent" style="width:45%"></div>
                </div>
                <div class="plan">
                    <span class="money">$ 45000</span> <span
                        class="percent">45%</span> <span class="date">還剩
                        <strong>22小時</strong>
                    </span>
                </div>
            </div>
            </c:forEach>
           </c:if>
        </div>


    </div>
</body>
</html>