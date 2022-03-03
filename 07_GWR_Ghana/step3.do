/*==============================================================================
Step3:
append data to year
==============================================================================*/
global dir = "D:/00_work/07_GWR_Ghana"

foreach year in 2008{
	use "$dir/working_data/dta/GH`year'/GH`year'_2_1.dta", clear
	foreach month in 2{
		forvalue day = 2(1)29{
			append using "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta"
		}
	}
	
	foreach month in 1 3 5 7 8 10 12{
		forvalue day = 1(1)31{
			append using "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta"
		}
	}
			
	foreach month in 4 6 9 11{
		forvalue day = 1(1)30{
			append using "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta"
		}
	}		
	drop if latitude==.
	save "$dir/working_data/dta/GH`year'/GH`year'_v1.dta", replace
}

foreach year in 2009 2010 2011{
	use "$dir/working_data/dta/GH`year'/GH`year'_2_1.dta", clear
	foreach month in 2{
		forvalue day = 2(1)28{
			append using "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta"
		}
	}
	
	foreach month in 1 3 5 7 8 10 12{
		forvalue day = 1(1)31{
			append using "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta"
		}
	}
			
	foreach month in 4 6 9 11{
		forvalue day = 1(1)30{
			append using "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta"
		}
	}
	drop if latitude==.		
	save "$dir/working_data/dta/GH`year'/GH`year'_v1.dta", replace
}

