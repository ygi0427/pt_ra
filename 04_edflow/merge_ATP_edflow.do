//making the table importername exportername importercode exportercode year value


global dir = "D:/00_work/04_edflow"


use "$dir/working_data/edflow_finaldata.dta", replace

destring importercode, replace
destring exportercode, replace

rename importercode ifsimporter
rename exportercode ifsexporter

save "$dir/working_data/edflow_finaldata_m.dta", replace

use "$dir/working_data/comtrade_2004-2019_final_atp.dta", replace

merge m:1 ifsimporter ifsexporter year using "$dir/working_data/edflow_finaldata_m.dta"

save "$dir/working_data/comtrade_2004-2019_final_atp_m.dta", replace
