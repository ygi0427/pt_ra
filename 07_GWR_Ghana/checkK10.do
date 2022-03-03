
global dir = "D:/00_work/07_GWR_Ghana"

use "$dir/raw_data/S10AI.dta", replace
gen K10 = s10ai_a1 + s10ai_a2 + s10ai_a3 + s10ai_a4 + s10ai_a5 + s10ai_a6 + s10ai_a7 + s10ai_a8 + s10ai_a9 + s10ai_a10
//rename depressed K10
gen check = K10 - depressed

save "$dir/working_data/K10.dta", replace

