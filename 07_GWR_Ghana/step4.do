/*==============================================================================
Step4:
產生各氣壓下的溫度
==============================================================================*/
set more off
global dir = "D:/00_work/07_GWR_Ghana"

foreach year in 2008 2009 2010 2011{
	use "$dir/working_data/dta/GH`year'/GH`year'_v1.dta", clear
	reshape wide T, i(district mon date time) j(lev)
	
	forval i = 575(25)1000{
		rename T`i' T_`i'hpa
	}
	
	order district parent lat lon mon date time T_575hpa T_600hpa T_625hpa T_650hpa T_675hpa ///
	T_700hpa T_725hpa T_750hpa T_775hpa T_800hpa T_825hpa T_850hpa T_875hpa T_900hpa T_925hpa T_950hpa T_975hpa T_1000hpa
	
	save "$dir/working_data/dta/GH`year'/GH`year'_v2.dta", replace
}
