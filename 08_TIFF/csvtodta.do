global dir = "/Volumes/My Passport/08_TIFF"

foreach year in 2012 {
	foreach month in 04 05 06 07 08 09 10 11 12{
		import delimited "$dir/working_data/tiffcsv/`year'`month'_tiff.csv", clear 
		save "$dir/working_data/tiffdta/`year'`month'.dta", replace
	}
}

foreach year in 2013 2014 2015 2016 2017 2018 2019 2020 {
	foreach month in 01 02 03 04 05 06 07 08 09 10 11 12{
		import delimited "$dir/working_data/tiffcsv/`year'`month'_tiff.csv", clear 
		save "$dir/working_data/tiffdta/`year'`month'.dta", replace
	}
}

foreach year in 2021 {
	foreach month in 01 02 03 04 05 06 07{
		import delimited "$dir/working_data/tiffcsv/`year'`month'_tiff.csv", clear 
		save "$dir/working_data/tiffdta/`year'`month'.dta", replace
	}
}
