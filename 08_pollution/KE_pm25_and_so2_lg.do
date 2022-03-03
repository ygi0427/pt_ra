/*================================================================================
 Program: Africa_pm25_and_so2_2001~2005.do
 Creator: Wang  
 Created: 2020/3/30
 Updated: Lin
 Purpose: 
==================================================================================*/

set more off
//global dir = "D:/00_work/08_pollution"
global dir = "/Volumes/Samsung_T5/00_work/08_pollution/"
clear

use "$dir/working_data/KE_distcoor.dta", replace
merge m:1 lat lon year month day using "$dir/working_data/2008~2015_pm25_and_so2_daily.dta"


/*
    Result                           # of obs.
    -----------------------------------------
    not matched                     2,416,624
        from master                         0  (_merge==1)
        from using                  2,416,624  (_merge==2)

    matched                             3,395  (_merge==3)
    -----------------------------------------
*/
gen have_data = 0
replace have_data = 1 if _merge == 3
bysort lat lon: egen have_data_2 = max(have_data)

keep if have_data_2 == 1
drop _merge have_data have_data_2

order lat lon year month day
bysort dist lat lon year month day: keep if _n == 1


***************************************
* pm25前7、14、30、90、180、365日平均 *
***************************************
//21, 60
//生成pm25前1~364天的變數
foreach v in day_avg_pm25{
	forvalue i = 1(1)364{ 
		bysort lat lon: gen `v'_`i' = `v'[_n-`i']
	}
}

//生成每個grid的前7日(包含當日)平均
foreach v in day_avg_pm25{
		egen `v'd7 = rowmean(`v' `v'_1-`v'_6)
}

//生成每個grid的前14日(包含當日)平均
foreach v in day_avg_pm25  {
		egen `v'd14 = rowmean(`v' `v'_1-`v'_13)
}

//生成每個grid的前21日(包含當日)平均
foreach v in day_avg_pm25  {
		egen `v'd21 = rowmean(`v' `v'_1-`v'_20)
}

//生成每個grid的前30日(包含當日)平均
foreach v in day_avg_pm25{
		egen `v'd30 = rowmean(`v' `v'_1-`v'_29)
}

//生成每個grid的前60日(包含當日)平均
foreach v in day_avg_pm25{
		egen `v'd60 = rowmean(`v' `v'_1-`v'_59)
}

//生成每個grid的前90日(包含當日)平均
foreach v in day_avg_pm25{
		egen `v'd90 = rowmean(`v' `v'_1-`v'_89)
}

//生成每個grid的前180日(包含當日)平均
foreach v in day_avg_pm25{
		egen `v'd180 = rowmean(`v' `v'_1-`v'_179)
}

//生成每個grid的前365日(包含當日)平均
foreach v in day_avg_pm25{
		egen `v'd365 = rowmean(`v' `v'_1-`v'_364)
}


//刪除前1~364天的變數
foreach v in day_avg_pm25{
	forvalue i = 1(1)364{ 
		drop `v'_`i' 
	}
}

//生成該月平均
foreach v in day_avg_pm25{
	bysort lat lon year month: egen `v'_monthly = mean(`v')
}


******************************************
* pm25_v2前7、14、30、90、180、365日平均 *
******************************************
//21, 60

//生成pm25前1~364天的變數
foreach v in  day_avg_pm25_v2 {
	forvalue i = 1(1)364{ 
		bysort lat lon: gen `v'_`i' = `v'[_n-`i']
	}
}

//生成每個grid的前7日(包含當日)平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd7 = rowmean(`v' `v'_1-`v'_6)
}

//生成每個grid的前14日(包含當日)平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd14 = rowmean(`v' `v'_1-`v'_13)
}

//生成每個grid的前21日(包含當日)平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd21 = rowmean(`v' `v'_1-`v'_20)
}

//生成每個grid的前30日(包含當日)平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd30 = rowmean(`v' `v'_1-`v'_29)
}

//生成每個grid的前60日(包含當日)平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd60 = rowmean(`v' `v'_1-`v'_59)
}

//生成每個grid的前90日(包含當日)平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd90 = rowmean(`v' `v'_1-`v'_89)
}

//生成每個grid的前180日(包含當日)平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd180 = rowmean(`v' `v'_1-`v'_179)
}

//生成每個grid的前365日(包含當日)平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd365 = rowmean(`v' `v'_1-`v'_364)
}


//刪除前1~364天的變數
foreach v in  day_avg_pm25_v2 {
	forvalue i = 1(1)364{ 
		drop `v'_`i' 
	}
}

//生成該月平均
foreach v in  day_avg_pm25_v2 {
	bysort lat lon year month: egen `v'_monthly = mean(`v')
}


**************************************
* so2前7、14、30、90、180、365日平均 *
**************************************
//21,60

//生成so2前1~364天的變數
foreach v in   day_avg_ppbSO2{
	forvalue i = 1(1)364{ 
		bysort lat lon: gen `v'_`i' = `v'[_n-`i']
	}
}

//生成每個grid的前7日(包含當日)平均
foreach v in  day_avg_ppbSO2{
		egen `v'd7 = rowmean(`v' `v'_1-`v'_6)
}

//生成每個grid的前14日(包含當日)平均
foreach v in  day_avg_ppbSO2{
		egen `v'd14 = rowmean(`v' `v'_1-`v'_13)
}

//生成每個grid的前21日(包含當日)平均
foreach v in  day_avg_ppbSO2{
		egen `v'd21 = rowmean(`v' `v'_1-`v'_20)
}

//生成每個grid的前30日(包含當日)平均
foreach v in  day_avg_ppbSO2{
		egen `v'd30 = rowmean(`v' `v'_1-`v'_29)
}

//生成每個grid的前60日(包含當日)平均
foreach v in  day_avg_ppbSO2{
		egen `v'd60 = rowmean(`v' `v'_1-`v'_59)
}

//生成每個grid的前90日(包含當日)平均
foreach v in  day_avg_ppbSO2{
		egen `v'd90 = rowmean(`v' `v'_1-`v'_89)
}

//生成每個grid的前180日(包含當日)平均
foreach v in  day_avg_ppbSO2{
		egen `v'd180 = rowmean(`v' `v'_1-`v'_179)
}

//生成每個grid的前365日(包含當日)平均
foreach v in  day_avg_ppbSO2{
		egen `v'd365 = rowmean(`v' `v'_1-`v'_364)
}


//刪除前1~364天的變數
foreach v in  day_avg_ppbSO2{
	forvalue i = 1(1)364{ 
		drop `v'_`i' 
	}
}

//生成該月平均
foreach v in day_avg_ppbSO2{
	bysort lat lon year month: egen `v'_monthly = mean(`v')
}



//更改變數名稱
rename day_avg_pm25     pm25
rename day_avg_pm25d7   pm25lg7
rename day_avg_pm25d14  pm25lg14
rename day_avg_pm25d21  pm25lg21
rename day_avg_pm25d30  pm25lg30
rename day_avg_pm25d60  pm25lg60
rename day_avg_pm25d90  pm25lg90
rename day_avg_pm25d180 pm25lg180
rename day_avg_pm25d365 pm25lg365

rename day_avg_pm25_v2     pm25_v2
rename day_avg_pm25_v2d7   pm25lg7_v2
rename day_avg_pm25_v2d14  pm25lg14_v2
rename day_avg_pm25_v2d21  pm25lg21_v2
rename day_avg_pm25_v2d30  pm25lg30_v2
rename day_avg_pm25_v2d60  pm25lg60_v2
rename day_avg_pm25_v2d90  pm25lg90_v2
rename day_avg_pm25_v2d180 pm25lg180_v2
rename day_avg_pm25_v2d365 pm25lg365_v2

rename day_avg_ppbSO2     so2
rename day_avg_ppbSO2d7   so2lg7
rename day_avg_ppbSO2d14  so2lg14
rename day_avg_ppbSO2d21  so2lg21
rename day_avg_ppbSO2d30  so2lg30
rename day_avg_ppbSO2d60  so2lg60
rename day_avg_ppbSO2d90  so2lg90
rename day_avg_ppbSO2d180 so2lg180
rename day_avg_ppbSO2d365 so2lg365

rename day_avg_pm25_monthly     pm25_monthly
rename day_avg_pm25_v2_monthly  pm25_monthly_v2
rename day_avg_ppbSO2_monthly   so2_monthly

label var pm25    "MERRA2 PM2.5 = DUSMASS25 + SSSMASS25 + BCSMASS + 1.6*OCSMASS + 1.375*SO4SMASS" 
label var pm25_v2 "MERRA1 PM2.5 = DUSMASS25 + SSSMASS25 + BCSMASS + 1.4*OCSMASS + 1.375*SO4SMASS"
label var so2     "MERRA2 so2"

drop if dist ==""

save "$dir/working_data/KE_pm25_and_so2_lg.dta", replace


