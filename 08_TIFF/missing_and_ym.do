
global dir = "/Volumes/My Passport/08_TIFF"

//round and replace missing

foreach year in 2012 {
	foreach month in 04 05 06 07 08 09 10 11 12{
		use "$dir/working_data/tiffdta/`year'`month'.dta", replace
		gen round_lat = round(lat,0.05)
		gen round_lon = round(lon,0.05)
		replace value = . if value < 0
		gen year = `year'
		gen month = `month'
		save "$dir/working_data/tiff_replaced/`year'`month'.dta", replace
	}
}

foreach year in 2013 2014 2015 2016 2017 2018 2019 2020 {
	foreach month in 01 02 03 04 05 06 07 08 09 10 11 12{
		use "$dir/working_data/tiffdta/`year'`month'.dta", replace
		gen round_lat = round(lat,0.05)
		gen round_lon = round(lon,0.05)
		replace value = . if value < 0
		gen year = `year'
		gen month = `month'
		save "$dir/working_data/tiff_replaced/`year'`month'.dta", replace
	}
}

foreach year in 2021 {
	foreach month in 01 02 03 04 05 06 07{
		use "$dir/working_data/tiffdta/`year'`month'.dta", replace
		gen round_lat = round(lat,0.05)
		gen round_lon = round(lon,0.05)
		replace value = . if value < 0
		gen year = `year'
		gen month = `month'
		save "$dir/working_data/tiff_replaced/`year'`month'.dta", replace
	}
}


