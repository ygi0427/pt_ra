/*==============================================================================
Step2:
1.將Step2做出的資料用 lat lon merge到districts
2.產生日、月變數
==============================================================================*/
global dir = "D:/00_work/07_GWR_Ghana"
set more off

foreach year in 2009 2010 2011{
	foreach month in 1 3 5 7 8 10 12{
		forvalue day = 1(1)31{
			use "$dir/working_data/dist_coordinates.dta",clear
			joinby lat lon using "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", unmatched(both)
			keep if lat !=.
			drop _merge
			label variable time "0=00:00, 1=06:00, 2=12:00, 3=18:00"
			gen date = `day'
			gen mon  = `month'
			save "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", replace
		}
	}
	
	foreach month in 4 6 9 11{
		forvalue day = 1(1)30{
			use "$dir/working_data/dist_coordinates.dta",clear
			joinby lat lon using "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", unmatched(both)
			keep if lat !=.
			drop _merge
			label variable time "0=00:00, 1=06:00, 2=12:00, 3=18:00"
			gen date = `day'
			gen mon  = `month'
			save "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", replace	
		}
	}
		
	foreach month in 2{
		forvalue day = 1(1)28{
			use "$dir/working_data/dist_coordinates.dta",clear
			joinby lat lon using "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", unmatched(both)
			keep if lat !=.
			drop _merge
			label variable time "0=00:00, 1=06:00, 2=12:00, 3=18:00"
			gen date = `day'
			gen mon  = `month'
			save "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", replace
		}
	}
}
foreach year in 2008{
	foreach month in 1 3 5 7 8 10 12{
		forvalue day = 1(1)31{
			use "$dir/working_data/dist_coordinates.dta",clear
			joinby lat lon using "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", unmatched(both)
			keep if lat !=.
			drop _merge
			label variable time "0=00:00, 1=06:00, 2=12:00, 3=18:00"
			gen date = `day'
			gen mon  = `month'
			save "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", replace
		}
	}
	
	foreach month in 4 6 9 11{
		forvalue day = 1(1)30{
			use "$dir/working_data/dist_coordinates.dta",clear
			joinby lat lon using "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", unmatched(both)
			keep if lat !=.
			drop _merge
			label variable time "0=00:00, 1=06:00, 2=12:00, 3=18:00"
			gen date = `day'
			gen mon  = `month'
			save "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", replace	
		}
	}
		
	foreach month in 2{
		forvalue day = 1(1)29{
			use "$dir/working_data/dist_coordinates.dta",clear
			joinby lat lon using "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", unmatched(both)
			keep if lat !=.
			drop _merge
			label variable time "0=00:00, 1=06:00, 2=12:00, 3=18:00"
			gen date = `day'
			gen mon  = `month'
			save "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", replace
		}
	}
}

