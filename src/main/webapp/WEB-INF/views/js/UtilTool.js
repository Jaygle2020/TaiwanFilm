function DaysCountdown(sLimitDay){
	var nowDate ,limitDay , countDay,result;
	nowDate = new Date();
	limitDay = new Date(sLimitDay);
	result = limitDay - nowDate;
	if(result<=0)return "已截止";
	countDay = parseInt(Math.abs(result)/1000/60/60/24);
	return countDay;
	}
