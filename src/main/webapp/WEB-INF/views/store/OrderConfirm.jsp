<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<script type="text/javascript">
function cancelOrder() {
	if (confirm("確定取消此份訂單 ? ") ) {
		// 接收此資料的Servlet會使用 finalDecision 參數的值
		document.forms[0].finalDecision.value = "CANCEL";
		document.forms[0].action="<c:url value='ProcessOrder' />";
		document.forms[0].method="POST";
		document.forms[0].submit();
		return;
	} else {
		return;
	}
}
function reconfirmOrder() {
	var sa = document.getElementById('ShippingAddress').value;
	if  (sa === "") {
		window.alert ('出貨地址不能是空白');
		return ; 
	}
	if (confirm("確定送出此份訂單 ? ") ) {
		// 接收此資料的Servlet會使用 finalDecision 參數的值
		document.forms[0].finalDecision.value = "ORDER";
		document.forms[0].action="<c:url value='ProcessOrder' />";
		document.forms[0].method="POST";
		document.forms[0].submit();
		return;
	} else {
		return;
	}
}
</script>
<meta charset="UTF-8">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 取得今天的日期，今天的日期應當在最後確認時才取得 -->
<jsp:useBean   id="today"  class="java.util.Date" scope="session"/> 
<title>訂單明細資訊確認</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body >
<c:set var="funcName" value="CHE" scope="session"/>
<jsp:include page="topMVC.jsp" />
<div style="text-align:center">
<h3>確認訂單：</h3>
<FORM style="margin: 0 auto; width:750px;" action="<c:url value='ProcessOrder' />" method="POST" >
   <TABLE  style="background:white; border: 0.5px solid #d1d1d1; width:810;">
      <TR >
         <TD style="text-align:left; border: 0.5px solid #d1d1d1;">
         	會員編號：${members.memberId}
         </TD>
         <TD style="text-align:left; border: 0.5px solid #d1d1d1;">
         	客戶姓名：${members.memberName}
         </TD>
         <TD style="text-align:left; border: 0.5px solid #d1d1d1;">
         	訂單日期：<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>
         </TD>
      </TR>
      <TR>
         <TD colspan='3' style="text-align:left; border: 0.5px solid #d1d1d1;">
         	會員地址：台北市
         </TD>
      </TR>
      <TR>
         <TD colspan='3' style="text-align:left; border: 0.5px solid #d1d1d1;">
                             出貨地址：<Input style="background:#d1d1d1;" size="60" type="text" id='ShippingAddress' 
                   name="ShippingAddress" value="">
                   <font color='red'>${errorMsg.ShippingAddress}</font>
         </TD>
      </TR>
      <TR>
         <TD colspan='3' style="text-align:left; border: 0.5px solid #d1d1d1;">
                                   統一編號：<Input style="background:#d1d1d1;" size="10" type="text" 
                      name="BNO" value="">
         </TD>
      </TR>
      <TR>
         <TD colspan='3' style="text-align:left; border: 0.5px solid #d1d1d1;">
                                   發票抬頭：<Input style="background:#d1d1d1;" size="50" type="text" 
                      name="InvoiceTitle" value="" >
         </TD>
      </TR>
    
      <TR>
         <TD colspan='3'>
         
   <TABLE border='1' style=" border: 0.5px solid #d1d1d1; " >
      
     <TR><TH style="text-align:center;font-size: 12pt;" width="350">商品名稱</TH>
         <!-- <TH style="text-align:center;font-size: 12pt;" width="80">作者</TH> -->
         <TH style="text-align:center;font-size: 12pt;" width="180">廠商名稱</TH>
         <TH style="text-align:center;font-size: 12pt;" width="50">數量</TH>
         <TH style="text-align:center;font-size: 12pt;" width="80">單價</TH>
         <TH style="text-align:center;font-size: 12pt;" width="110">小計</TH></TR>
     
     <c:forEach varStatus="vs" var="entry" items="${ShoppingCart.content}">
                                                    
        <TR height='16'>
          <TD style="text-align:center  ;font-size: 11pt;">${entry.value.title}</TD>
         <%--  <TD style="text-align:center;font-size: 11pt;">
          	${fn:substring(entry.value.author, 0, 3)}
          </TD> --%>
          <TD style="text-align:center;font-size: 11pt;">
          	${fn:substring(entry.value.companyName, 0, 10)}
          </TD>
          <TD style="text-align:center ;font-size: 11pt;"> 
          	${entry.value.quantity}
          </TD>
          <TD style="text-align:center ;font-size: 11pt;">
<!--        entry.value.discount 暫為1 -->
          	<fmt:formatNumber value="${entry.value.unitPrice * 1 }" pattern="#,###" />元
          </TD>
          <TD style="text-align:center ;font-size: 11pt;">
<!--        entry.value.discount 暫為1 -->
          	<fmt:formatNumber value="${entry.value.unitPrice * entry.value.quantity}" pattern="#,###,###" />元
          </TD>
        </TR>
     </c:forEach>
     
        <TR height='30'>
          <TD style="text-align:right;font-size: 11pt;" colspan='3' >&nbsp;</TD>
          <TD style="text-align:center;font-size: 11pt;" >總計金額</TD>
          <TD style="text-align:center;font-size: 11pt;" >
          <fmt:formatNumber value="${ShoppingCart.subtotal}" pattern="#,###,###" />元</TD>
                  
        </TR>
       <%--  <TR>
          <TD colspan='5' style="text-align:right;font-size: 11pt;" >營業稅：</TD>
          <c:set var="VAT" value="${ShoppingCart.subtotal*0.05 + 0.0001}"/>
          <TD style="text-align:right;font-size: 11pt;" > 
          <fmt:formatNumber value="${VAT}" pattern="#,###,###" />元</TD>
        </TR>
        <TR> --%>
   <%--        <TD colspan='5' style="text-align:right;font-size: 11pt;" >總計金額：</TD>
          <TD style="text-align:right;font-size: 11pt;color:#AA0200;" >
          <fmt:formatNumber value="${ShoppingCart.subtotal + VAT }" pattern="#,###,###" />元</TD>
        </TR> --%>
   </TABLE>
          </TD>
      </TR>
 
   </TABLE><P/>
   <input type="hidden" name="finalDecision"  value="">   
   <input type="button" name="OrderBtn"  value="確定送出" onclick="reconfirmOrder()">
   <input type="button" name="CancelBtn" value="取消訂單" onclick="cancelOrder()">
</FORM>
</div>

</body>
</html>