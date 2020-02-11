<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Message</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/movie.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../fragment/top.jsp"></jsp:include>
	<div style="display: inline-block; text-align: center; width: 100%">

		<div
			style="display: inline-block; text-align: left; width: 80%; border-style: none">
			<div style="text-align: left; display: inline-block; font-size: 40px">${message.messageTitle}</div>
			<div style="display: inline-block; width: 100%">
				<div style="display: inline-block; width: 80%">
					發文者 : ${message.memberBean.memberImage}
					${message.memberBean.memberName}
					<c:if test="${members.memberId == message.memberBean.memberId}">
						<a
							href="<spring:url value='/update/message/${message.messageId}' />">編輯</a>
							<a
							href="<spring:url value='/deleteMessage/${message.messageId}' />">刪除</a>
					</c:if>
				</div>
				<div style="display: inline-block; width: 20%; text-align: right; float: right">
					<button id="likebutton" onclick="like(${message.messageId})">讚</button>
				</div>
			</div>
			<div id="likes">${message.messageLike}人按讚</div>
			<div>時間 : ${message.createDate}</div>
			<p>
			<div style="font-size: 20px">${message.messageContent}</div>
		</div>
		<div
			style="display: inline-block; text-align: left; text-valign: center; width: 80%; border-style: none; background-color: #E8E8E8">

			<c:forEach var='replys' items='${replys}'>
				<c:if test="${ replys.replyDelete ==1}">
					<div style="display: inline-block; width: 100%">
						<div style="display: inline-block; width: 8%">${replys.membersBean.memberImage }</div>
						<div style="display: inline-block; width: 8%">${replys.membersBean.memberName }</div>
						<div id="content${replys.replyId}"
							style="display: inline-block; width: 49%">${replys.replyContent}</div>
						<div id="date${replys.replyId }"
							style="display: inline-block; width: 15%">${replys.replyDate }</div>

						<c:if test="${replys.membersBean.memberId==members.memberId }">
							<div style="display: inline-block; text-align: right; width: 5%">
								<button id='replybutton${replys.replyId}'
									onclick="edit(${replys.replyId})">編輯</button>
							</div>
							<form method="GET"
								action="${pageContext.request.contextPath}/deleteReply/${message.messageId }
							"
								style="display: inline-block; text-align: right; width: 5%">
								<input type="hidden" name="replyId" value="${replys.replyId }">
								<div>
								<button type="submit" onclick="del()">刪除</button>
								</div>
							</form>
						</c:if >
						<c:if test="${replys.membersBean.memberId!=members.memberId }">
								<div style="display: inline-block; text-align: right; width: 7%">
								<button id="reportbutton${replys.replyId}" onclick="report(${replys.replyId})">檢舉</button>
								</div>
								<div  id="hidden22" style="display:none ; text-align: right; width: 5%">已檢舉</div>
						</c:if>
					</div>
				</c:if>
			</c:forEach>

			<form method='POST'
				action="${pageContext.request.contextPath}/replys/add">
				<fieldset>
					<div style="display: inline-block; text-align: left; width: 80%">
						<input name="replyContent" value="${replyContent}" type="text"
							placeholder="我要留言...." /><input type="submit" value="留言" />
					</div>
					<div>
						<input name="messageId" value="${message.messageId}" type="hidden">
					</div>
					<div>
						<input name="replyReport" value="1" type="hidden">
					</div>
					<div>
						<input id=replyDelete name="replyDelete" value="1" type="hidden">
					</div>
				</fieldset>
			</form>
			<div>
				<input id="messageLike" value="${message.messageLike}" type="hidden">
			</div>
		</div>
	</div>
	<script>
	function like(messageId){
		
			var  messageLike= parseInt($("#messageLike").val())+1;

		alert(messageLike);
	 		$.ajax({
				url:"like",
				type:"POST",
				data:{"messageId":messageId ,"messageLike":messageLike},
			success:function(messageId){
				$("#messageLike").val(messageLike);
				$("#likes").text(messageLike+"人按讚");
				$("#likebutton").text("收回讚");
				$("#likebutton").attr("onclick","notlike(${message.messageId})");
			}
			}) 
	}
	function notlike(messageId){
		var  messageLike= parseInt($("#messageLike").val())-1;
		alert(messageLike);
 		$.ajax({
			url:"like",
			type:"POST",
			data:{"messageId":messageId ,"messageLike":messageLike},
			success:function(messageId){
				$("#messageLike").val(messageLike);
				$("#likes").text(messageLike+"人按讚");
				$("#likebutton").text("讚");
				$("#likebutton").attr("onclick","like(${message.messageId})");
			}
 		})
	}
	function edit(replyId){
		var oldcontent=$("#content"+replyId).text();
		$("#content"+replyId).html("<input id='editing"+ replyId +"' type='text'  value='"+oldcontent+"'/>"); //change writing
		$("#replybutton"+replyId).attr("onclick","update("+replyId+")"); // change event
		$("#replybutton"+replyId).text("儲存"); //button text
	}
	function update(replyId){
		var conn = $("#editing"+replyId).val(); //取得replyContent value
		$.ajax ({
			url:"updateReply",
			type:"POST",
			data:{"replyId":replyId,"replyContent":conn },
			success :function(replyDate){
				alert("編輯成功");
				 	$("#content"+replyId).html("<div id='content"+ replyId +"'>");  
				 	$("#content"+replyId).text(conn);  
					$("#replybutton"+replyId).attr("onclick","edit("+replyId+")"); 
					$("#replybutton"+replyId).text("編輯");
		 			$("#date"+replyId).text(replyDate ); 
					
					// change event
				}
		})
	}
	function del(){ 
		if(!confirm("確認要刪除？")){ 
		window.event.returnValue = false; 
		} 
		} 
	function report(replyId){ 
		alert(replyId);
		if(!confirm("確認要檢舉？")){ 
		window.event.returnValue = false; 
		} 
		var r =2;
		$.ajax({
			url:"reportReply",
			type:"POST",
			data:{"replyId":replyId ,"replyReport": r},
			error:function(data){
				$("#reportbutton"+replyId).text("放棄檢舉");
				$("#reportbutton"+replyId).attr("onclick","notreport("+replyId+")");
				$("#hidden22").attr("style","display:inline-block");
			},
			success :function(data){
				$("#reportbutton"+replyId).text("放棄檢舉");
				$("#reportbutton"+replyId).attr("onclick","notreport("+replyId+")");
				$("#hidden22").attr("style","display:inline-block");
			}
		})
		} 
	function notreport(replyId){ 
		alert(replyId);
		if(!confirm("確認要放棄檢舉？")){ 
		window.event.returnValue = false; 
		} 
		var r =1;
		$.ajax({
			url:"reportReply",
			type:"POST",
			data:{"replyId":replyId ,"replyReport": r},
			error:function(data){
				$("#reportbutton"+replyId).text("檢舉");
				$("#reportbutton"+replyId).attr("onclick","report("+replyId+")");
				$("#hidden22").attr("style","display:none");
			},
			success :function(replyId){
				$("#reportbutton"+replyId).text("檢舉");
				$("#reportbutton"+replyId).attr("onclick","report("+replyId+")");
				$("#hidden22").attr("style","display:none");
			}
		})
		} 
	
	</script>
</body>
</html>