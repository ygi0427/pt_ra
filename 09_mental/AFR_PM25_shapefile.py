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
from matplotlib import cm
from matplotlib.colors import ListedColormap, LinearSegmentedColormap
import numpy as np
import adjustText as aT

country = ["Burkina Faso","Chad","Comoros","Republic of Congo","Côte d'Ivoire",\
           "Ethiopia","Ghana","Kenya","Malawi","Mali",\
           "Mauritania","Namibia","Senegal","South Africa", "Swaziland",\
           "Zambia","Zimbabwe"] #,"Mauritius"]
country2 = ["Chad","Republic of Congo",\
           "Ethiopia","Kenya","Malawi","Mali",\
           "Mauritania","Namibia","Senegal","South Africa",\
           "Zambia","Zimbabwe"]

path = "/Volumes/san/09_mental"

#匯入每月pm25
shape = gpd.read_file(path + "/rawdata/Africa_Boundaries.2atrh.shp", encoding="utf-8")
pm25 = pd.read_stata(path + "/working_data/WHS_pollution_weather_withcon.dta")

y=2003
Y=str(y)
# =========================================
#                year
# =========================================
#將pm25的資料抓出
pm25_y = pm25[pm25["year"] == y] #2003
pm25_y = pm25_y[["country", "pm25"]]
print(pm25_y)
#各國全年pm25
pm25_y_year = []
pm25_y_year = pm25_y.groupby("country").mean()
print(pm25_y_year) #26~33


#將圖檔與的pm25合併
left = shape.set_index("NAME_0")
right = pm25_y_year #.set_index("country")
sel_shp = left.join(right,how ="outer",lsuffix="_",rsuffix="_")
sel_shp = sel_shp.fillna(0)


#設定顏色分佈從白色開始=========
r = cm.get_cmap('Reds', 256)
print(r)
newcolors = r(np.linspace(0, 1, 256))
white = np.array([255/256, 255/256, 255/256, 1])
newcolors[:1, :] = white
newcmp = ListedColormap(newcolors)
####=========================

#畫出圖(cmap設定顏色，column用來指定要顯示的變數，legend將圖例放出來，vmin設定顏色最低值，vmax設定顏色最高值，edgecolor設定圖邊界顏色，linewidth設定邊界粗度)
figure6 = sel_shp.plot(cmap = newcmp, column = "pm25", legend = True, vmin = 25, vmax = 35, edgecolor = "black", linewidth = 0.3)

#將圖形限縮在經緯度
figure6.set_xbound(-19,60)
figure6.set_ybound(-47.2,38)

#取消X.Y軸刻度
figure6.set_xticks([])
figure6.set_yticks([])

#去除上、下、左、右框線
figure6.spines['top'].set_visible(False)
figure6.spines['bottom'].set_visible(False)
figure6.spines['left'].set_visible(False)
figure6.spines['right'].set_visible(False)

#set arrow
arrow = dict(arrowstyle = "-")
##標記文字
shape['coords'] = shape['geometry'].apply(lambda x: x.representative_point().coords[:])
shape['coords'] = [coords[0] for coords in shape['coords']]
#.plot()
for idx, row in shape.iterrows():
    if(row['NAME_0'] =='Ghana'):
        plt.annotate(text=row['NAME_0'], xy=row['coords'],rotation=0,\
                     horizontalalignment='center', verticalalignment='bottom', fontsize=5.5 ,weight='bold')
    elif (row['NAME_0'] == 'Zambia'):
        plt.annotate(text=row['NAME_0'], xy=row['coords'], rotation=0, \
                     horizontalalignment='center', verticalalignment='top', fontsize=5.5, weight='bold')
    elif (row['NAME_0'] == "Côte d'Ivoire"):
        plt.annotate(text=row['NAME_0'], xy=row['coords'], rotation=0, \
                     horizontalalignment='center', verticalalignment='top', fontsize=5.5, weight='bold')
    elif (row['NAME_0'] in country2):
        plt.annotate(text=row['NAME_0'], xy=row['coords'], rotation=0, \
                     horizontalalignment='center', verticalalignment='center', fontsize=5.5, weight='bold')
    elif(row['NAME_0'] in country):
        plt.annotate(text=row['NAME_0'], xy=row['coords'], rotation=0, \
                     horizontalalignment='center', verticalalignment='bottom', fontsize=5.5, weight='bold')

#將檔案儲存成.png檔
fig6_save = figure6.get_figure()
fig6_save.savefig(path + '/' + Y + "_AFR_pm25.png", bbox_inches="tight", dpi = 1000)
