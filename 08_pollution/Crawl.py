#%%
# ==============================================================================
#  Program: Crawl_v2.1_6hourly
#  Creator: Wang  
#  Created: 2020/03/30
#  Editted: Lin
#  Updated: 2021/02
#  Purpose: 利用爬蟲方式，下載台灣2010年溫度每天資料(6hourly)\
#  UD:      ghana, 2008 Jan to 2011 Dec
# =============================================================================

import time
import random
from selenium import webdriver
from selenium.webdriver.common.keys import Keys



#要先上網下載chromedriver.exe，再將檔案獎壓縮放入下方路徑中)_OK
chromedriver = "C:/Program Files (x86)/Google/Chrome/Application/chromedriver.exe" #chromedriver放的位置
driver = webdriver.Chrome(chromedriver) #開啟瀏覽器


#登入頁面
driver.get("https://urs.earthdata.nasa.gov/home")
#輸入帳號
driver.find_element_by_name("username").send_keys( "ygi0427" ) #將USERNAME改成你的帳號_OK
#輸入密碼
driver.find_element_by_name("password").send_keys( "Mubo1228" ) #將PASSWORD改成你的密碼_OK
#點下log in鍵
driver.find_element_by_name("commit").click()


#打開下載6-hourly資料的頁面(因為新版網頁常常因為莫名的原因不能下載，這邊先使用舊版網頁)
driver.get("https://goldsmr5.gesdisc.eosdis.nasa.gov/opendap/MERRA2/M2I6NPANA.5.12.4/2010/01/MERRA2_300.inst6_3d_ana_Np.20100101.nc4.html_old")

#將輸入資料的那行令為：url
url = driver.find_elements_by_name("url")

#將下載NC4按鈕令為：buttons
buttons = driver.find_elements_by_xpath("//input[@value='Get as NetCDF 4'][@type='button']")


#下載台灣2010年溫度、相對溼度每天資料(6hourly)
for yy in range(2008, 2012):
    year = str(yy)
    #y除以4餘數為0，表示該年為閏年，2月會有29天
    if yy %4 == 0:
        day_list = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    else:
        day_list = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        
    #MEERA-2下載檔案的名稱中，不同年份有不同的數字，如2001~2010年此數字為300
    if yy >= 1991 and yy <= 2000:
        year_code = "200"
    elif yy >= 2001 and yy <= 2010: 
        year_code = "300"
    elif yy >= 2011 and yy <= 2020: 
        year_code = "400"
   
    for mm in range(1,13):
        month = str(mm)
        
        if mm < 10:
            month = "0" + month
            
        for dd in range(1, day_list[mm - 1] + 1):
            day = str(dd)
            
            if dd < 10:
                day = "0" + day
            '''
            keep if lon >= -3.5 & lon <= 1.5 //E+ W-
            keep if lat >= 4.5 & lat <= 11.5 //N+ S-
            W4 ~ E2
            N4~12 
            '''
            url_text = "https://goldsmr5.gesdisc.eosdis.nasa.gov:443/opendap/MERRA2/M2I6NPANA.5.12.4/" + year + "/"+ month + "/MERRA2_" + year_code + ".inst6_3d_ana_Np." + year + month + day + ".nc4?T[0:1:3][0:1:17][189:1:203][282:1:291]"
            url[0].clear()
            url[0].send_keys(url_text)
            buttons[0].click()
            time.sleep(random.randint(5,10)) #下載一個檔案後，隨機停留一個時間(避免被NASA認為是惡意攻擊)


