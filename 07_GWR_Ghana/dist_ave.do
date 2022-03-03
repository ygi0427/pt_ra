
global dir = "D:/00_work/07_GWR_Ghana"

//算各區年平均pm25
use "$dir/working_data/pm25_with_distcode.dta", replace
bysort dist_code year: egen average_pm25 = mean(pm25)
save "$dir/working_data/ave.dta", replace

//groups, saving: 產生dta在do file所在資料夾
groups dist_code year average_pm25, show(none) saving(ave_table)
use "$dir/programs/ave_table.dta", replace
order dist_code year average_pm25
destring dist_code, replace
save "$dir/working_data/ave_table.dta", replace
