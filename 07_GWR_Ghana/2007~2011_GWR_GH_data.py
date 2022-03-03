#%%
# ==============================================================================
#  Program: 2007~2011_GWR_GH_data
#  Creator: Chien Hui Lin
#  Created: 2021/01
#  Updated: 
#  Purpose: 將 GWR 的GHANA資料從 nc 檔讀出
# =============================================================================
import os
import numpy as np
import pandas as pd
from netCDF4 import Dataset

path = "d:/00_work/07_GWR_Ghana"

#先將經緯度讀出(從07年把經緯度抓出來)
#ACAG_PM25_GWR_V4GL03_200001_200012_0p01.nc
for year in range(2007,2008):
    nc = Dataset(path + "/raw_data/ACAG_PM25_GWR_V4GL03_" + str(year) + "01_" + str(year) + "12_0p01.nc")

    lon  = nc.variables["LON"][:]
    lat  = nc.variables["LAT"][:]

    lon  = np.array(lon)
    lat  = np.array(lat)

    lon = lon.tolist()
    lat = lat.tolist()

#匯入 GWR 07~11 年的資料
for year in range(2007,2012):
    nc = Dataset(path + "/raw_data/ACAG_PM25_GWR_V4GL03_" + str(year) + "01_" + str(year) + "12_0p01.nc")
    
    pm25 = nc.variables["PM25"][:]

    matrix_pm25 = np.array(pm25)

    locals()["flatten_pm25_" + str(year)] = pd.DataFrame( matrix_pm25.flatten() )


#更改flatten_pm25_2007~flatten_pm25_2011變數名稱為pm25_2007~2011
for year in range(2007,2012):
   locals()["flatten_pm25_" + str(year)].columns = ["pm25_" + str(year) ] 

#%%
#製作所有lat
final_lat = pd.DataFrame()
for i in range(0,36000):
    final_lat = final_lat.append(lat)
    print("lat",i)
final_lat.columns = ["lat"]

#%%
#製作所有lon
final_lon = pd.DataFrame( lon.copy() ) 
final_lon.columns = ["lon"]
for i in range(1,12500):
    lon_temp = pd.DataFrame( lon.copy() ) 
    lon_temp.columns = ["lon" + str(i)]
    final_lon = final_lon.merge(lon_temp, left_index = True, right_index = True)
    print("lon",i)
    
#再壓扁
final_lon = pd.DataFrame( final_lon.values.flatten() )
final_lon.columns = ["lon"]


#%%
#將經緯度資料匯出成.dta
final_lon.to_stata(path + "/working_data/lon.dta", write_index = False)
final_lat.to_stata(path + "/working_data/lat.dta", write_index = False)

#%%
#將07~11年PM2.5資料匯出成.dta
for year in range(2007,2012):
   locals()["flatten_pm25_" + str(year)].to_stata(path + "/working_data/" + str(year) + "_pm25.dta", write_index = False)


