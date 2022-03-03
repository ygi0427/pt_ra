/*==============================================================================
Step6:
1.絕對溫度改攝氏
2.修改氣壓層
3.將各鄉鎮市區高度加入
4.計算TI發生次數
==============================================================================*/
set more off
global dir = "D:/00_work/07_GWR_Ghana"

foreach year in 2008 2009 2010 2011{
	use "$dir/working_data/dta/GH`year'/GH`year'_v3.dta", clear
	
	forval k = 575(25)1000{
		replace T_`k'hpa = T_`k'hpa - 273.15       //絕對溫度改攝氏
	}
	replace level1 = level1 - 273.15
	replace level2 = level2 - 273.15
	
	//修改氣壓層(因為從700hpa往下，一次是減少50hpa，不是25hpa)
	rename T_575hpa T_450hpa                          
	rename T_600hpa T_500hpa
	rename T_625hpa T_550hpa
	rename T_650hpa T_600hpa
	rename T_675hpa T_650hpa

	replace lev1 = 450 if lev1 == 575
	replace lev1 = 500 if lev1 == 600
	replace lev1 = 550 if lev1 == 625
	replace lev1 = 600 if lev1 == 650
	replace lev1 = 650 if lev1 == 675

	replace lev2 = 450 if lev2 == 575
	replace lev2 = 500 if lev2 == 600
	replace lev2 = 550 if lev2 == 625
	replace lev2 = 600 if lev2 == 650
	replace lev2 = 650 if lev2 == 675
	
	label var T_450hpa "T_450hpa"                          
	label var T_500hpa "T_500hpa"
	label var T_550hpa "T_550hpa"
	label var T_600hpa "T_600hpa"
	label var T_650hpa "T_650hpa"
	label var T_700hpa "T_700hpa"                          
	label var T_725hpa "T_725hpa"
	label var T_750hpa "T_750hpa"
	label var T_775hpa "T_775hpa"
	label var T_800hpa "T_800hpa"
	label var T_825hpa "T_825hpa"                          
	label var T_850hpa "T_850hpa"
	label var T_875hpa "T_875hpa"
	label var T_900hpa "T_900hpa"
	label var T_925hpa "T_925hpa"                      
	label var T_950hpa "T_950hpa"
	label var T_975hpa "T_975hpa"
	label var T_1000hpa "T_1000hpa"

	save "$dir/working_data/dta/GH`year'/GH`year'_final.dta", replace
}



*新增altitude (資料來源：http://haiba.qhdi.com/）
//--	 


*生成level1、level2溫度差
gen temp_diff = level1 - level2

*生成該鄉鎮市區 該年 該月 該日 該時段 是否有TI
gen TI = 0
replace TI = 1 if temp_diff < 0


*生成鄉鎮市區 該年 該月 該日 level1.level2的溫差平均
bysort district year mon date: egen temp_diff_daily = mean(temp_diff)

*生成 該鄉鎮市區 該年 該月 該日 TI 總發生次數
bysort district year mon date: egen TI_day = sum(TI)

*生成 該鄉鎮市區 該年 該月 TI 總發生次數 (monthly total number of inversions
bysort district year mon : egen TI_month = sum(TI)

*number of days with at least one inversion(當天有TI則各時段morethan_1TI為1，最後和/4)
gen morethan_1TI = 0
replace morethan_1TI = 1 if TI_day > 0
bysort district year mon: egen morethan_1TI_days= sum(morethan_1TI)
replace morethan_1TI_days = morethan_1TI_days/4

*average inversion strength
bysort district year mon: egen temp_diff_monthly = mean(temp_diff)

save "$dir/working_data/GH_TI_Final_2008to2011.dta", replace

