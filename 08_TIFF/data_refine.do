 /*============================================================
Program: data_refine.do
Creator: Chien-Hui Lin
Created: 2021/09/19
Updated: 2021/12/14
Purpose: get value tn tiff, merge with 368 townships and graph
==============================================================*/
global dir = "/Volumes/My Passport/08_TIFF"


/*============================================================
step0: tiff.py
tiff to csv
(file: tiffcsv)
==============================================================*/
*tiff.py

/*============================================================
step1: csvtodta.do
transfer csv to dta 
(file: tiffdta)
==============================================================*/
do "$dir/programs/csvtodta.do"

/*============================================================
step2: missing_and_ym.do
replace missing and generate y, m
&
gen round coordinates(for merging with those townships without points)
(file: tiff_replaced)
==============================================================*/
do "dir/programs/missing_and_ym.do"

/*============================================================
step3: matchtownship.py
find towncode of each coordinate
(file: points_in_township)
==============================================================*/
*matchtownship.py

/*============================================================
step4: dailyfinal.do
merge township name by towncode 
and 
get value of nearst point to center if do not have point in township
(file:
merging - 有point和沒有的township分開
daily - 每個點的資料_everypoints & 只有368筆各township數值版本_bytownship)
==============================================================*/
do "$dir/programs/final.do"


/*============================================================(not updated)
step5: light_shapefile.py 
graph monthly avg on TW map
==============================================================*/
*light_shapefile.py
