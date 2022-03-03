//separate data of each country


global dir = "D:/00_work/09_mental"


use "$dir/working_data/WHS_pollution_weather.dta", replace
gen country = ""
replace country = "Burkina Faso" if filename == "WHS-Burkina_F2.dta"
replace country = "Chad" if filename == "WHS-Chad_F2.dta"
replace country = "Comoros" if filename == "WHS-Comoros_F2.dta"
replace country = "Republic of Congo" if filename == "WHS-Congo_F2.dta"
replace country = "Côte d'Ivoire" if filename == "WHS-CotedIvoire_F2.dta"
//
replace country = "Ethiopia" if filename == "WHS-Ethiopia_F2.dta"
replace country = "Ghana" if filename == "WHS-Ghana_F2.dta"
replace country = "Kenya" if filename == "WHS-Kenya_F2.dta"
replace country = "Malawi" if filename == "WHS-Malawi_F2.dta"
replace country = "Mali" if filename == "WHS-Mali_F2.dta"
//
replace country = "Mauritania" if filename == "WHS-Mauritania_F2.dta"
replace country = "Namibia" if filename == "WHS-Namibia_F2.dta"
replace country = "Senegal" if filename == "WHS-Senegal_F2.dta"
replace country = "South Africa" if filename == "WHS-SouthAfrica_F2.dta"
replace country = "Swaziland" if filename == "WHS-Swaziland_F2.dta"
//
replace country = "Zambia" if filename == "WHS-Zambia_F2.dta"
replace country = "Zimbabwe" if filename == "WHS-Zimbabwe_F2.dta"
save "$dir/working_data/WHS_pollution_weather_withcon.dta", replace
