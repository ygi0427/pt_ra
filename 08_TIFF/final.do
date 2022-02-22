
global dir = "/Volumes/My Passport/08_TIFF"

//check裡面沒point的township
use "$dir/working_data/points_in_township/2021_1.dta", replace
merge m:1 towncode using "$dir/working_data/tw_shp_table.dta"
keep if _merge == 2
drop _merge 
gen small_t = 1
save "$dir/working_data/NOpoint_town.dta", replace

foreach year in 2012 {
	forvalue month = 4(1)12{
		//有point的
		use "$dir/working_data/points_in_township/`year'_`month'.dta", replace
		merge m:1 towncode using "$dir/working_data/tw_shp_table.dta"
		keep if _merge == 3
		drop _merge
		save "$dir/working_data/merging/`year'_`month'_in.dta", replace
		
		//沒的另外處理（每處每天一個點）
		use "$dir/working_data/NOpoint_town.dta", replace
		drop lat lon value round_lat round_lon year month

		gen round_lat = round(center_lat,0.05)
		gen round_lon = round(center_lon,0.05)
	
		merge m:1 round_lat round_lon using "$dir/working_data/points_in_township/`year'_`month'.dta"
		keep if _merge == 3
		drop _merge
		save "$dir/working_data/merging/`year'_`month'_no.dta", replace
		

		
		//所有點
		use "$dir/working_data/merging/`year'_`month'_in.dta", replace
		append using "$dir/working_data/merging/`year'_`month'_no.dta"
		bysort countyname townname : egen townavg = mean(value)
		order countyname townname lat lon townavg value 
		rename value pointvalue
		save "$dir/working_data/final/`year'_`month'_everypoints.dta", replace
		
		//township
		bysort countyname townname : keep if _n == 1
		drop lat lon pointvalue
		save "$dir/working_data/final/`year'_`month'_bytownship.dta", replace
	}
}

foreach year in 2013 2014 2015 2016 2017 2018 2019 2020 {
	forvalue month = 1(1)12{
		//有point的
		use "$dir/working_data/points_in_township/`year'_`month'.dta", replace
		merge m:1 towncode using "$dir/working_data/tw_shp_table.dta"
		keep if _merge == 3
		drop _merge
		save "$dir/working_data/merging/`year'_`month'_in.dta", replace
		
		//沒的另外處理（每處每天一個點）
		use "$dir/working_data/NOpoint_town.dta", replace
		drop lat lon value round_lat round_lon year month

		gen round_lat = round(center_lat,0.05)
		gen round_lon = round(center_lon,0.05)
	
		merge m:1 round_lat round_lon using "$dir/working_data/points_in_township/`year'_`month'.dta"
		keep if _merge == 3
		drop _merge
		save "$dir/working_data/merging/`year'_`month'_no.dta", replace
		
		//所有點
		use "$dir/working_data/merging/`year'_`month'_in.dta", replace
		append using "$dir/working_data/merging/`year'_`month'_no.dta"
		bysort countyname townname : egen townavg = mean(value)
		order countyname townname lat lon townavg value 
		rename value pointvalue
		save "$dir/working_data/final/`year'_`month'_everypoints.dta", replace
		
		//township
		bysort countyname townname : keep if _n == 1
		drop lat lon pointvalue
		save "$dir/working_data/final/`year'_`month'_bytownship.dta", replace
	}
}

foreach year in 2021 {
	forvalue month = 1(1)7{
		//有point的
		use "$dir/working_data/points_in_township/`year'_`month'.dta", replace
		merge m:1 towncode using "$dir/working_data/tw_shp_table.dta"
		keep if _merge == 3
		drop _merge
		save "$dir/working_data/merging/`year'_`month'_in.dta", replace
		
		//沒的另外處理（每處每天一個點）
		use "$dir/working_data/NOpoint_town.dta", replace
		drop lat lon value round_lat round_lon year month

		gen round_lat = round(center_lat,0.05)
		gen round_lon = round(center_lon,0.05)
	
		merge m:1 round_lat round_lon using "$dir/working_data/points_in_township/`year'_`month'.dta"
		keep if _merge == 3
		drop _merge
		save "$dir/working_data/merging/`year'_`month'_no.dta", replace
		
		//所有點
		use "$dir/working_data/merging/`year'_`month'_in.dta", replace
		append using "$dir/working_data/merging/`year'_`month'_no.dta"
		bysort countyname townname : egen townavg = mean(value)
		order countyname townname lat lon townavg value 
		rename value pointvalue
		save "$dir/working_data/final/`year'_`month'_everypoints.dta", replace
		
		//township
		bysort countyname townname : keep if _n == 1
		drop lat lon pointvalue
		save "$dir/working_data/final/`year'_`month'_bytownship.dta", replace
	}
}

	
