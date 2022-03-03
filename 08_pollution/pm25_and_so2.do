/*================================================================================
 Program: pm25_and_so2.do
 Creator: Wang  
 Created: 2020/3/30
 Updated: Lin
 Purpose: 
==================================================================================*/

set more off
global dir = "D:/00_work/08_pollution"
clear

use "$dir/working_data/KE_distcoor.dta", replace
merge m:1 lat lon year month day using "$dir/working_data/all_pm25_and_so2.dta"

/*
    Result                           # of obs.
    -----------------------------------------
    not matched                     1,808,844
        from master                         0  (_merge==1)
        from using                  1,808,844  (_merge==2)

    matched                             3,399  (_merge==3)
    -----------------------------------------
*/

keep if _merge == 3
drop _merge
bysort lat lon year month day dist : keep if _n == 1
save "$dir/working_data/KE_pm25_and_so2.dta", replace


use "$dir/working_data/TZ_distcoor.dta", replace
merge m:1 lat lon year month day using "$dir/working_data/all_pm25_and_so2.dta"

/*
    Result                           # of obs.
    -----------------------------------------
    not matched                     1,809,652
        from master                         0  (_merge==1)
        from using                  1,809,652  (_merge==2)

    matched                             2,425  (_merge==3)
    -----------------------------------------
*/

keep if _merge == 3
drop _merge
bysort lat lon year month day dist : keep if _n == 1
save "$dir/working_data/TZ_pm25_and_so2.dta", replace

use "$dir/working_data/UG_distcoor.dta", replace
merge m:1 lat lon year month day using "$dir/working_data/all_pm25_and_so2.dta"

/*
    Result                           # of obs.
    -----------------------------------------
    not matched                     1,809,931
        from master                         0  (_merge==1)
        from using                  1,809,931  (_merge==2)

    matched                             1,939  (_merge==3)
    -----------------------------------------
*/

keep if _merge == 3
drop _merge
bysort lat lon year month day dist : keep if _n == 1
save "$dir/working_data/UG_pm25_and_so2.dta", replace
