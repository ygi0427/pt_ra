/*================================================================================
 Program: Africa_pm25_and_so2_2001~2005.do
 Creator: Wang  
 Created: 2020/3/30
 Updated: Lin
 Purpose: 
==================================================================================*/

set more off
global dir = "D:/00_work/08_pollution"
clear

use "$dir/working_data/UG_distcoor.dta", replace
merge m:1 lat lon year month day using "$dir/working_data/2008~2015_pm25_and_so2_daily.dta"


/*
    Result                           # of obs.
    -----------------------------------------
    not matched                    34,459,919
        from master                         0  (_merge==1)
        from using                 34,459,919  (_merge==2)

    matched                            56,750  (_merge==3)
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
* pm25後7、14、21、30、60、90、180、365日平均 *
***************************************

//生成pm25後1~365天的變數
foreach v in day_avg_pm25{
	forvalue i = 1(1)365{ 
		bysort lat lon: gen `v'_`i' = `v'[_n+`i']
	}
}

//生成每個grid的後7日平均
foreach v in day_avg_pm25{
		egen `v'd7 = rowmean(`v'_1-`v'_7)
}

//生成每個grid的後14日平均
foreach v in day_avg_pm25  {
		egen `v'd14 = rowmean(`v'_1-`v'_14)
}

//生成每個grid的後21日平均
foreach v in day_avg_pm25  {
		egen `v'd21 = rowmean(`v'_1-`v'_21)
}

//生成每個grid的後30日平均
foreach v in day_avg_pm25{
		egen `v'd30 = rowmean(`v'_1-`v'_30)
}

//生成每個grid的後60日平均
foreach v in day_avg_pm25{
		egen `v'd60 = rowmean(`v'_1-`v'_60)
}

//生成每個grid的後90日平均
foreach v in day_avg_pm25{
		egen `v'd90 = rowmean(`v'_1-`v'_90)
}

//生成每個grid的後180日平均
foreach v in day_avg_pm25{
		egen `v'd180 = rowmean(`v'_1-`v'_180)
}

//生成每個grid的後365日平均
foreach v in day_avg_pm25{
		egen `v'd365 = rowmean(`v'_1-`v'_365)
}


//刪除後1~365天的變數
foreach v in day_avg_pm25{
	forvalue i = 1(1)365{ 
		drop `v'_`i' 
	}
}


******************************************
* pm25_v2後7、14、21、30、60、90、180、365日平均 *
******************************************

//生成pm25後1~364天的變數
foreach v in  day_avg_pm25_v2 {
	forvalue i = 1(1)365{ 
		bysort lat lon: gen `v'_`i' = `v'[_n+`i']
	}
}

//生成每個grid的後7日平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd7 = rowmean(`v'_1-`v'_7)
}

//生成每個grid的後14日平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd14 = rowmean(`v'_1-`v'_14)
}

//生成每個grid的後21日平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd21 = rowmean(`v'_1-`v'_21)
}

//生成每個grid的後30日平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd30 = rowmean(`v'_1-`v'_30)
}

//生成每個grid的後60日平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd60 = rowmean(`v'_1-`v'_60)
}

//生成每個grid的後90日平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd90 = rowmean(`v'_1-`v'_90)
}

//生成每個grid的後180日平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd180 = rowmean(`v'_1-`v'_180)
}

//生成每個grid的後365日平均
foreach v in  day_avg_pm25_v2 {
		egen `v'd365 = rowmean(`v'_1-`v'_365)
}


//刪除後1~365天的變數
foreach v in  day_avg_pm25_v2 {
	forvalue i = 1(1)365{ 
		drop `v'_`i' 
	}
}

**************************************
* so2後7、14、21、30、60、90、180、365日平均 *


//生成so2後1~364天的變數
foreach v in   day_avg_ppbSO2{
	forvalue i = 1(1)365{ 
		bysort lat lon: gen `v'_`i' = `v'[_n+`i']
	}
}

//生成每個grid的後7日平均
foreach v in  day_avg_ppbSO2{
		egen `v'd7 = rowmean(`v'_1-`v'_7)
}

//生成每個grid的後14日平均
foreach v in  day_avg_ppbSO2{
		egen `v'd14 = rowmean(`v'_1-`v'_14)
}

//生成每個grid的後21日平均
foreach v in  day_avg_ppbSO2{
		egen `v'd21 = rowmean(`v'_1-`v'_21)
}

//生成每個grid的後30日平均
foreach v in  day_avg_ppbSO2{
		egen `v'd30 = rowmean(`v'_1-`v'_30)
}

//生成每個grid的後60日平均
foreach v in  day_avg_ppbSO2{
		egen `v'd60 = rowmean(`v'_1-`v'_60)
}

//生成每個grid的後90日平均
foreach v in  day_avg_ppbSO2{
		egen `v'd90 = rowmean(`v'_1-`v'_90)
}

//生成每個grid的後180日平均
foreach v in  day_avg_ppbSO2{
		egen `v'd180 = rowmean(`v'_1-`v'_180)
}

//生成每個grid的後365日平均
foreach v in  day_avg_ppbSO2{
		egen `v'd365 = rowmean(`v'_1-`v'_365)
}


//刪除後1~365天的變數
foreach v in  day_avg_ppbSO2{
	forvalue i = 1(1)365{ 
		drop `v'_`i' 
	}
}



//更改變數名稱
rename day_avg_pm25     pm25
rename day_avg_pm25d7   pm25ld7
rename day_avg_pm25d14  pm25ld14
rename day_avg_pm25d21  pm25ld21
rename day_avg_pm25d30  pm25ld30
rename day_avg_pm25d60  pm25ld60
rename day_avg_pm25d90  pm25ld90
rename day_avg_pm25d180 pm25ld180
rename day_avg_pm25d365 pm25ld365

rename day_avg_pm25_v2     pm25_v2
rename day_avg_pm25_v2d7   pm25ld7_v2
rename day_avg_pm25_v2d14  pm25ld14_v2
rename day_avg_pm25_v2d21  pm25ld21_v2
rename day_avg_pm25_v2d30  pm25ld30_v2
rename day_avg_pm25_v2d60  pm25ld60_v2
rename day_avg_pm25_v2d90  pm25ld90_v2
rename day_avg_pm25_v2d180 pm25ld180_v2
rename day_avg_pm25_v2d365 pm25ld365_v2

rename day_avg_ppbSO2     so2
rename day_avg_ppbSO2d7   so2ld7
rename day_avg_ppbSO2d14  so2ld14
rename day_avg_ppbSO2d21  so2ld21
rename day_avg_ppbSO2d30  so2ld30
rename day_avg_ppbSO2d60  so2ld60
rename day_avg_ppbSO2d90  so2ld90
rename day_avg_ppbSO2d180 so2ld180
rename day_avg_ppbSO2d365 so2ld365

label var pm25    "MERRA2 PM2.5 = DUSMASS25 + SSSMASS25 + BCSMASS + 1.6*OCSMASS + 1.375*SO4SMASS" 
label var pm25_v2 "MERRA1 PM2.5 = DUSMASS25 + SSSMASS25 + BCSMASS + 1.4*OCSMASS + 1.375*SO4SMASS"
label var so2     "MERRA2 so2"

drop if dist ==""

save "$dir/working_data/UG_pm25_and_so2_ld.dta", replace

use "$dir/working_data/UG_pm25_and_so2_lg.dta", replace
merge 1:1 dist year month day using "$dir/working_data/UG_pm25_and_so2_ld.dta"
drop _merge
save "$dir/working_data/UG_pm25_and_so2.dta", replace
