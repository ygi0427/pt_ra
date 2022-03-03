#%%
# ==============================================================================
#  Program: pm25_shapefile_y
#  Creator: Wang
#  Created: 2020//02/14
#  Updated: Lin 2021/08
#  Purpose: 畫出各國家的整年平均pm25
# =============================================================================

import pandas as pd
import geopandas as gpd
import matplotlib.pyplot as plt
from PIL import Image

path = "/Volumes/san/09_mental"

#匯入每月pm25
afr_shape = gpd.read_file(path + "/rawdata/Africa_Boundaries.2atrh.shp", encoding="utf-8")
pm25 = pd.read_stata(path + "/working_data/WHS_pollution_weather.dta")

y=2003
Y=str(y)
# =========================================
#                year
# =========================================
#將pm25的資料抓出
pm25_y = pm25[pm25["year"] == y]
pm25_y = pm25_y[["country", "year", "pm25"]]

#更改pm25_變數y名稱
pm25_y.columns = ["COUNTRYNAME", "year", 'PM25_monthly']

#全年pm25
pm25_y_year = pm25_y.groupby(["COUNTRYNAME"]).mean()

#將圖檔與的pm25合併
pm25_y_shp = pd.merge(afr_shape, pm25_y_year, on = ["COUNTRYNAME"])

#畫出圖(cmap設定顏色，column用來指定要顯示的變數，legend將圖例放出來，vmin設定顏色最低值，vmax設定顏色最高值，edgecolor設定圖邊界顏色，linewidth設定邊界粗度)
figure6 = pm25_y_shp.plot(cmap = plt.cm.Reds, column = "pm25_year", legend = True, vmin = 30, vmax = 160, edgecolor = "black", linewidth = 0.3)

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
fig6_save.savefig(path + "/figures/"+Y+"_pm25.png", bbox_inches="tight", dpi = 1000)

