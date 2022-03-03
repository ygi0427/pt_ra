/*==============================================================================
 Program: data_refine.do
 Creator: Lin  
 Created: 2021/05/08
 Updated: 
 Purpose: 
==============================================================================*/
capture log close
clear all
set more off

global dir = "D:/00_work/08_pollution"

/*==============================================================================
前置作業0: crawl.py
爬需要的nc4
==============================================================================*/
*crawl.py

/*==============================================================================
前置作業1: pm25_2008~2015.py
nc4轉xlsx
==============================================================================*/
*pm25_2008~2015.py

/*==============================================================================
Step1: nc4_data.do
此do file是要做出可將nc4 run出來的資料對應其該有的緯度、經度的dta file
==============================================================================*/
do "$dir/programs/nc4_data.do"

/*==============================================================================
Step2: 
將dist date coor對起來 & 刪除不合理日期
==============================================================================*/
do "$dir/programs/distcoor+date.do"

/*==
KE
drop if date == "28"
drop if date == "23"
drop if date == "25/10"
drop if date == "04/06/2000"
drop if date == "04/2013"
drop if date == "05/05/2022"
drop if date == "09/11"
drop if date == "11/2014"
drop if date == "11/1012013"
drop if date == "30"
drop if date == "2"
drop if date == "2/09/201"
drop if date == "209/2013"
drop if date == "23"
drop if date == "24/8/20143"
drop if date == "25.19.2013"
drop if date == "25/10"
drop if date == "25/1022013"
drop if date == "26/9/20"
drop if date == "27/2013"
drop if date == "28/09/203"
drop if date == "30"
drop if date == "3171072013"
drop if date == "4/9/201"
drop if date == "30.8.20132"
drop if year == 2001
drop if year == 2003
drop if year == 2006
drop if year == 2007
drop if year > 2014
drop if year < 2009
drop if month < 1
drop if month > 12
drop if day < 1
drop if day > 31
drop if (month == 4 & day > 30)
drop if (month == 6 & day > 30)
drop if (month == 9 & day > 30)
drop if (month == 11 & day > 30)
drop if (month == 2 & day > 29)
drop if (month == 2 & day > 28 & year != 2012)

TZ
drop if year < 2010
drop if year > 2014
drop if month < 1
drop if month > 12
drop if day < 1
drop if day > 31
drop if (month == 4 & day > 30)
drop if (month == 6 & day > 30)
drop if (month == 9 & day > 30)
drop if (month == 11 & day > 30)
drop if (month == 2 & day > 29)
drop if (month == 2 & day > 28 & year != 2012)

UG
drop if year < 2010
drop if year > 2014
drop if month < 1
drop if month > 12
drop if day < 1
drop if day > 31
drop if (month == 4 & day > 30)
drop if (month == 6 & day > 30)
drop if (month == 9 & day > 30)
drop if (month == 11 & day > 30)
drop if (month == 2 & day > 29)
drop if (month == 2 & day > 28 & year != 2012)

==*/

/*=============================================================================
Step3: 
Get PM2.5 and SO2 for the past 7, 14, 21, 30, 60, 90, 180, 365 
and next 7, 14, 21, 30, 60, 90, 180, 365 days of EVERY grid.
==============================================================================*/
do "$dir/programs/grid_lgld.do"


/*=============================================================================
Step4: 
Merge coordinate, date and pm25 data with date and grid.
==============================================================================*/
do "$dir/programs/pm25_and_so2.do"
