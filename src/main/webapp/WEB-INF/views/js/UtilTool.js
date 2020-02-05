function DaysCountdown(sLimitDay){
	var nowDate ,limitDay , countDay;
	nowDate = new Date();
	limitDay = new Date(sLimitDay);
	countDay = parseInt(Math.abs(limitDay - nowDate)/1000/60/60/24);
	return countDay;
	}