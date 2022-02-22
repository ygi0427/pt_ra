#%%
# ==============================================================================
#  Program: AQI_shapefile_y
#  Creator: Wang  
#  Created: 2020//02/14
#  Updated: Lin
#  Purpose: 1.畫出368個township的整年平均AQI
#           2.畫出368個township的夏季()AQI
#           3.畫出368個township的冬季()AQI
# =============================================================================

import pandas as pd
import geopandas as gpd
import matplotlib.pyplot as plt
from PIL import Image

path = "/Volumes/TRANSCEND/06_draw_figures"

#匯入台灣368鄉鎮地圖、368鄉鎮每月AQI值
township_shape = gpd.read_file(path + "/rawdata/台灣鄉鎮市區界圖/TOWN_MOI_1071226.shp", encoding="utf-8")
aqi = pd.read_stata(path + "/working_data/station_correct_coordinate/1996~2018_368_townshipWithStation_with_correct_coordinate_and_AQI_monthly.dta")

y=2001
Y=str(y)

# =========================================
#                year
# =========================================
#將AQI的資料抓出
aqi_y = aqi[aqi["year"] == y]
aqi_y = aqi_y[["county","township","year","month","AQI_monthly"]]

#刪除金門、馬祖(僅保留台灣本島、澎湖的資料)
aqi_y = aqi_y.loc[(aqi_y["county"] != "金門縣") & (aqi_y["county"] != "連江縣")]

#更改aqi_變數y名稱
aqi_y.columns = ["COUNTYNAME","TOWNNAME","year","month",'AQI_monthly']

#######計算每月AQI平均值#######
aqi_y_mean = []
aqi_y_mean = aqi_y.groupby("month").mean()
print (aqi_y_mean)

#夏季(6.7.8)月AQI平均最低的月份
#冬季(12.1.2月)AQI平均最高的月份
aqi_y_summer = aqi_y[aqi_y["month"] == 6]
aqi_y_winter = aqi_y[aqi_y["month"] == 2]

#2012年全年AQI
aqi_y_year = aqi_y.groupby(["COUNTYNAME","TOWNNAME"]).mean()


# ==============
#  summer
# ==============

#將圖檔與AQI合併
aqi_y_summer_shp = pd.merge(township_shape, aqi_y_summer, on = ["COUNTYNAME","TOWNNAME"])

#畫出圖(cmap設定顏色，column用來指定要顯示的變數，legend將圖例放出來，vmin設定顏色最低值，vmax設定顏色最高值，edgecolor設定圖邊界顏色，linewidth設定邊界粗度)
figure4 = aqi_y_summer_shp.plot(cmap = plt.cm.Reds, column = "AQI_monthly", legend = True, vmin = 30, vmax = 160, edgecolor = "black", linewidth = 0.3)

#將圖形限縮在經度119~122.5度、緯度21.5~25.4度內
figure4.set_xbound(119.3,122.5)
figure4.set_ybound(21.85,25.4)
#取消X.Y軸刻度
figure4.set_xticks([])
figure4.set_yticks([])

#去除上、下、左、右框線
figure4.spines['top'].set_visible(False) 
figure4.spines['bottom'].set_visible(False) 
figure4.spines['left'].set_visible(False) 
figure4.spines['right'].set_visible(False)


#將檔案儲存成.png檔
fig4_save = figure4.get_figure()
fig4_save.savefig(path + "/figures/"+Y+"_aqi_summer.png", bbox_inches="tight", dpi = 1000)


# ==============
#  winter
# ==============

#將圖檔與AQI合併
aqi_y_winter_shp = pd.merge(township_shape, aqi_y_winter, on = ["COUNTYNAME","TOWNNAME"])

#畫出圖(cmap設定顏色，column用來指定要顯示的變數，legend將圖例放出來，vmin設定顏色最低值，vmax設定顏色最高值，edgecolor設定圖邊界顏色，linewidth設定邊界粗度)
figure5 = aqi_y_winter_shp.plot(cmap = plt.cm.Reds, column = "AQI_monthly", legend = True, vmin = 30, vmax = 160, edgecolor = "black", linewidth = 0.3)

#將圖形限縮在經度119~122.5度、緯度21.5~25.4度內
figure5.set_xbound(119.3,122.5)
figure5.set_ybound(21.85,25.4)
#取消X.Y軸刻度
figure5.set_xticks([])
figure5.set_yticks([])

#去除上、下、左、右框線
figure5.spines['top'].set_visible(False) 
figure5.spines['bottom'].set_visible(False) 
figure5.spines['left'].set_visible(False) 
figure5.spines['right'].set_visible(False)


#將檔案儲存成.png檔
fig5_save = figure5.get_figure()
fig5_save.savefig(path + "/figures/"+Y+"_aqi_winter.png", bbox_inches="tight", dpi = 1000)


# ==============
#    2012年全年
# ==============

#將圖檔與2012年的AQI合併
aqi_y_shp = pd.merge(township_shape, aqi_y_year, on = ["COUNTYNAME","TOWNNAME"])

#畫出圖(cmap設定顏色，column用來指定要顯示的變數，legend將圖例放出來，vmin設定顏色最低值，vmax設定顏色最高值，edgecolor設定圖邊界顏色，linewidth設定邊界粗度)
figure6 = aqi_y_shp.plot(cmap = plt.cm.Reds, column = "AQI_monthly", legend = True, vmin = 30, vmax = 160, edgecolor = "black", linewidth = 0.3)

#將圖形限縮在經度119~122.5度、緯度21.5~25.4度內
figure6.set_xbound(119.3,122.5)
figure6.set_ybound(21.85,25.4)
#取消X.Y軸刻度
figure6.set_xticks([])
figure6.set_yticks([])

#去除上、下、左、右框線
figure6.spines['top'].set_visible(False) 
figure6.spines['bottom'].set_visible(False) 
figure6.spines['left'].set_visible(False) 
figure6.spines['right'].set_visible(False)


#將檔案儲存成.png檔
fig6_save = figure6.get_figure()
fig6_save.savefig(path + "/figures/"+Y+"_aqi.png", bbox_inches="tight", dpi = 1000)



'''
#將2012summer、winter的圖合併
arr = [path + "/figures/2012_summer.png",path + "/figures/2012_winter.png"]

#將圖放到小畫家中可以知道，每張圖的大小為2922*3220，因為要將兩張圖橫放在一起，因此設定新的圖大小為(5844,3220)
toImage = Image.new('RGBA',(5844,3220))
for i in range(0,2):
    fromImge = Image.open(arr[i])
    loc = ((i % 2) * 2922,0) #設定圖片X軸起始位置、Y軸起始位置
    #print(loc)
    toImage.paste(fromImge, loc)

toImage.save(path + "/figures/2012_summer_and_winter.png")

'''