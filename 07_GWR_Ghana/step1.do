/*==============================================================================
Step1:
1.將nc4 run出來的資料更改變數名稱
2.產生num變數用來對應 sheet1.do 做出的dta file
3.將sheet1.do 做出的dta file 用 num merge到Step1做出的資料
  merge 1:1 num using sheet1.dta
==============================================================================*/
set more off
global dir = "D:/00_work/07_GWR_Ghana"

foreach year in 2008{
	foreach month in 1 3 5 7 8 10 12{
		forvalue day = 1(1)31{
			import excel "$dir/working_data/excel/GH`year'/GH`year'_`month'_`day'.xlsx", sheet("Sheet1") firstrow clear
			gen num = A+1            //產生num變數用來對應 sheet1.do 做出的dta file
			drop A
			joinby num using "$dir/working_data/sheet1.dta", unmatched(both)
			replace T =. if T>1000
			drop _merge num
			save "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", replace
		}
	}
		
	foreach month in 4 6 9 11{
		forvalue day = 1(1)30{
			import excel "$dir/working_data/excel/GH`year'/GH`year'_`month'_`day'.xlsx", sheet("Sheet1") firstrow clear
			gen num = A+1          
			drop A
			joinby num using "$dir/working_data/sheet1.dta", unmatched(both)
			replace T =. if T>1000
			drop _merge num
			save "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", replace
		}
	}

	foreach month in 2{
		forvalue day = 1(1)29{
			import excel "$dir/working_data/excel/GH`year'/GH`year'_`month'_`day'.xlsx", sheet("Sheet1") firstrow clear
			gen num = A+1           
			drop A
			joinby num using "$dir/working_data/sheet1.dta", unmatched(both)
			replace T =. if T>1000
			drop _merge num
			save "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", replace
		}
	}

}
foreach year in 2009 2010 2011{
	foreach month in 1 3 5 7 8 10 12{
		forvalue day = 1(1)31{
			import excel "$dir/working_data/excel/GH`year'/GH`year'_`month'_`day'.xlsx", sheet("Sheet1") firstrow clear
			gen num = A+1           
			drop A
			joinby num using "$dir/working_data/sheet1.dta", unmatched(both)
			replace T =. if T>1000
			drop _merge num
			save "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", replace
		}
	}
		
	foreach month in 4 6 9 11{
		forvalue day = 1(1)30{
			import excel "$dir/working_data/excel/GH`year'/GH`year'_`month'_`day'.xlsx", sheet("Sheet1") firstrow clear
			gen num = A+1          
			drop A
			joinby num using "$dir/working_data/sheet1.dta", unmatched(both)
			replace T =. if T>1000
			drop _merge num
			save "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", replace
		}
	}

	foreach month in 2{
		forvalue day = 1(1)28{
			import excel "$dir/working_data/excel/GH`year'/GH`year'_`month'_`day'.xlsx", sheet("Sheet1") firstrow clear
			gen num = A+1           
			drop A
			joinby num using "$dir/working_data/sheet1.dta", unmatched(both)
			replace T =. if T>1000
			drop _merge num
			save "$dir/working_data/dta/GH`year'/GH`year'_`month'_`day'.dta", replace
		}
	}

}
