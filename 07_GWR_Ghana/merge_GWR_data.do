/*==============================================================================
 Program: merge_2007~2011_GWR_data.do
 Creator: Chien Hui Lin  
 Created: 2020/10
 Updated: 2021/01
 Purpose: 整理座標和pm25資料
=============================================================================*/

global dir = "D:/00_work/07_GWR_Ghana"

use "$dir/working_data/2007_pm25.dta", replace
merge 1:1 _n using "$dir/working_data/lon.dta"
drop _merge
merge 1:1 _n using "$dir/working_data/lat.dta"
drop _merge
keep if lon >= -3.5 & lon <= 1.5 //E+ W-
keep if lat >= 4.5 & lat <= 11.5 //N+ S-
gather pm25_2007, variable(year) value(pm25)
save "$dir/working_data/2007_pm25_plus.dta", replace

use "$dir/working_data/2008_pm25.dta", replace
merge 1:1 _n using "$dir/working_data/lon.dta"
drop _merge
merge 1:1 _n using "$dir/working_data/lat.dta"
drop _merge
keep if lon >= -3.5 & lon <= 1.5 //E+ W-
keep if lat >= 4.5 & lat <= 11.5 //N+ S-
gather pm25_2008, variable(year) value(pm25)
save "$dir/working_data/2008_pm25_plus.dta", replace

use "$dir/working_data/2009_pm25.dta", replace
merge 1:1 _n using "$dir/working_data/lon.dta"
drop _merge
merge 1:1 _n using "$dir/working_data/lat.dta"
drop _merge
keep if lon >= -3.5 & lon <= 1.5 //E+ W-
keep if lat >= 4.5 & lat <= 11.5 //N+ S-
gather pm25_2009, variable(year) value(pm25)
save "$dir/working_data/2009_pm25_plus.dta", replace

use "$dir/working_data/2010_pm25.dta", replace
merge 1:1 _n using "$dir/working_data/lon.dta"
drop _merge
merge 1:1 _n using "$dir/working_data/lat.dta"
drop _merge
keep if lon >= -3.5 & lon <= 1.5 //E+ W-
keep if lat >= 4.5 & lat <= 11.5 //N+ S-
gather pm25_2010, variable(year) value(pm25)
save "$dir/working_data/2010_pm25_plus.dta", replace

use "$dir/working_data/2011_pm25.dta", replace
merge 1:1 _n using "$dir/working_data/lon.dta"
drop _merge
merge 1:1 _n using "$dir/working_data/lat.dta"
drop _merge
keep if lon >= -3.5 & lon <= 1.5 //E+ W-
keep if lat >= 4.5 & lat <= 11.5 //N+ S-
gather pm25_2011, variable(year) value(pm25)
save "$dir/working_data/2011_pm25_plus.dta", replace

use "$dir/working_data/2007_pm25_plus.dta", replace
append using "$dir/working_data/2008_pm25_plus.dta"
append using "$dir/working_data/2009_pm25_plus.dta"
append using "$dir/working_data/2010_pm25_plus.dta"
append using "$dir/working_data/2011_pm25_plus.dta"

save "$dir/working_data/2007~2011_GWR_Ghana_pm25_temp.dta", replace

use "$dir/working_data/2007~2011_GWR_Ghana_pm25_temp.dta" , replace
//將PM2.5 由7個變數，變成 year、PM2.5 兩個變數

forvalue y = 2006(1)2011{
	replace year = "`y'" if year == "pm25_`y'" 
}
destring year, replace


//製作要用來merge用變數
gen lon_1000 = lon*1000 
gen lat_1000 = lat*1000 
replace lon_1000 = trunc( lon_1000)
replace lat_1000 = trunc( lat_1000 )

tostring lon_1000, replace
tostring lat_1000, replace

foreach i in 1 2 3 4 5 6{
	gen last_lon_`i' = substr( lon_1000, `i', 1)
	gen last_lat_`i' = substr( lat_1000, `i', 1)
} 

//如果該經緯度個位數為4，則將其取代改成為5
foreach v in last_lon last_lat{
	replace `v'_6 = "5" if `v'_6 == "4"
	replace `v'_5 = "5" if `v'_5 == "4" & `v'_6 == ""
	replace `v'_4 = "5" if `v'_4 == "4" & `v'_6 == "" & `v'_5 == ""
	replace `v'_3 = "5" if `v'_3 == "4" & `v'_6 == "" & `v'_5 == "" & `v'_4 == ""
	replace `v'_2 = "5" if `v'_2 == "4" & `v'_6 == "" & `v'_5 == "" & `v'_4 == "" & `v'_3 == ""
	replace `v'_1 = "5" if `v'_1 == "4" & `v'_6 == "" & `v'_5 == "" & `v'_4 == "" & `v'_3 == "" & `v'_2 == ""
}
gen lon_1000_str = last_lon_1 + last_lon_2 + last_lon_3 + last_lon_4 + last_lon_5 + last_lon_6
gen lat_1000_str = last_lat_1 + last_lat_2 + last_lat_3 + last_lat_4 + last_lat_5 + last_lat_6

/*
gen check = strmatch( lon_1000, lon_1000_str )
browse if check == 0

如果check為0，lon_1000的個位數一定為4
*/
drop last_lon* last_lat*

save "$dir/working_data/2007~2011_GWR_Ghana_pm25_grid-year.dta", replace


