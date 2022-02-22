#%%
# ==============================================================================
#  Program: district
#  Creator: Chien Hui Lin
#  Created: 2021/01
#  Updated: 2021/12
#  Purpose: 將四方形內座標match到dist
# =============================================================================
import os
import numpy as np
import pandas as pd
from netCDF4 import Dataset
import fiona
from shapely.geometry import shape, Point

path = '/Volumes/My Passport/08_TIFF'
#尋找coor在哪個dist
def search(x, y):
    global shapes, district
    # 逐一尋找各dist
    # 如果區域包含傳入的經緯度就傳回district[dist_id]
    return next((township[dist_id] for dist_id in shapes if shapes[dist_id].contains(Point(x, y))), None)

#判斷月資料中每一個座標並存成.dta
def monthly():
    for f in collection:
        dist_id = f['properties']['TOWNCODE']
        shapes[dist_id] = shape(f['geometry'])  # 界限經緯度
        township[dist_id] = f['properties']['TOWNCODE']  # search函式傳回值

    for data in light:
        lon = light['lon']
        lat = light['lat']

    d = []
    for i in range(31250):  #31250data
        call = search(float(lon[i]), float(lat[i]))
        print(i, ' coor,', lon[i], lat[i], call)
        d.append(str(call))

    light['towncode'] = d  # 新增資料到df
    print(light)
    light.to_stata(path + "/working_data/points_in_township/" + str(year)+ "_" + str(month) + ".dta", write_index=False)

#######
'''
#2012
year = 2012
for month in range(4,13):
    if month < 10:
        light = pd.read_stata(path + "/working_data/tiff_replaced/" + str(year) + "0" + str(month) + ".dta")
    else:
        light = pd.read_stata(path + "/working_data/tiff_replaced/" + str(year) + str(month) + ".dta")
    collection = fiona.open(path + "/rawdata/TOWN_MOI_1071226.shp", encoding="utf-8")
    shapes = {}
    township = {}

    monthly()
'''
#2013~2020
for year in range(2017, 2018):
    for month in range(9,10):
        if month < 10:
            light = pd.read_stata(path + "/working_data/tiff_replaced/" + str(year) + "0" + str(month) + ".dta")
        else:
            light = pd.read_stata(path + "/working_data/tiff_replaced/" + str(year) + str(month) + ".dta")
        collection = fiona.open(path + "/rawdata/TOWN_MOI_1071226.shp", encoding="utf-8")
        shapes = {}
        township = {}

        monthly()
'''
#2021
year = 2021
for month in range(1,8):
    if month < 10:
        light = pd.read_stata(path + "/working_data/tiff_replaced/" + str(year) + "0" + str(month) + ".dta")
    else:
        light = pd.read_stata(path + "/working_data/tiff_replaced/" + str(year) + str(month) + ".dta")
    collection = fiona.open(path + "/rawdata/TOWN_MOI_1071226.shp", encoding="utf-8")
    shapes = {}
    township = {}

    monthly()
'''