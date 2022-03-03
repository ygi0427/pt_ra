
global dir = "D:/00_work/07_GWR_Ghana"

use "$dir/working_data/final_pm.dta", replace
merge 1:1 hhno using "$dir/raw_data/aggregated_expenditure.dta"
keep if _merge == 3
drop _merge
save "$dir/working_data/household.dta", replace

use "$dir/raw_data/S1D.dta", replace
merge m:1 hhno using "$dir/working_data/household.dta"
keep if _merge == 3
drop _merge
rename s1d_1 sex
rename s1d_2 relationship_head
rename s1d_3iii year_of_birth
rename s1d_4i age
rename s1d_14 region_of_birth
rename s1d_16 ethnic_group
gen female = .
replace female = 0 if sex == 1
replace female = 1 if sex == 2

merge m:1 hhno hhmid using "$dir/raw_data/S10AI.dta"
keep if _merge == 3
drop _merge
gen K10 = s10ai_a1 + s10ai_a2 + s10ai_a3 + s10ai_a4 + s10ai_a5 + s10ai_a6 + s10ai_a7 + s10ai_a8 + s10ai_a9 + s10ai_a10

gen severe_distress = 0
replace severe_distress = 1 if K10 >= 30
replace severe_distress = . if K10 == .

keep hhno hhmid dist_code year month day pm25 pm25_lg* pm25_ld* sex female relationship_head year_of_birth age region_of_birth ethnic_group avg_monthly_exp_overall K10 severe_distress 
order hhno hhmid dist_code year month day pm25 pm25_lg* pm25_ld* sex female relationship_head ethnic_group region_of_birth year_of_birth age avg_monthly_exp_overall K10 severe_distress 
sort hhno hhmid dist_code year month day 

save "$dir/working_data/mental-Ghana_final.dta", replace

