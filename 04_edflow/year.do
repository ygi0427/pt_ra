//making the table importername exportername importercode exportercode year value


global dir = "D:/00_work/04_edflow"


use "$dir/working_data/table1.dta", replace




//use "gather" to make the column "year"
gather y*, value(year) //, variable(lat_temp) value(month)
drop variable
sort cty1 cty2 year
rename cty1 importercode
rename cty2 exportercode

save "$dir/working_data/table_with_year.dta", replace
