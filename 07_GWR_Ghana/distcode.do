//separate data of each country


global dir = "D:/00_work/07_GWR_Ghana"


use "$dir/working_data/pm25_with_dist.dta", replace

drop lat_1000_str lon_1000_str lat_1000 lon_1000
drop if dist == "None"

gen dist_code = "0"
replace dist_code = "001" if dist == "Ahanta West"
replace dist_code = "002" if dist == "Aowin or Suaman"
replace dist_code = "003" if dist == "Bia"
replace dist_code = "004" if dist == "Sefwi-Bibiani-Ahwiaso-Bekwai"
replace dist_code = "005" if dist == "Ellembelle"
replace dist_code = "006" if dist == "Jomoro"
replace dist_code = "007" if dist == "Juabeso"
replace dist_code = "008" if dist == "Mpohor-Wassa East"
replace dist_code = "009" if dist == "Nzema East"
replace dist_code = "010" if dist == "Prestea or Huni Valley"
//10
replace dist_code = "011" if dist == "Sefwi-Akontombra"
replace dist_code = "012" if dist == "Sefwi-Wiawso"
replace dist_code = "013" if dist == "Sekondi-Takoradi"
replace dist_code = "014" if dist == "Shama"
replace dist_code = "015" if dist == "Tarkwa Nsuaem"
replace dist_code = "016" if dist == "Wassa Amenfi East"
replace dist_code = "017" if dist == "Wassa Amenfi West"
replace dist_code = "018" if dist == "Abura-Asebu-Kwamankese"
replace dist_code = "019" if dist == "Agona East"
replace dist_code = "020" if dist == "Agona West"
//20
replace dist_code = "021" if dist == "Ajumako-Enyan-Essiam"
replace dist_code = "022" if dist == "Asikuma-Odoben -Brakwa"
replace dist_code = "023" if dist == "Assin North"
replace dist_code = "024" if dist == "Assin South"
replace dist_code = "025" if dist == "Awutu Senya"
replace dist_code = "026" if dist == "Cape Coast"
replace dist_code = "027" if dist == "Effutu"
replace dist_code = "028" if dist == "Gomoa East"
replace dist_code = "029" if dist == "Gomoa West"
replace dist_code = "030" if dist == "Komenda-Edina-Eguafo-Abirem"
//30
replace dist_code = "031" if dist == "Mfantsiman"
replace dist_code = "032" if dist == "Twifo-Heman-Lower Denkyira"
replace dist_code = "033" if dist == "Upper Denkyira West"
replace dist_code = "034" if dist == "Upper Denkyira East"
replace dist_code = "035" if dist == "A M A"
replace dist_code = "036" if dist == "Adenta"
replace dist_code = "037" if dist == "Ashaiman"
replace dist_code = "038" if dist == "Dangme East"
replace dist_code = "039" if dist == "Dangme West"
replace dist_code = "040" if dist == "Ga East"
//40
replace dist_code = "041" if dist == "Ga West"
replace dist_code = "042" if dist == "Ledzokuku or Krowor"
replace dist_code = "043" if dist == "Tema"
replace dist_code = "044" if dist == "Weija (Ga South)"
replace dist_code = "045" if dist == "Adaklu Anyigbe"
replace dist_code = "046" if dist == "Akatsi"
replace dist_code = "047" if dist == "Biakoye"
replace dist_code = "048" if dist == "Ho"
replace dist_code = "049" if dist == "Hohoe"
replace dist_code = "050" if dist == "Jasikan"
//50
replace dist_code = "051" if dist == "Kadjebi"
replace dist_code = "052" if dist == "Keta Municipal"
replace dist_code = "053" if dist == "Ketu North"
replace dist_code = "054" if dist == "Ketu South"
replace dist_code = "055" if dist == "North Dayi"
//Kpando
replace dist_code = "056" if dist == "Krachi East"
replace dist_code = "057" if dist == "Krachi West"
replace dist_code = "058" if dist == "Nkwanta North"
replace dist_code = "059" if dist == "Nkwanta South"
replace dist_code = "060" if dist == "North Tongu"
//60
replace dist_code = "061" if dist == "South Tongu"
replace dist_code = "062" if dist == "South Dayi"
replace dist_code = "063" if dist == "Akwapim North"
replace dist_code = "064" if dist == "Akwapim South"
replace dist_code = "065" if dist == "Akyemansa"
replace dist_code = "066" if dist == "Asuogyaman"
replace dist_code = "067" if dist == "Atiwa"
replace dist_code = "068" if dist == "Birim Central Municipal"
replace dist_code = "069" if dist == "Birim North"
replace dist_code = "070" if dist == "Birim South"
//70
replace dist_code = "071" if dist == "East Akim"
replace dist_code = "072" if dist == "Fanteakwa"
replace dist_code = "073" if dist == "Kwaebibirem"
replace dist_code = "074" if dist == "Kwahu East"
replace dist_code = "075" if dist == "Kwahu North (Afram Plains)"
replace dist_code = "076" if dist == "Kwahu South"
replace dist_code = "077" if dist == "Kwahu West"
replace dist_code = "078" if dist == "Lower Manya Krobo"
replace dist_code = "079" if dist == "New Juaben Municipal"
replace dist_code = "080" if dist == "Suhum-Kraboa Coaltar"
//80
replace dist_code = "081" if dist == "Upper Manya Krobo"
replace dist_code = "082" if dist == "West Akim"
replace dist_code = "083" if dist == "Yilo Krobo"
replace dist_code = "084" if dist == "Adansi North"
replace dist_code = "085" if dist == "Adansi South"
replace dist_code = "086" if dist == "Afigya Kwabre"
replace dist_code = "087" if dist == "Ahafo Ano North"
replace dist_code = "088" if dist == "Ahafo Ano South"
replace dist_code = "089" if dist == "Amansie Central"
replace dist_code = "090" if dist == "Amansie East" //
//90
replace dist_code = "091" if dist == "Amansie West"
replace dist_code = "092" if dist == "Asante Akim North"
replace dist_code = "093" if dist == "Asante Akim South"
replace dist_code = "094" if dist == "Atwima Mponua"
replace dist_code = "095" if dist == "Atwima Nwabiagya"
replace dist_code = "096" if dist == "Atwima Kwanwoma"
replace dist_code = "097" if dist == "Bekwai Municipal"
replace dist_code = "098" if dist == "Bosome Freho"
replace dist_code = "099" if dist == "Bosumtwi"
replace dist_code = "100" if dist == "Ejisu Juaben"
//100
replace dist_code = "101" if dist == "Ejura Sekye Dumasi"
replace dist_code = "102" if dist == "Kumasi Metropolitan Assembly (KMA)"
replace dist_code = "103" if dist == "Kwabre  East"
replace dist_code = "104" if dist == "Mampong Municipal"
replace dist_code = "105" if dist == "Obuasi Municipal"
replace dist_code = "106" if dist == "Offinso Municipal"
replace dist_code = "107" if dist == "Offinso North"
replace dist_code = "108" if dist == "Sekyere Afram Plains"
replace dist_code = "109" if dist == "Sekyere Central"
replace dist_code = "110" if dist == "Sekyere East"
//110
replace dist_code = "111" if dist == "Sekyere South"
replace dist_code = "112" if dist == "Asunafo North"
replace dist_code = "113" if dist == "Asunafo South"
replace dist_code = "114" if dist == "Asutifi"
replace dist_code = "115" if dist == "Atebubu"
replace dist_code = "116" if dist == "Berekum"
replace dist_code = "117" if dist == "Dormaa Municipal"
replace dist_code = "118" if dist == "Dormaa East"
replace dist_code = "119" if dist == "Jaman North"
replace dist_code = "120" if dist == "Jaman South"
//120
replace dist_code = "121" if dist == "Kintampo North"
replace dist_code = "122" if dist == "Kintampo South"
replace dist_code = "123" if dist == "Nkoranza North"
replace dist_code = "124" if dist == "Nkoranza South"
replace dist_code = "125" if dist == "Pru"
replace dist_code = "126" if dist == "Sene"
replace dist_code = "127" if dist == "Sunyani Municipal"
replace dist_code = "128" if dist == "Sunyani West"
replace dist_code = "129" if dist == "Tain"
replace dist_code = "130" if dist == "Tano North"
//130
replace dist_code = "131" if dist == "Tano South"
replace dist_code = "132" if dist == "Techiman"
replace dist_code = "133" if dist == "Wenchi"
replace dist_code = "134" if dist == "Bole"
replace dist_code = "135" if dist == "Bunkpurugu Yonyo"
replace dist_code = "136" if dist == "Gonja Central"
replace dist_code = "137" if dist == "Chereponi"
replace dist_code = "138" if dist == "East Gonja"
replace dist_code = "139" if dist == "Mamprusi East"
replace dist_code = "140" if dist == "Gushiegu"
//140
replace dist_code = "141" if dist == "Karaga"
replace dist_code = "142" if dist == "Kpandai"
replace dist_code = "143" if dist == "Nanumba North"
replace dist_code = "144" if dist == "Nanumba South"
replace dist_code = "145" if dist == "Saboba"
replace dist_code = "146" if dist == "Savelugu Nanton"
replace dist_code = "147" if dist == "Sawla-Tuna-Kalba"
replace dist_code = "148" if dist == "Tamale Metro"
replace dist_code = "149" if dist == "Tolon Kumbugu"
replace dist_code = "150" if dist == "West Gonja"
//150
replace dist_code = "151" if dist == "Mamprusi  West"
replace dist_code = "152" if dist == "Yendi"
replace dist_code = "153" if dist == "Zabzugu Tatali"
replace dist_code = "154" if dist == "Bawku Municipal"
replace dist_code = "155" if dist == "Bawku West"
replace dist_code = "156" if dist == "Bolgatanga Municipal"
replace dist_code = "157" if dist == "Bongo"
replace dist_code = "158" if dist == "Builsa"
replace dist_code = "159" if dist == "Garu Tempane"
replace dist_code = "160" if dist == "Kasena Nankana East"
//160
replace dist_code = "161" if dist == "Kasena Nankana West"
replace dist_code = "162" if dist == "Talensi Nabdam"
replace dist_code = "163" if dist == "Jirapa"
replace dist_code = "164" if dist == "Lambussie"
replace dist_code = "165" if dist == "Lawra"
replace dist_code = "166" if dist == "Nadowli"
replace dist_code = "167" if dist == "Sissala East"
replace dist_code = "168" if dist == "Sissala West"
replace dist_code = "169" if dist == "Wa Municipal"
replace dist_code = "170" if dist == "Wa East"
//170
replace dist_code = "171" if dist == "Wa West"

save "$dir/working_data/pm25_with_distcode.dta", replace
