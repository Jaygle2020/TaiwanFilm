<div class="header">
	<a href="">
		<div class="h-logo">FlyingV</div>
	</a>
	<div class="left-menu">
		<div>
			<a href="">提案</a>
		</div>
		<div>
			<a href="">探索</a>
		</div>
		<div>
			<a href="">探索</a>
		</div>
	</div>
	<div class="right-menu">
		<div>
			<a href="">關於我們</a>
		</div>
		<div class="myAccount">
			<a href="">我的帳戶</a>
		</div>
	</div>
</div>
<div
	style="position: fixed; width: 9%; right: 0px; z-index: 99; background-color: white; display: none"
	class="register-btn">
	<p>
		<a href="">登入</a>
	</p>
	<p>
		<a href="">註冊新帳號</a>
	</p>
</div>
<script>
	$('.myAccount').mouseover(function() {
		$('.register-btn').show();
	});
	
	$('.myAccount').mouseout(function() {
		$('.register-btn').hide();
	});
</script>