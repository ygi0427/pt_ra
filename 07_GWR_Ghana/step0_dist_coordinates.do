

global dir = "D:/00_work/07_GWR_Ghana"
use "$dir/working_data/dist_centroid.dta", clear
rename lat latitude
rename lon longtitude
gen lat = round(latitude/0.5)*0.5           //round()四捨五入
gen lon = round(longtitude/0.625)*0.625
//此方法將district真實座標換算成其對應的nc4 file 中心點座標
//意義為落在0.5*0.625矩形裡的點經過此運算後都會落在其中心點

save "$dir/working_data/dist_coordinates.dta", replace

