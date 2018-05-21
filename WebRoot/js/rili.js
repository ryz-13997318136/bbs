window.onload=function()
{
	var oCal=document.getElementById("calendar");
	var oTitle=oCal.getElementsByTagName("h1")[0];
	var oUl=oCal.getElementsByTagName("ul")[0];
	var aLi=oUl.getElementsByTagName("li");
	var oPre=oCal.getElementsByTagName("span")[0];
	var oNext=oCal.getElementsByTagName("span")[1];
	var oNow=new Date();
	var nowYear=oNow.getFullYear();
	var nowMonth=oNow.getMonth();
	var nowDate=oNow.getDate();
	var nowDay=oNow.getDay();
	var nowTime=oNow.getTime();
	var tMonth=nowMonth;//��Ϊ��������ĵ��Ǹ�Month
	function createCalendar(tMonth)
	{
		//���ݴ�����·�������ʱ��
		var oDate=new Date();
		oDate.setMonth(tMonth);
		oDate.setDate(1);
		var iYear=oDate.getFullYear();
		var iMonth=oDate.getMonth();
		var iDay=oDate.getDay();
		oTitle.innerHTML=iYear+"��"+(iMonth+1)+"��";
		//��ʼ��һ��
		for(var i=0;i<aLi.length;i++)
		{
			aLi[i].innerHTML="";
			aLi[i].style.height="40px";
			aLi[i].className="";
		}
		var iSum=0;	//�汾������
		var bLeap=false;//�Ƿ�������
		if(iYear%4==0 && iYear%100!==0 || iYear%400==0) bLeap=true;
		switch(iMonth+1)
		{
			case 1:
			case 3:
			case 5:
			case 7:
			case 8:
			case 10:
			case 12:
				iSum=31;
				break;
			case 4:
			case 6:
			case 9:
			case 11:
				iSum=30;
				break;
			case 2:
				if(bLeap) iSum=29;
				else iSum=28;
				break;
		}
		for(var i=1;i<=iSum;i++)
		{
			aLi[iDay].innerHTML=i;
			iDay++;
		}
		
		for(var i=0;i<aLi.length;i++)
		{
			if(aLi[i].innerHTML==nowDate && iYear==nowYear && iMonth==nowMonth)
			{
				aLi[i].className="active";
			}
			else if((aLi[i].innerHTML<nowDate && iMonth==nowMonth && iYear==nowYear) ||
				iMonth<nowMonth && iYear==nowYear || 
				iYear<nowYear)
			{
				aLi[i].className="grey";
			}
		}
		
		//��û�ֵĸ����۵�����
		for(var i=0;i<aLi.length;i++)
		{
			if(aLi[i].innerHTML=="")
			{
				aLi[i].style.height="0px";
			}
		}
	}
	createCalendar(tMonth);
	oPre.onclick=function()
	{
		createCalendar(--tMonth);
	};
	
	oNext.onclick=function()
	{
		createCalendar(++tMonth);
	};
};