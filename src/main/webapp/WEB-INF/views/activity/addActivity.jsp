<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 <title>TaiwanFilms</title>
<!-- <html>

<head>

<meta charset="UTF-8"> -->

      
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script> 


<style type="text/css">
fieldset {
	border: 1px solid black;
	width: 80%; 
	margin: auto;
	padding: 10px;
}

body{
	background-color: #f1f1f1;
}

.inner {
	vertical-align: top;
}

input {
	width: 100%;
}

.form-group {
	width: 50%;
}

.control-label {
	border-left: 3px solid #00bbd6;
	color: #00bbd6;
	font-size: 14px;
	font-weight: bold;
	padding-left: 10px
}

.col-lg-10 {
	padding: 10px 0px;
}

#activityAuthor {
	background-color: white;
}

#activityTitle {
	padding: 6px;
	border-radius: 2px;
}
.col-lg-10 input{
	width: 100%;
	height: 50px;
}
#btnAdd {
	width: 100%;
	padding-left: 30px;
	background-color: #eb4b4b;
	color: white;
	font-size: 16px;
	letter-spacing: 3px;
	padding: 6px;
	border-radius: 3px
} 

.form-group {
	padding: 5px 0px;
	width: 100%;
}

#activityNumber{
	font-size:40px;
	border:0px;
	font-weight: bold;
	background:#f1f1f1;
	color: red;
}

</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/movie.css"
	type="text/css">


<!-- <title>addActivity</title>
</head> -->
<body onload="ShowTime()" style="margin: 0"> 

<jsp:include page="../backstage.jsp" />
 
	<section>
		<div class="container"style="width: 80%;display: inline-block;float:right;padding-top: 40px;">
			<h1 style="text-align: center; font-weight: bold; font-size: 35px">新增活動資料</h1>
			<button class="demo" style="color:black;border: 1px solid black;display: inline-block;width: 10% "onclick="demo()">DEMO用資料</button>  
		</div>     
	</section> 
	    
	<section class="container" style="width: 80%;display: inline-block;float:right;padding-top: 20px;">
		<div class="coverpic"></div> 
		<form:form method='POST' modelAttribute="activityBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
			
				<div class="form-group" style="font-size: 40px">
					<label class="control-label col-lg-2 col-lg-2"
						for='activityNumber' >本次活動編號</label>
					<div class="col-lg-10">
						<form:textarea id="activityNumber" path="activityNumber"
							type='text'  class='form:input-large' />
					</div>
				</div>			
			
			
			
 				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='activityTitle'>
						活動名稱（最多輸入20字) </label>
					<div class="col-lg-10">
						<form:input id="activityTitle"   path="activityTitle" type='text'
							class='form:input-large' maxlength="20" style="font-size:20px;font-weight: bold"  />
					</div>
				</div> 


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="activityAuthor">
						主辦方 </label>
					<div class='col-lg-10'>
						<form:input id="activityAuthor" path="activityAuthor" type='text'
							class='form:input-large' />
					</div>
				</div>


				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2"
						for='activityMainContent'> 主頁活動內容顯示(最多輸入60字) </label>
					<div class="col-lg-10">
						<form:input id="activityMainContent" path="activityMainContent"
							type='text' class='form:input-large' maxlength="60" />
					</div>
				</div>




				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2"
						for='activityContent'> 內頁活動內容</label>
					<div class="col-lg-10">
						<form:textarea cols="80" rows="10"  id="activityContent" path="activityContent"
							type='text' style="font-size:15px" class='form:input-large' />
					</div>
				</div>








				<div class="form-group" style="display: none">
					<label class='control-label col-lg-2 col-lg-2' for="activityWatched">
						觀看次數(測試) </label>
					<div class='col-lg-10'>
						<form:input id="activityWatched" path="activityWatched" type='text'
							class='form:input-large' value="0"/>
					</div>
				</div>


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="status">
						狀態</label>
					<div class='col-lg-10' >
						<form:select id="status" path="status" type='text'
									class='form:input-large'>	
							<form:option selected="true" value="-1" disabled="true" label="請選擇狀態"></form:option>
							<form:option  value="1"  label="活動上架"></form:option>
						</form:select>
					</div>
				</div>
				
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category">
						活動類別</label>
					<div class='col-lg-10'>
						<form:select id="category" path="category" type='text'
							class='form:input-large' >								 
							<form:option selected="true" value="-1" disabled="true" label="請選擇類別"></form:option>
							<form:option  value="1" class="hehe" label="最新活動" id="newest"></form:option>
							<form:option  value="3" class="hehe" label="活動即將開始" id="coming"></form:option>
						</form:select>
						<div id="categorycatch"></div>
					</div>
				</div>
				

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productImage">
						  
					</label> 
					<div class='col-lg-10'>
						<form:input id="productImage" path="productImage" type='file'
							class='form:input-large' />
					</div>
				</div>
 



				<div class="form-group" style="display: none">
					<label class='control-label col-lg-2 col-lg-2' for="createTime">
						活動開始時間</label>
					<div class='col-lg-10'> 
						<form:input path="createTime" type='text'
							class='form:input-large' id="starttime" value="4" />
					</div> 
				</div> 

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="startTime">
						活動預定上架時間</label>
					<div class='col-lg-10'>
						<form:select id="startTime" path="startTime" type='text'
							class='form:input-large' >								 
							<form:option selected="true" value="-1" disabled="true" label="請選擇活動上架日期"></form:option>
							<form:option  value="0" id="now" label="0" ></form:option>
							<form:option  value="1"  id="delay1"  label="1" ></form:option>
							<form:option  value="2" id="delay2" label="2"></form:option>
							<form:option  value="3" id="delay3" label="3"></form:option>
							<form:option  value="4" id="delay4" label="4"></form:option>
						</form:select>
						<div id="categorycatch"></div>
					</div>
				</div> 

				<div class="form-group" style="display: none">
					<label class="control-label col-lg-2 col-lg-2"
						for='endTime'>活動結束時間</label>
					<div class="col-lg-10">
						<form:textarea id="endTime" path="endTime"
							type='text' style="font-size:15px" class='form:input-large' />
					</div>
				</div>





				<div class="form-group" style="width: 30%; display: inline-block">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="返回" href="../allActivityM" />
					</div>
				</div>
 


				<div class="form-group"
					style="width: 30%; display: inline-block; float: right">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出"  />
					</div>
				</div>
				
				
			
			</fieldset>
		</form:form>  
	</section>
	

</body>


<script language="javascript">

	function ShowTime(){
		  var date = new Date();
		  var y = date.getFullYear();
		  var M = (date.getMonth()+1);
		  var d = date.getDate();
		  var h = date.getHours();  
		  var m = date.getMinutes();
		  var s = date.getSeconds();
 		document.getElementById('starttime').setAttribute("value",y +"/"+ M +"/"+d); 
		
		document.getElementById('now').setAttribute("value", y +"/"+ M +"/"+d);
		document.getElementById('now').innerHTML = "今日上架 :"+ M + "月"+ d +"日" ;
		
		document.getElementById('delay1').setAttribute("value", y +"/"+ M +"/"+(d+1)); 
		document.getElementById('delay1').innerHTML = "延後一天	 :"+ M + "月"+ (d+1) +"日"; 
		
		
		document.getElementById('delay2').setAttribute("value",y +"/"+ M +"/"+(d+3));
		document.getElementById('delay2').innerHTML = "延後三天	 :"+ M + "月" + (d+3) + "日";
		document.getElementById('delay3').setAttribute("value",y +"/"+ M +"/"+(d+7));
		document.getElementById('delay3').innerHTML = "延後一週 	:"+ M + "月"+ (d+7) + "日" ;
		document.getElementById('delay4').setAttribute("value",y +"/"+ (M+1) +"/"+d);
		document.getElementById('delay4').innerHTML = "延後一個月:"+ (M+1) +"月"+d + "日"; 
		 
		setTimeout('ShowTime()',100000)
	};
	  
	
	$("#startTime").blur(function(){
		var x = $("#startTime").val();
		var z = x.replace("/" + x.substr(5,1) + "/", "/" + (parseInt(x.substr(5,1))+1) + "/")
		document.getElementById('endTime').setAttribute("value", z);
		document.getElementById('endTime').innerHTML = z;
	}); 
	
	
	 
	var zz = Math.floor (1000000 * Math.random());
	console.log("zz = " + zz); 
	
	document.getElementById('activityNumber').setAttribute("value", zz);
	document.getElementById('activityNumber').innerHTML =  zz ;
	
	
	 


	
	</script>

 </html>
 