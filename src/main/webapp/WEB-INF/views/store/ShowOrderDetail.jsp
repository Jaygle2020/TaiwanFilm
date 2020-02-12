<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 暫不登入 -->
<%-- <c:if test="${empty LoginOK}">
	<c:redirect url="/_02_login/login.jsp" />
</c:if> --%>
<title>個人訂單明細</title>
<style type="text/css">
#main {
	position: absolute;
	top: 110px;
	left: 210px;
}

#borderA {
	border: 1px solid black;
}
</style>
</head>
<body >
	<jsp:include page="topMVC.jsp" />
	<p />
	<TABLE style="margin-left: auto; margin-right: auto;  border: 0.5px solid #d1d1d1;">
		<tr id='borderA' height='50'>
			<th id='borderA' align="center" colspan="7"><h3>${LoginOK.name}訂單明細</h3></th>
		</tr>
		<tr id='borderA' height='36'>
			<td colspan="7">
				<table>
					<tr id='borderA'>
						<td align="Left" width="350px">
							<b>出貨地址：</b>${OrderBean.shippingAddress}
						</td>
						<td align="center" width="300px">
							<b>訂購日期：</b>${OrderBean.orderDate}
						</td>
						<td align="center" width="280px">
							<b>訂單編號：</b>${OrderBean.orderNo}
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr id='borderA' height='36'>
			<th id='borderA' width="100px" align="center">商品編號</th>
			<th id='borderA' width="400px" align="center">品名</th>
			<th id='borderA' width="70px" align="center">單價</th>
			<th id='borderA' width="50px" align="center">數量</th>
			<th id='borderA' width="100px" align="center">總價</th>
			<!-- <th id='borderA' width="80px" align="center">折扣</th> -->
			<th id='borderA' width="100px" align="center">售價</th>
		</tr>
		<c:set var="subtotal" value="0" />
		<c:forEach var="aBean" varStatus="stat" items="${OrderBean.items}">
			<c:choose>
				<c:when test="${ stat.count % 2 == 0 }">
					<c:set var="aColor" value="#E6FFA0" />
				</c:when>
				<c:otherwise>
					<c:set var="aColor" value="#EBFFEB" />
				</c:otherwise>
			</c:choose>
			<tr id='borderA' bgColor="${aColor}" height='30'>
				<td id='borderA' align="center">${aBean.bookId}</td>
				<td id='borderA' align="left">${aBean.title}</td>
				<td id='borderA' align="right">${aBean.unitPrice}&nbsp;</td>
				<td id='borderA' align="right">${aBean.quantity}&nbsp;</td>
				<td id='borderA' align="right">${aBean.unitPrice*aBean.quantity}&nbsp;</td>
				<%-- <td id='borderA' align="center">${aBean.discount}&nbsp;</td> --%>
				<td id='borderA' align="right"><fmt:formatNumber
						value="${aBean.unitPrice*aBean.quantity}"
						pattern="#,###,###" />元</td>
				<c:set var="subtotal"
					value="${ subtotal + aBean.unitPrice *  aBean.quantity }" />
			</tr>
		</c:forEach>
		<tr height='30'>
			<TD id='borderA' align="center" rowspan="3" colspan="4">&nbsp;</TD>
			<TD id='borderA' width="60px" align="center"><b>總金額</b></TD>
			<TD id='borderA' width="100px" align="right">
			   <fmt:formatNumber value="${subtotal}" pattern="#,###,###" />元</TD>
		</tr>
<%-- 		<tr height='30'>
			<TD id='borderA' width="60px" align="center"><b>營業稅</b></TD>
			<c:set var="VAT" value="${subtotal*0.05 + 0.0001}" />
			<TD id='borderA' width="100px" align="right">
			   <fmt:formatNumber value="${VAT}" pattern="#,###,###" />元</TD>
		</tr> --%><%-- 
		<tr height='30'>
			<TD id='borderA' width="60px" align="center"><b>總金額</b></TD>
			<TD id='borderA' width="100px" align="right">
			    <fmt:formatNumber value="${OrderBean.totalAmount}" pattern="#,###,###" />元</TD>
		</tr>  --%>
	</TABLE>
	<p />

	<div style="text-align: center">
		<a href="<c:url value='orderList.do' />">回上一頁</a>&nbsp;&nbsp;
		<a href="<c:url value='/index.jsp' />">回首頁</a>
	</div>
</body>
</html>
