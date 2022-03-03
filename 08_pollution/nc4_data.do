/*================================================================================
 Program: 
 Creator: Wang  
 Created: 2020/3/30
 Updated: Lin
 Purpose: 
==================================================================================*/

set more off
global dir = "D:/00_work/08_pollution"
clear

*********
* step1 *
*********

//生成 時間、經緯度，要拿來對上NC4產生的資料
//23*36*24=19872
import excel "$dir/rawdata/sheet1.xlsx", sheet("Sheet1") firstrow clear

//121*156=18876->23*36=828
gen time = floor((num-1)/828)

//lon橫跨121
gen temp = floor((num-1)/23) 

//lat start: -37.5
gen lat = temp*0.5 + (-12) - 36*time*0.5

//lat start:-20.625, lon橫跨121
gen lon = (num-1)*0.625 + (28.75) - temp*0.625*23

drop temp

save "$dir/working_data/sheet1.dta", replace


*********
* step2 *
*********

// 將變數重新命名、生成年月日變數，並將每天資料存成dta檔
// 將時間、經緯度放入
// 生成upm25、uSO2、ppbSO2 這三個變數

foreach year in 2008 2009 2010 2011 2012 2013 2014 2015{
	foreach month in 1 3 5 7 8 10 12{
		forvalue day = 1(1)31{
			import excel "$dir/working_data/excel/`year'/`year'_`month'_`day'.xlsx", sheet("Sheet1") firstrow clear
		
			drop A
			rename B SSSMASS25
			rename C OCSMASS
			rename D BCSMASS
			rename E SO4SMASS
			rename F DUSMASS25
			rename G SO2SMASS

			label variable SSSMASS25 "Sea Salt Surface Mass Concentration - PM 2.5" 
			label variable OCSMASS "Organic Carbon Surface Mass Concentration __ENSEMBLE__"
			label variable BCSMASS "Black Carbon Surface Mass Concentration"
			label variable SO4SMASS "SO4 Surface Mass Concentration __ENSEMBLE__"
			label variable DUSMASS25 "Dust Surface Mass Concentration - PM 2.5"
			label variable SO2SMASS "SO2 Surface Mass Concentration __ENSEMBLE__"

			gen PM25    = DUSMASS25 + SSSMASS25 + BCSMASS + 1.6*OCSMASS + 1.375*SO4SMASS //1.6是MERRA-2使用的
			gen PM25_v2 = DUSMASS25 + SSSMASS25 + BCSMASS + 1.4*OCSMASS + 1.375*SO4SMASS //1.4是MERRA-1使用的
			
			label variable PM25 "units: kg/m^3"
			
			gen year =`year'
			gen month =`month'
			gen day = `day'
			
			egen num=fill(1 2)
			merge 1:1 num using "$dir/working_data/sheet1.dta"
			drop _merge
			
			gen upm25  = PM25*10^9
			gen uSO2   = SO2SMASS*10^9
			gen ppbSO2 = uSO2*22.4/64
			
			label var upm25 "unit: ug/m^3"
			label var uSO2 "unit: ug/m^3"
			label var ppbSO2 "unit: ppb"
			
			drop SSSMASS25 OCSMASS BCSMASS SO4SMASS SO2SMASS  DUSMASS25 num
			
			save "$dir/working_data/dta/`year'/`year'_`month'_`day'.dta",replace
		}	
	}
	foreach month in 4 6 9 11{
		forvalue day = 1(1)30{
			import excel "$dir/working_data/excel/`year'/`year'_`month'_`day'.xlsx", sheet("Sheet1") firstrow clear
		
			drop A
			rename B SSSMASS25
			rename C OCSMASS
			rename D BCSMASS
			rename E SO4SMASS
			rename F DUSMASS25
			rename G SO2SMASS

			label variable SSSMASS25 "Sea Salt Surface Mass Concentration - PM 2.5" 
			label variable OCSMASS "Organic Carbon Surface Mass Concentration __ENSEMBLE__"
			label variable BCSMASS "Black Carbon Surface Mass Concentration"
			label variable SO4SMASS "SO4 Surface Mass Concentration __ENSEMBLE__"
			label variable DUSMASS25 "Dust Surface Mass Concentration - PM 2.5"
			label variable SO2SMASS "SO2 Surface Mass Concentration __ENSEMBLE__"

			gen PM25    = DUSMASS25 + SSSMASS25 + BCSMASS + 1.6*OCSMASS + 1.375*SO4SMASS //1.6是MERRA-2使用的
			gen PM25_v2 = DUSMASS25 + SSSMASS25 + BCSMASS + 1.4*OCSMASS + 1.375*SO4SMASS //1.4是MERRA-1使用的
			
			label variable PM25 "units: kg/m^3"
			
			gen year =`year'
			gen month =`month'
			gen day = `day'
			
			egen num=fill(1 2)			
			merge 1:1 num using "$dir/working_data/sheet1.dta"
			drop _merge
 
			gen upm25  = PM25*10^9
			gen uSO2   = SO2SMASS*10^9
			gen ppbSO2 = uSO2*22.4/64

			drop SSSMASS25 OCSMASS BCSMASS SO4SMASS SO2SMASS  DUSMASS25 num
			
			save "$dir/working_data/dta/`year'/`year'_`month'_`day'.dta",replace
		}	
	}
	foreach month in 2 {
		if mod(`year',4) != 0 {
			forvalue day = 1(1)28{
				import excel "$dir/working_data/excel/`year'/`year'_`month'_`day'.xlsx", sheet("Sheet1") firstrow clear
		
				drop A
				rename B SSSMASS25
				rename C OCSMASS
				rename D BCSMASS
				rename E SO4SMASS
				rename F DUSMASS25
				rename G SO2SMASS

				label variable SSSMASS25 "Sea Salt Surface Mass Concentration - PM 2.5" 
				label variable OCSMASS "Organic Carbon Surface Mass Concentration __ENSEMBLE__"
				label variable BCSMASS "Black Carbon Surface Mass Concentration"
				label variable SO4SMASS "SO4 Surface Mass Concentration __ENSEMBLE__"
				label variable DUSMASS25 "Dust Surface Mass Concentration - PM 2.5"
				label variable SO2SMASS "SO2 Surface Mass Concentration __ENSEMBLE__"

				gen PM25    = DUSMASS25 + SSSMASS25 + BCSMASS + 1.6*OCSMASS + 1.375*SO4SMASS //1.6是MERRA-2使用的
				gen PM25_v2 = DUSMASS25 + SSSMASS25 + BCSMASS + 1.4*OCSMASS + 1.375*SO4SMASS //1.4是MERRA-1使用的
			
				label variable PM25 "units: kg/m^3"
			
				gen year =`year'
				gen month =`month'
				gen day = `day'
			
				egen num=fill(1 2)			
				merge 1:1 num using "$dir/working_data/sheet1.dta"
				drop _merge

				gen upm25  = PM25*10^9
				gen uSO2   = SO2SMASS*10^9
				gen ppbSO2 = uSO2*22.4/64

				drop SSSMASS25 OCSMASS BCSMASS SO4SMASS SO2SMASS  DUSMASS25 num
			
				save "$dir/working_data/dta/`year'/`year'_`month'_`day'.dta",replace
			}
		}
		if mod(`year',4) == 0 {
			forvalue day = 1(1)29 {
				import excel "$dir/working_data/excel/`year'/`year'_`month'_`day'.xlsx", sheet("Sheet1") firstrow clear
		
				drop A
				rename B SSSMASS25
				rename C OCSMASS
				rename D BCSMASS
				rename E SO4SMASS
				rename F DUSMASS25
				rename G SO2SMASS

				label variable SSSMASS25 "Sea Salt Surface Mass Concentration - PM 2.5" 
				label variable OCSMASS "Organic Carbon Surface Mass Concentration __ENSEMBLE__"
				label variable BCSMASS "Black Carbon Surface Mass Concentration"
				label variable SO4SMASS "SO4 Surface Mass Concentration __ENSEMBLE__"
				label variable DUSMASS25 "Dust Surface Mass Concentration - PM 2.5"
				label variable SO2SMASS "SO2 Surface Mass Concentration __ENSEMBLE__"

				gen PM25    = DUSMASS25 + SSSMASS25 + BCSMASS + 1.6*OCSMASS + 1.375*SO4SMASS //1.6是MERRA-2使用的
				gen PM25_v2 = DUSMASS25 + SSSMASS25 + BCSMASS + 1.4*OCSMASS + 1.375*SO4SMASS //1.4是MERRA-1使用的
			
				label variable PM25 "units: kg/m^3"
			
				gen year =`year'
				gen month =`month'
				gen day = `day'
			
				egen num=fill(1 2)			
				merge 1:1 num using "$dir/working_data/sheet1.dta"
				drop _merge

				gen upm25  = PM25*10^9
				gen uSO2   = SO2SMASS*10^9
				gen ppbSO2 = uSO2*22.4/64

				drop SSSMASS25 OCSMASS BCSMASS SO4SMASS SO2SMASS  DUSMASS25 num
			
				save "$dir/working_data/dta/`year'/`year'_`month'_`day'.dta",replace
			}
		}	
	}	
}


*********
* step3 *
*********

// 將2001~2005年每年的資料 append 起來，並計算 pm2.5 年、月、日平均值
foreach year in  2008 2009 2010 2011 2012 2013 2014 2015{
	if mod(`year',4) == 0 {	
		use "$dir/working_data/dta/`year'/`year'_2_1.dta", clear
	
		foreach month in 2{
			forvalue day = 2(1)29{
				append using "$dir/working_data/dta/`year'/`year'_`month'_`day'.dta"
			}
		}	
		foreach month in 1 3 5 7 8 10 12 {
			forvalue day = 1(1)31{
				append using "$dir/working_data/dta/`year'/`year'_`month'_`day'.dta"
			}
		}	
		foreach month in 4 6 9 11 {
			forvalue day = 1(1)30{
				append using "$dir/working_data/dta/`year'/`year'_`month'_`day'.dta"
			}
		}
	
		bysort year month day: egen day_avg_pm25    = mean(upm25)
		bysort year month day: egen day_avg_pm25_v2 = mean(PM25_v2*10^9)
		bysort year month day: egen day_avg_ppbSO2  = mean(ppbSO2)
		
		bysort lat lon year month day: keep if _n == 1
		drop time PM25 PM25_v2 upm25 uSO2 ppbSO2
	
		save "$dir/working_data/dta/`year'/`year'_pm25_and_so2.dta", replace
	}
	
	if mod(`year',4) != 0 {	
		use "$dir/working_data/dta/`year'/`year'_2_1.dta", clear
	
		foreach month in 2{
			forvalue day = 2(1)28{
				append using "$dir/working_data/dta/`year'/`year'_`month'_`day'.dta"
			}
		}	
		foreach month in 1 3 5 7 8 10 12 {
			forvalue day = 1(1)31{
				append using "$dir/working_data/dta/`year'/`year'_`month'_`day'.dta"
			}
		}	
		foreach month in 4 6 9 11 {
			forvalue day = 1(1)30{
				append using "$dir/working_data/dta/`year'/`year'_`month'_`day'.dta"
			}
		}
	
		bysort year month day: egen day_avg_pm25    = mean(upm25)
		bysort year month day: egen day_avg_pm25_v2 = mean(PM25_v2*10^9)
		bysort year month day: egen day_avg_ppbSO2  = mean(ppbSO2)
		
		bysort lat lon year month day: keep if _n == 1
		drop time PM25 PM25_v2 upm25 uSO2 ppbSO2
	
		save "$dir/working_data/dta/`year'/`year'_pm25_and_so2.dta", replace
	}
}

//將 2001~2005年資料 append 起來
use "$dir/working_data/dta/2008/2008_pm25_and_so2.dta", replace
forvalue year = 2009(1)2015{
	append using "$dir/working_data/dta/`year'/`year'_pm25_and_so2.dta"
}

save "$dir/working_data/2008~2015_pm25_and_so2_daily.dta", replace
