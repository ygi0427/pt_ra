#%%
# ==============================================================================
#  Program: light_shapefile
#  Creator: Lin
#  Created: 2021/08
#  Updated: Lin
#  Purpose: 1.畫出368個township的light
# =============================================================================

import pandas as pd
import geopandas as gpd
import matplotlib.pyplot as plt
from PIL import Image
from matplotlib import cm
from matplotlib.colors import ListedColormap, LinearSegmentedColormap
import numpy as np

path = "/Volumes/Samsung_T5/00_work/08_TIFF"

#匯入台灣368鄉鎮地圖、368鄉鎮每月pm10值
shape = gpd.read_file(path + "/rawdata/TOWN_MOI_1071226.shp", encoding="utf-8")

for month in range(1,9):
    light = pd.read_stata(path + "/working_data/final/2021_" + str(month) + "_townavg.dta")
    y=2021
    Y=str(y)

    #將light的資料抓出
    light_y = light #[light["year"] == y]
    light_y = light_y[["countyname","townname","avg"]]

    #更改light_變數y名稱
    light_y.columns = ["COUNTYNAME","TOWNNAME",'avglight']

    #將圖檔與的pm25合併
    light_shp = pd.merge(shape, light_y, on = ["COUNTYNAME","TOWNNAME"])

    #畫出圖(cmap設定顏色，column用來指定要顯示的變數，legend將圖例放出來，vmin設定顏色最低值，vmax設定顏色最高值，edgecolor設定圖邊界顏色，linewidth設定邊界粗度)
    figure4 = light_shp.plot(cmap = plt.cm.Blues, column = "avglight", legend = True, vmin = -1, vmax = 80, edgecolor = "black", linewidth = 0.3)

    #將圖形限縮在經度119~122.5度、緯度21.5~25.4度內
    figure4.set_xbound(119,122.5)
    figure4.set_ybound(21.5,25.4)

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
    fig4_save.savefig(path + "/figures/" + Y + "_" + str(month) + "_light.png", bbox_inches="tight", dpi = 1000)
