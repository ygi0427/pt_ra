/*================================================================================
 Program: Africa_pm25_and_so2_2001~2005.do
 Creator: Wang  
 Created: 2020/3/30
 Updated: Lin
 Purpose: 
==================================================================================*/

set more off
global dir = "D:/00_work/08_pollution"
clear

***************************************
* 保留 WHS 所在的 grid 資料，其餘刪除 *
***************************************
use "$dir/working_data/KEcoor.dta", replace
gen lat = round(latitude/0.5)*0.5           //round()四捨五入
gen lon = round(longitude/0.625)*0.625
replace ADMIN_NAME = "Baringo Central" if ADMIN_NAME == "Baringo"
replace ADMIN_NAME = "Bureti" if ADMIN_NAME == "Buret"
replace ADMIN_NAME = "Garbatula" if ADMIN_NAME == "Garba Tulla"
replace ADMIN_NAME = "Kajiado Central" if ADMIN_NAME == "Kaijiado Central"
replace ADMIN_NAME = "Kajiado North" if ADMIN_NAME == "Kaijiado North"
replace ADMIN_NAME = "Kiambu" if ADMIN_NAME == "Kiambu (Kiambaa)"
//Limuru served as the capital of Kiambu West District which was formerly part of Kiambu District.
replace ADMIN_NAME = "Limuru" if ADMIN_NAME == "Kiambu West" 
replace ADMIN_NAME = "Loitokitok" if ADMIN_NAME == "Loitoktok" 
replace ADMIN_NAME = "Mt Elgon" if ADMIN_NAME == "Mt. Elgon"
replace ADMIN_NAME = "Mutomo" if ADMIN_NAME == "Kitui South (Mutomo)"
//Kilindini有兩個座標(相近) drop一個
drop if (latitude == -3.972025)
save "$dir/working_data/KE_grid.dta", replace

use "$dir/working_data/KE-Dates+DistID.dta", replace
split date,parse("/") gen(time)
rename time1 day
rename time2 month
rename time3 year
destring day, replace
destring month, replace
destring year, replace
rename id_districtName ADMIN_NAME
drop if year > 2014
drop if year < 2009
drop if month < 1
drop if month > 12
drop if day < 1
drop if day > 31
drop if (month == 4 & day > 30)
drop if (month == 6 & day > 30)
drop if (month == 9 & day > 30)
drop if (month == 11 & day > 30)
drop if (month == 2 & day > 29)
drop if (month == 2 & day > 28 & year != 2012)
merge m:1 ADMIN_NAME using "$dir/working_data/KE_grid.dta"
drop _merge

replace latitude = 0.05 if ADMIN_NAME == "Meru Central" //(0.05,37.63)
replace longitude = 37.63 if ADMIN_NAME == "Meru Central" 
replace latitude = -4.05 if ADMIN_NAME == "Mombasa" //(-4.05,39.67)
replace longitude = 39.67 if ADMIN_NAME == "Mombasa"

replace lat = round(0.05/0.5)*0.5 if ADMIN_NAME == "Meru Central" 
replace lon = round(37.63/0.625)*0.625 if ADMIN_NAME == "Meru Central" 
replace lat = round(-4.05/0.5)*0.5 if ADMIN_NAME == "Mombasa" 
replace lon = round(39.67/0.625)*0.625 if ADMIN_NAME == "Mombasa"

rename ADMIN_NAME dist
drop date
drop if day ==.

save "$dir/working_data/KE_distcoor.dta", replace


use "$dir/working_data/TZcoor.dta", replace
gen lat = round(latitude/0.5)*0.5           //round()四捨五入
gen lon = round(longitude/0.625)*0.625
//mjini=town vijijini=rural
replace ADMIN_NAME = "Arusha" if ADMIN_NAME == "Arusha Mjini"
replace ADMIN_NAME = "Arusha Rural" if ADMIN_NAME == "Arusha Vijijini"
replace ADMIN_NAME = "Babati Urban" if ADMIN_NAME == "Babati Mjini"
replace ADMIN_NAME = "Babati Rural" if ADMIN_NAME == "Babati Vijijini"
replace ADMIN_NAME = "Bukoba Urban" if ADMIN_NAME == "Bukoba Mjini"
replace ADMIN_NAME = "Bukoba Rural" if ADMIN_NAME == "Bukoba Vijijini"
replace ADMIN_NAME = "Dodoma Urban" if ADMIN_NAME == "Dodoma Mjini"
replace ADMIN_NAME = "Iringa Rural" if ADMIN_NAME == "Iringa Vijijini"
replace ADMIN_NAME = "Iringa Urban" if ADMIN_NAME == "Iringa Mjini"
replace ADMIN_NAME = "Kahama" if ADMIN_NAME == "Kahama Township Authority"
replace ADMIN_NAME = "Kibaha Rural" if ADMIN_NAME == "Kibaha"
replace ADMIN_NAME = "Kibaha Urban" if ADMIN_NAME == "Kibaha Mjini"
replace ADMIN_NAME = "Kigoma Rural" if ADMIN_NAME == "Kigoma Vijijini"
replace ADMIN_NAME = "Kigoma Urban" if ADMIN_NAME == "Kigoma Mjini"
replace ADMIN_NAME = "Korogwe Urban" if ADMIN_NAME == "Korogwe Mjini"
replace ADMIN_NAME = "Lindi Rural" if ADMIN_NAME == "Lindi Vijijini"
replace ADMIN_NAME = "Lindi Urban" if ADMIN_NAME == "Lindi Mjini"
replace ADMIN_NAME = "Mbeya Rural" if ADMIN_NAME == "Mbeya Vijijini"
replace ADMIN_NAME = "Mbeya Urban" if ADMIN_NAME == "Mbeya Mjini"
replace ADMIN_NAME = "Missungwi" if ADMIN_NAME == "Misungwi"
replace ADMIN_NAME = "Morogoro" if ADMIN_NAME == "Morogoro Vijijini"
replace ADMIN_NAME = "Morogoro Urban" if ADMIN_NAME == "Morogoro Mjini"
replace ADMIN_NAME = "Moshi Rural" if ADMIN_NAME == "Moshi kijijini" 
//spelling
replace ADMIN_NAME = "Moshi Urban" if ADMIN_NAME == "Moshi Mjini"
replace ADMIN_NAME = "Mtwara Rural" if ADMIN_NAME == "Mtwara Vijijini"
replace ADMIN_NAME = "Mtwara Urban" if ADMIN_NAME == "Mtwara Mjini"
replace ADMIN_NAME = "Musoma Rural" if ADMIN_NAME == "Musoma Vijijini"
replace ADMIN_NAME = "Musoma Urban" if ADMIN_NAME == "Musoma Mjini"
replace ADMIN_NAME = "Njombe" if ADMIN_NAME == "Njombe Vijijini"
replace ADMIN_NAME = "Shinyanga Rural" if ADMIN_NAME == "Shinyanga Vijijini"
replace ADMIN_NAME = "Shinyanga Urban" if ADMIN_NAME == "Shinyanga Mjiji"
//spelling
replace ADMIN_NAME = "Singida Rural" if ADMIN_NAME == "Singida Vijijini"
replace ADMIN_NAME = "Singida Urban" if ADMIN_NAME == "Singida Mjini" 
replace ADMIN_NAME = "Songea Rural" if ADMIN_NAME == "Songea Vijijini"
replace ADMIN_NAME = "Songea Urban" if ADMIN_NAME == "Songea Mjini"
replace ADMIN_NAME = "Sumbawanga Rural" if ADMIN_NAME == "Sumbawanga Vijijini"
replace ADMIN_NAME = "Sumbawanga Urban" if ADMIN_NAME == "Sumbawanga Mjini"
replace ADMIN_NAME = "Tabora Urban" if ADMIN_NAME == "Tabora Mjini"
replace ADMIN_NAME = "Tanga Urban" if ADMIN_NAME == "Tanga"
save "$dir/working_data/TZ_grid.dta", replace

use "$dir/working_data/TZ-Dates+DistID.dta", replace
drop if date == "28"
drop if date == "23"
drop if date == "25/10"
drop if date == "04/06/2000"
drop if date == "04/2013"
drop if date == "05/05/2022"
drop if date == "09/11"
drop if date == "11/2014"
drop if date == "11/1012013"
drop if date == "30"
drop if date == "2"
drop if date == "2/09/201"
drop if date == "209/2013"
drop if date == "23"
drop if date == "24/8/20143"
drop if date == "25.19.2013"
drop if date == "25/10"
drop if date == "25/1022013"
drop if date == "26/9/20"
drop if date == "27/2013"
drop if date == "28/09/203"
drop if date == "30"
drop if date == "3171072013"
drop if date == "4/9/201"
drop if date == "30.8.20132"
replace date = "09/05/2011" if date == ".9/05/2011"
replace date = "01/11/2013" if date == "01.11.2013"
replace date = "03/12/2013" if date == "03/12/13"
replace date = "03/12/2014" if date == "03/12/204"
replace date = "03/12/2014" if date == "03/122014"
replace date = "04/10/2013" if date == "04.10.2013"
replace date = "04/10/2013" if date == "04/102013"
replace date = "05/09/2013" if date == "05.09.2013"
replace date = "05/10/2013" if date == "05.10.2013"
replace date = "05/12/2013" if date == "05.12.2013"
replace date = "05/09/2013" if date == "05/09/13"
replace date = "06/09/2009" if date == "06.09.09"
replace date = "06/09/2013" if date == "06.09.2013"
replace date = "08/10/2013" if date == "08.10.2013"
replace date = "01/10/2013" if date == "1.10.2013"
replace date = "01/11/2013" if date == "1/11/13"
replace date = "10/10/2013" if date == "10.10.2013"
replace date = "10/01/2013" if date == "10/1/2013"
replace date = "10/09/2013" if date == "10/9/013"
replace date = "11/10/2013" if date == "11-10-2013"
replace date = "11/10/2013" if date == "11.10.13"
replace date = "11/10/2013" if date == "11.10.2013"
replace date = "11/11/2013" if date == "11.11.2013"
replace date = "11/10/2013" if date == "11/10/013"
replace date = "11/09/2013" if date == "11/9/2013"
replace date = "12/10/2013" if date == "12.10.2013"
replace date = "12/09/2013" if date == "12/9/2013"
replace date = "13/11/2013" if date == "13.11.2013"
replace date = "15/11/2013" if date == "15.11.2013"
replace date = "15/11/2013" if date == "15/112013"
replace date = "16/10/2013" if date == "16.10.2013"
replace date = "16/09/2013" if date == "16/9/0013"
replace date = "16/09/2013" if date == "16/9/2013"
replace date = "17/10/2013" if date == "17.10.2013"
replace date = "17/10/2013" if date == "17/10/13"
replace date = "17/09/2013" if date == "17/9/2013"
replace date = "18/10/2013" if date == "18.10.2013"
replace date = "18/10/2013" if date == "18/10/13"
replace date = "18/09/2013" if date == "18/9/2013"
replace date = "19/09/2013" if date == "19.09.2013"
replace date = "19/09/2013" if date == "19.9.2013"
replace date = "19/09/2013" if date == "19/092013"
replace date = "19/10/2013" if date == "19/10/13"
replace date = "19/10/2013" if date == "19/102013"
replace date = "19/08/2013" if date == "19/8/2013"
replace date = "02/12/2013" if date == "2/12/13"
replace date = "20/09/2013" if date == "20.09.2013"
replace date = "20/09/2013" if date == "20/09/013"
replace date = "20/09/2013" if date == "20/9/13"
replace date = "21/08/2013" if date == "21/08/13"
replace date = "22/08/2013" if date == "22.08.13"
replace date = "22/11/2013" if date == "22.11.013"
replace date = "22/08/2013" if date == "22.8.2013"
replace date = "22/09/2013" if date == "22/9/203"
replace date = "23/08/2013" if date == "23.08.13"
replace date = "23/08/2013" if date == "23.08.2013"
replace date = "23/10/2013" if date == "23.10.2013"
replace date = "23/08/2013" if date == "23.8.2013"
replace date = "23/08/2013" if date == "23/08/13"
replace date = "23/08/2013" if date == "23/082013"
replace date = "23/10/2013" if date == "23/10/13"
replace date = "23/08/2013" if date == "23/8/2013"
replace date = "23/08/2013" if date == "23/82013"
replace date = "23/09/2013" if date == "230/9/2013"
replace date = "24/10/2013" if date == "24-10-2013"
replace date = "24/03/2013" if date == "24.03.2013"
replace date = "24/10/2013" if date == "24.10.2013"
replace date = "24/08/2013" if date == "24/8/2013"
replace date = "24/09/2013" if date == "24/9/2013"
replace date = "25/10/2013" if date == "25.10.13"
replace date = "25/10/2013" if date == "25.10.2013"
replace date = "25/10/2013" if date == "25/10/13"
replace date = "25/10/2013" if date == "25/102013"
replace date = "25/09/2013" if date == "25/9/2013"
replace date = "26/09/2013" if date == "26-92013"
replace date = "26/09/2013" if date == "26.09.13"
replace date = "26/09/2013" if date == "26.9.2013"
replace date = "26/09/2013" if date == "26/09/213"
replace date = "26/08/2013" if date == "2608/2013"
replace date = "26/08/2013" if date == "26/8/2013"
replace date = "27/09/2013" if date == "27.09.2013"
replace date = "27/09/2013" if date == "27/09/13"
replace date = "27/09/2013" if date == "27/092013"
replace date = "27/10/2013" if date == "27/10/213"
replace date = "27/06/2013" if date == "27/6/13"
replace date = "27/09/2013" if date == "27/92013"
replace date = "28/10/2013" if date == "28.10.2013"
replace date = "28/10/2013" if date == "28//10/13"
replace date = "28/10/2013" if date == "28/10/13"
replace date = "28/10/2013" if date == "28/102013"
replace date = "03/10/2013" if date == "3.10.2013"
replace date = "03/10/2013" if date == "3/10/013"
replace date = "30/08/2013" if date == "30.08.2013"
replace date = "30/10/2013" if date == "30.10.2013"
replace date = "30/08/2013" if date == "30.8.2013"
replace date = "31/10/2013" if date == "31.10.2013"
replace date = "31/08/2013" if date == "31/08?2013"
replace date = "04/12/2013" if date == "4.12.2013"
replace date = "04/10/2013" if date == "4/10/013"
replace date = "04/10/2013" if date == "4/10/13"
replace date = "05/06/2013" if date == "5.06.2013"
replace date = "05/10/2013" if date == "5.10.13"
replace date = "05/12/2013" if date == "5122013"
replace date = "06/12/2013" if date == "6.12.2013"
replace date = "06/12/2013" if date == "6/12/13"
replace date = "06/09/2013" if date == "6/9/13"
replace date = "06/09/2013" if date == "6/9/20/13"
replace date = "07/11/2013" if date == "7.11.2013"
replace date = "07/09/2013" if date == "7/09/013"
replace date = "09/10/2013" if date == "09.10.2013"

split date,parse("/") gen(time)
rename time1 day
rename time2 month
rename time3 year
destring day, replace
destring month, replace
destring year, replace
drop if year < 2010
drop if year > 2014
drop if month < 1
drop if month > 12
drop if day < 1
drop if day > 31
drop if (month == 4 & day > 30)
drop if (month == 6 & day > 30)
drop if (month == 9 & day > 30)
drop if (month == 11 & day > 30)
drop if (month == 2 & day > 29)
drop if (month == 2 & day > 28 & year != 2012)

rename id_districtName ADMIN_NAME
merge m:1 ADMIN_NAME using "$dir/working_data/TZ_grid.dta"
drop _merge

rename ADMIN_NAME dist
drop date
drop if day == .

save "$dir/working_data/TZ_distcoor.dta", replace


use "$dir/working_data/UGcoor.dta", replace
gen lat = round(latitude/0.5)*0.5           //round()四捨五入
gen lon = round(longitude/0.625)*0.625
replace ADMIN_NAME = "Buduuda" if ADMIN_NAME == "Bududa"
replace ADMIN_NAME = "Nyadri" if ADMIN_NAME == "Maracha" //Nyadri, Maracha County, Maracha District
save "$dir/working_data/UG_grid.dta", replace

use "$dir/working_data/UG-Dates+DistID.dta", replace
gen date2 = string(date, "%tdDD/NN/CCYY") //日期格式轉字串
replace date2 = date1 if date == .
split date2, parse("/") gen(time) 

rename time1 day
rename time2 month
rename time3 year
destring day, replace
destring month, replace
destring year, replace
drop if year < 2010
drop if year > 2014
drop if month < 1
drop if month > 12
drop if day < 1
drop if day > 31
drop if (month == 4 & day > 30)
drop if (month == 6 & day > 30)
drop if (month == 9 & day > 30)
drop if (month == 11 & day > 30)
drop if (month == 2 & day > 29)
drop if (month == 2 & day > 28 & year != 2012)
rename id_districtName ADMIN_NAME
merge m:1 ADMIN_NAME using "$dir/working_data/UG_grid.dta"
drop _merge

rename ADMIN_NAME dist
drop date date1 date2
drop if day == .

save "$dir/working_data/UG_distcoor.dta", replace
