#%%
# ==============================================================================
#  Program: worldshapefile
#  Creator: Lin
#  Created: 2020/02/14
#  Updated: 2020/12 Lin
#  Purpose: Show world map & country names.
# =============================================================================

import pandas as pd
import geopandas as gpd
import matplotlib.pyplot as plt
from PIL import Image
import adjustText as aT
from adjustText import adjust_text

path = "/Volumes/san/10_worldmap"

#匯入地圖
shape = gpd.read_file(path + "/rawdata/ne_50m_admin_0_countries.shp", encoding="utf-8")
select = pd.read_stata(path + "/working_data/NAMEcompare.dta")
shape = shape[["geometry","NAME_LONG"]]

left = shape.set_index("NAME_LONG")
right = select.set_index("shpname")

#pm25_shp = pd.merge(shape, pm25, on = ["NAME_0"])
sel_shp = left.join(right,how ="outer",lsuffix="_",rsuffix="_")
sel_shp = sel_shp.fillna(0)


#畫出圖(cmap設定顏色，column用來指定要顯示的變數，legend將圖例放出來，vmin設定顏色最低值，vmax設定顏色最高值，edgecolor設定圖邊界顏色，linewidth設定邊界粗度)
figure4 = sel_shp.plot(cmap = plt.cm.Greys, column = "draw", legend = False, vmin = 0.0, vmax = 3, edgecolor = "black", linewidth = 0.3)

#取消X.Y軸刻度
figure4.set_xticks([])
figure4.set_yticks([])

#去除上、下、左、右框線
figure4.spines['top'].set_visible(False)
figure4.spines['bottom'].set_visible(False)
figure4.spines['left'].set_visible(False)
figure4.spines['right'].set_visible(False)
'''

##標記文字
sel_shp['coords'] = sel_shp['geometry'].apply(lambda x: x.representative_point().coords[:])
#print(shape['coords','NAME_LONG'])
sel_shp['coords'] = [coords[0] for coords in sel_shp['coords']]

#sel_shp.to_excel(path + "/temp.xlsx")

#.plot()
t=[]
for idx, row in sel_shp.iterrows():
    if(row['draw'] == 1):
        t.append(plt.annotate(text=row['countryname'], xy=row['coords'], rotation=0,\
                    horizontalalignment='right', verticalalignment='center', color='blue',fontsize=2.2 ,weight='bold'))

adjust_text(t, only_move={'text': 'xy'}) #, arrowprops = dict(arrowstyle='-', color='grey'))

'''
#將檔案儲存成.png檔
fig4_save = figure4.get_figure()
fig4_save.savefig(path + "/world3.png", bbox_inches="tight", dpi = 800)
