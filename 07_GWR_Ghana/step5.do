/*==============================================================================
Step5:
1.產生年變數
2.做出districts，開始有氣溫的第一層氣壓層及第二層
==============================================================================*/
set more off
global dir = "D:/00_work/07_GWR_Ghana"

foreach year in 2008 2009 2010 2011{
	use "$dir/working_data/dta/GH`year'/GH`year'_v2.dta", clear
	
	gen year = `year'
	gen level1 =.                  //開始有氣溫的第一層氣壓層的溫度
	gen level2 =.                  //開始有氣溫的第二層氣壓層的溫度
	gen lev1   =.                  //開始有氣溫的第一層氣壓層
	gen lev2   =.                  //開始有氣溫的第二層氣壓層

	forval i = 575(25)1000 {
		replace T_`i'hpa = 0 if T_`i'hpa ==.        //將沒氣溫改成0˙T，方便運算
	}

	forval i = 575(25)975 {
		local j = `i' + 25
		gen diff`i'_`j' = T_`i'hpa - T_`j'hpa       //計算相鄰兩氣壓層溫度差
		gen aa`i'_`j' = 1 if diff`i'_`j' > 100      //若相鄰兩氣壓層溫度差過大(>100)，即顯示其中一層必為開始有氣溫的第一層氣壓層
	}

	forval i = 600(25)975 {
		local j = `i' + 25
		replace level1 = T_`i'hpa if aa`i'_`j' == 1            
		replace lev1 =`i' if aa`i'_`j' == 1
	}
	replace level1 = T_1000hpa if level1 ==.
	replace lev1 = 1000 if lev1 ==.

	forval i = 575(25)950 {
		local j = `i' + 25
		local k = `i' + 50
		replace level2 = T_`i'hpa if aa`j'_`k' == 1                //找出開始有氣溫的第二層氣壓層
		replace lev2 = `i' if aa`j'_`k' == 1
	}
	replace level2 = T_975hpa if level2 ==.
	replace lev2 = 975 if lev2 ==.

	drop diff* aa*
	forval i = 575(25)1000 {
	replace T_`i'hpa=. if T_`i'hpa == 0 
	}

	save "$dir/working_data/dta/GH`year'/GH`year'_v3.dta", replace
}

