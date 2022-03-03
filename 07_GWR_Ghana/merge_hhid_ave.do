//separate data of each country


global dir = "D:/00_work/07_GWR_Ghana"

use "$dir/raw_data/SEC0.dta", replace

rename id2 dist_code
keep hhno dist_code day month year
gen i_month = month
gen i_year = year

//*****************當年y**********************//
********************
* 合併該(y)年PM2.5 *
********************
merge m:1 year dist_code using "$dir/working_data/ave_table.dta"
keep if _merge == 3
drop _merge
************************
* 合併前一年(y-1)PM2.5 *
************************
//先將名稱更改
rename average_pm25 pm25_this_year //2010
rename year this_year //2010

//再將前一年y-1變數加入
gen year = this_year - 1 //2009
merge m:1 year dist_code using "$dir/working_data/ave_table.dta"
keep if _merge == 3
drop _merge
//將名稱更改
rename average_pm25      pm25_last_year //2009

gen pm25_this_year_m = pm25_this_year*(month/12) + pm25_last_year*((12-month)/12)
drop pm25_this_year pm25_last_year month year this_year

////////last
foreach i in 1 2 3 4 5 6{ 
	gen month = i_month - `i'
	gen year = i_year
	replace year = i_year - 1 if month < 1
	replace month = i_month - `i' + 12 if month < 1

	merge m:1 year dist_code using "$dir/working_data/ave_table.dta"
	keep if _merge == 3
	drop _merge
	rename average_pm25 pm25_this_year 
	rename year this_year 
	gen year = this_year - 1
	merge m:1 year dist_code using "$dir/working_data/ave_table.dta"
	keep if _merge == 3
	drop _merge
	rename average_pm25      pm25_last_year 
	gen pm25_lg`i' = pm25_this_year*(month/12) + pm25_last_year*((12-month)/12)
	drop pm25_this_year pm25_last_year month year this_year
}
/////////next
foreach i in 1 2 3 4 5 6{ 
	gen month = i_month + `i'
	gen year = i_year
	replace year = i_year + 1 if month > 12
	replace month = i_month + `i' - 12 if month > 12

	merge m:1 year dist_code using "$dir/working_data/ave_table.dta"
	keep if _merge == 3
	drop _merge
	rename average_pm25 pm25_this_year 
	rename year this_year 
	gen year = this_year - 1
	merge m:1 year dist_code using "$dir/working_data/ave_table.dta"
	keep if _merge == 3
	drop _merge
	rename average_pm25      pm25_last_year 
	gen pm25_ld`i' = pm25_this_year*(month/12) + pm25_last_year*((12-month)/12)
	drop pm25_this_year pm25_last_year month year this_year
}

rename i_year year
rename i_month month 
rename pm25_this_year_m pm25

order hhno dist_code year month day pm25 pm25_lg* pm25_ld*
sort hhno dist_code year month day 

save "$dir/working_data/final_pm.dta", replace

