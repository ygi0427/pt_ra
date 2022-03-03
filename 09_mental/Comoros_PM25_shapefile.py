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
path = "/Volumes/san/09_mental"

#匯入每月pm25
shape_m = gpd.read_file(path + "/rawdata/Africa_Boundaries_Comoros.shp", encoding="utf-8")
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
left = shape_m.set_index("NAME_0")
right = pm25_y_year #.set_index("country")
sel_shp_m = left.join(right,how ="outer",lsuffix="_",rsuffix="_")


#設定顏色分佈從白色開始=========
r = cm.get_cmap('Reds', 256)
print(r)
newcolors = r(np.linspace(0, 1, 256))
white = np.array([255/256, 255/256, 255/256, 1])
newcolors[:1, :] = white
newcmp = ListedColormap(newcolors)
####=========================

#畫出圖(cmap設定顏色，column用來指定要顯示的變數，legend將圖例放出來，vmin設定顏色最低值，vmax設定顏色最高值，edgecolor設定圖邊界顏色，linewidth設定邊界粗度)
figurem = sel_shp_m.plot(cmap = newcmp, column = "pm25", legend = True, vmin = 25, vmax = 35, edgecolor = "black", linewidth = 0.3)

#將圖形限縮在經緯度
figurem.set_xbound(43,45)
figurem.set_ybound(-11,-12.75)

#取消X.Y軸刻度
figurem.set_xticks([])
figurem.set_yticks([])

#去除上、下、左、右框線
figurem.spines['top'].set_visible(False)
figurem.spines['bottom'].set_visible(False)
figurem.spines['left'].set_visible(False)
figurem.spines['right'].set_visible(False)
'''
#set arrow
arrow = dict(arrowstyle = "-")
##標記文字
shape_m['coords'] = shape_m['geometry'].apply(lambda x: x.representative_point().coords[:])
shape_m['coords'] = [coords[0] for coords in shape_m['coords']]
#.plot()
for idx, row in shape_m.iterrows():
    if(row['NAME_0'] =='Comoros'):
        plt.annotate(text=row['NAME_0'], xy=row['coords'],rotation=0,\
                     horizontalalignment='right', verticalalignment='baseline', fontsize=5.5 ,weight='bold')
'''
plt.title("Comoros")

#將檔案儲存成.png檔
figm_save = figurem.get_figure()
figm_save.savefig(path + '/' + Y + "_Comoros_pm25.png", bbox_inches="tight", dpi = 600)