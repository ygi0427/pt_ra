#%%
# ==============================================================================
#  Program: district
#  Creator: Chien Hui Lin
#  Created: 2021/01
#  Updated: 
#  Purpose: 將四方形內座標match到dist
# =============================================================================
import os
import numpy as np
import pandas as pd
from netCDF4 import Dataset
import fiona
from shapely.geometry import shape, Point

path = "/Volumes/TRANSCEND/07_GWR_Ghana"
pm25 = pd.read_stata(path + "/working_data/2007~2011_GWR_Ghana_pm25_grid-year.dta")
collection = fiona.open(path + "/raw_data/geo2_gh2010.shp")

#尋找coor在哪個dist
def search(x, y):
    global shapes, district
    # 逐一尋找各dist
    # 如果區域包含傳入的經緯度就傳回district[dist_id]
    return next((distnames[dist_id] for dist_id in shapes if shapes[dist_id].contains(Point(x, y))), None)

shapes = {}
distnames = {}
print(pm25)

for f in collection:
    dist_id = f['properties']['ADMIN_NAME']
    shapes[dist_id] = shape(f['geometry'])  #界限經緯度
    distnames[dist_id] = f['properties']['ADMIN_NAME'] #search函式傳回值


for data in pm25:
    lon = pm25['lon']
    lat = pm25['lat']

d = []
for i in range(1750000): #1750000
    call = search(float(lon[i]), float(lat[i]))
    print(i, ' coor,', lon[i], lat[i], call)
    d.append(str(call))
pm25['dist'] = d #新增資料到df
print(pm25)
pm25.to_stata(path + "/working_data/pm25_with_dist.dta", write_index = False)