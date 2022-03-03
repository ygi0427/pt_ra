//making the table importername exportername importercode exportercode year value


global dir = "D:/00_work/04_edflow"


use "$dir/working_data/new_student.dta", replace
//indicator home
//country destination
gen destination =""
gen home =""
rename value edflow
rename time year
drop ïnatmon_ind location v6 flagcodes flags

//country name
replace destination ="UNITED STATES" if country =="United States of America"
replace destination ="UNITED KINGDOM" if country =="United Kingdom of Great Britain and Northern Ireland"
replace destination ="FRANCE" if country =="France"
replace destination ="GERMANY" if country =="Germany"
replace destination ="CANADA" if country =="Canada"
replace destination ="JAPAN" if country =="Japan"
replace destination ="SOUTH AFRICA" if country =="South Africa"
replace destination ="BRAZIL" if country =="Brazil"
replace destination ="VENEZUELA, REP. BOL." if country =="Venezuela (Bolivarian Republic of)"
replace destination ="IRAN, I.R. OF" if country =="Iran (Islamic Republic of)"
replace destination ="ISRAEL" if country =="Israel"
replace destination ="INDIA" if country =="India"
replace destination ="SOUTH KOREA" if country =="Republic of Korea"
replace destination ="PAKISTAN" if country =="Pakistan"
replace destination ="RUSSIA" if country =="Russian Federation"
replace destination ="CHINA,P.R.: MAINLAND" if country =="China"
replace destination ="NORTH KOREA" if country =="Democratic People's Republic of Korea"

replace home ="UNITED STATES" if indicator =="North America: Students from the United States, both sexes (number)"
replace home ="UNITED KINGDOM" if indicator =="Europe: Students from the United Kingdom, both sexes (number)"
replace home ="FRANCE" if indicator =="Europe: Students from France, both sexes (number)"
replace home ="GERMANY" if indicator =="Europe: Students from Germany, both sexes (number)"
replace home ="ITALY" if indicator =="Europe: Students from Italy, both sexes (number)"
replace home ="CANADA" if indicator =="North America: Students from Canada, both sexes (number)"
replace home ="JAPAN" if indicator =="Asia: Students from Japan, both sexes (number)"
replace home ="FINLAND" if indicator =="Europe: Students from Finland, both sexes (number)"
replace home ="GREECE" if indicator =="Europe: Students from Greece, both sexes (number)"
replace home ="PORTUGAL" if indicator =="Europe: Students from Portugal, both sexes (number)"
replace home ="SPAIN" if indicator =="Europe: Students from Spain, both sexes (number)"
replace home ="TURKEY" if indicator =="Asia: Students from Turkey, both sexes (number)"
replace home ="AUSTRALIA" if indicator =="Oceania: Students from Australia, both sexes (number)"
replace home ="SOUTH AFRICA" if indicator =="Africa: Students from South Africa, both sexes (number)"
replace home ="ARGENTINA" if indicator =="South America: Students from Argentina, both sexes (number)"
replace home ="BRAZIL" if indicator =="South America: Students from Brazil, both sexes (number)"
replace home ="CHILE" if indicator =="South America: Students from Chile, both sexes (number)"
replace home ="MEXICO" if indicator =="Caribbean and Central America: Students from Mexico, both sexes (number)"
replace home ="PERU" if indicator =="South America: Students from Peru, both sexes (number)"
replace home ="IRAN, I.R. OF" if indicator =="Asia: Students from the Islamic Republic of Iran, both sexes (number)"
replace home ="IRAQ" if indicator =="Asia: Students from Iraq, both sexes (number)"
replace home ="ISRAEL" if indicator =="Asia: Students from Israel, both sexes (number)"
replace home ="LEBANON" if indicator =="Asia: Students from Lebanon, both sexes (number)"
replace home ="SAUDI ARABIA" if indicator =="Asia: Students from Saudi Arabia, both sexes (number)"
replace home ="UNITED ARAB EMIRATES" if indicator =="Asia: Students from the United Arab Emirates, both sexes (number)"
replace home ="EGYPT" if indicator =="Africa: Students from Egypt, both sexes (number)"
replace home ="AFGHANISTAN, I.S. OF" if indicator =="Asia: Students from Afghanistan, both sexes (number)"
replace home ="SRI LANKA" if indicator =="Asia: Students from Sri Lanka, both sexes (number)"
replace home ="INDIA" if indicator =="Asia: Students from India, both sexes (number)"
replace home ="INDONESIA" if indicator =="Asia: Students from Indonesia, both sexes (number)"
replace home ="SOUTH KOREA" if indicator =="Asia: Students from the Republic of Korea, both sexes (number)"
replace home ="PAKISTAN" if indicator =="Asia: Students from Pakistan, both sexes (number)"
replace home ="PHILIPPINES" if indicator =="Asia: Students from the Philippines, both sexes (number)"
replace home ="THAILAND" if indicator =="Asia: Students from Thailand, both sexes (number)"
replace home ="CONGO, DEM. REP. OF" if indicator =="Africa: Students from the Democratic Republic of the Congo, both sexes (number)"
replace home ="GHANA" if indicator =="Africa: Students from Ghana, both sexes (number)"
replace home ="KENYA" if indicator =="Africa: Students from Kenya, both sexes (number)"
replace home ="NIGERIA" if indicator =="Africa: Students from Nigeria, both sexes (number)"
replace home ="ZIMBABWE" if indicator =="Africa: Students from Zimbabwe, both sexes (number)"
replace home ="SENEGAL" if indicator =="Africa: Students from Senegal, both sexes (number)"
replace home ="TANZANIA" if indicator =="Africa: Students from the United Republic of Tanzania, both sexes (number)"
replace home ="AZERBAIJAN" if indicator =="Asia: Students from Azerbaijan, both sexes (number)"
replace home ="RUSSIA" if indicator =="Europe: Students from the Russian Federation, both sexes (number)"
replace home ="CHINA,P.R.: MAINLAND" if indicator =="Asia: Students from China, both sexes (number)"
replace home ="HUNGARY" if indicator =="Europe: Students from Hungary, both sexes (number)"
replace home ="POLAND" if indicator =="Europe: Students from Poland, both sexes (number)"

drop country indicator

rename home exportername
rename destination importername

save "$dir/working_data/edflow.dta", replace

