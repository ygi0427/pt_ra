'''
 ==============================================================================
#  Program: district
#  Creator: Chien Hui Lin
#  Created: 2021/08
#  Updated: 2021/11
#  Purpose: 讀取.tiff數值並儲存為.csv
# =============================================================================
'''

#do monthly

import rasterio
import pandas as pd
import os
import numpy as np
from netCDF4 import Dataset
import fiona
from shapely.geometry import shape, Point

dirc = '/Volumes/My Passport/08_TIFF'
rawpath = dirc + '/rawdata/vcm'
'''
平均的DNB輻射值(副檔名avg_rade9.tif)
平均中使用的無雲觀測的總數量 cloud free coverage count (副檔名cf_cvg.tif)
不考慮雲層覆蓋的DNB觀測的總數量 coverage count (副檔名cvg.tif)
'''
for fpathe,dirs,fs in os.walk(rawpath): #all
    for F in fs:
        if(("avg_rade9h" in F) and ("._SVDNB" not in F)): #only avg_rade9.tif
            path = os.path.join(fpathe,F) #tif path
            print("path=", path)
            yyyymm = F.replace("SVDNB_npp_",'').split("01-20")[0] #file name: SVDNB_npp_20180801-20180831 ->keep yyyymm
            print(yyyymm)

            ras = rasterio.open(path)
            print(ras.width, ras.height) #86401 * 33601,

            # that x = 0~18000：緯 y = 0~28800：經
            print(ras.indexes) #1index
            print(ras.bounds) #60E~180E 75N~0N

            #TW 21.5~26.5N 118~124E
            x, y = 11500, 13400 #(115.83333378, 27.08333295)
            print(ras.xy(x,y)) #x y 的實際座標(經度,緯度)
            x, y = 13000, 16400 #(128.33333388, 20.833332900000002)
            print(ras.xy(x,y))

            #units of x & y are 15 arc second (15/3600 = 1/240 deg)
            #so when x or y changes by 24 unit, that is 0.1 degree
            band_arr = ras.read(1)
            out = 'lat,lon,value\n'

            for x in range(11500, 13000, 12): #in33600
                for y in range(13400, 16400, 12): #in86400
                    coor = str(ras.xy(x,y))
                    lon = coor.replace('(','').replace(')','').replace(' ','').split(',')[0]
                    lat = coor.replace('(','').replace(')','').replace(' ','').split(',')[1]
                    print(lon, lat)
                    out = out + lat + ',' + lon + ',' + str(band_arr[x, y]) + '\n'

            saveto = dirc + '/working_data/tiffcsv/' + yyyymm + '_tiff.csv'
            with open(saveto, 'w') as fin:
                fin.write(out)
