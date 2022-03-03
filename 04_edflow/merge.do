//making the table importername exportername importercode exportercode year value


global dir = "D:/00_work/04_edflow"


use "$dir/working_data/edflow.dta", replace

merge 1:1 importername exportername year using "$dir/working_data/table_with_year.dta" 

sort importername exportername importercode exportercode year
drop _merge
order importername exportername importercode exportercode year edflow

save "$dir/working_data/edflow_finaldata.dta", replace

