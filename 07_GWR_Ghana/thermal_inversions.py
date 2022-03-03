# -*- coding: utf-8 -*-
"""
Created on Wed Jan 30 09:21:44 2019

@author: user
"""

#%%
import os
import pandas as pd
import numpy as np
from netCDF4 import Dataset


path = "d:/00_work/07_GWR_Ghana"


for y in range(2008,2011):
    folder = os.path.exists(path+"/working_data/excel/GH"+repr(y))
    if not folder:
        os.makedirs(path+"/working_data/excel/GH"+repr(y))
    for m in range(1,10):
        if m == 2:
            if y%4 == 0 : # y除以4餘數為0，表示該年為閏年，2月會有29天
                for i in range(1,30):
                    path_in_1 = path+"/nc4raw_data/MERRA2_300.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                    path_in_2 = path+"/nc4raw_data/MERRA2_300.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"
                    path_out = path+"/working_data/excel/GH"+repr(y)+"/GH"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                    if i<10:
                        nc=Dataset(path_in_1)
                        data=nc.variables["T"][:]
                        matrix_b = np.array(data)
                        matrix_b.flatten()
                        df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                        df.to_excel(path_out)
                    else:
                        nc=Dataset(path_in_2)
                        data=nc.variables["T"][:]
                        matrix_b = np.array(data)
                        matrix_b.flatten()
                        df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                        df.to_excel(path_out)

            else: # y除以4餘數不為0，表示該年不為閏年，2月為28天
                for i in range(1,29):
                    path_in_1 = path+"/nc4raw_data/MERRA2_300.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                    path_in_2 = path+"/nc4raw_data/MERRA2_300.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"
                    path_out = path+"/working_data/excel/GH"+repr(y)+"/GH"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                    if i<10:
                        nc=Dataset(path_in_1)
                        data=nc.variables["T"][:]
                        matrix_b = np.array(data)
                        matrix_b.flatten()
                        df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                        df.to_excel(path_out)
                    else:
                        nc=Dataset(path_in_2)
                        data=nc.variables["T"][:]
                        matrix_b = np.array(data)
                        matrix_b.flatten()
                        df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                        df.to_excel(path_out)

        elif m == 4 or m == 6 or m == 9:
            for i in range(1,31):
                path_in_1 = path+"/nc4raw_data/MERRA2_300.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_2 = path+"/nc4raw_data/MERRA2_300.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/GH"+repr(y)+"/GH"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_1)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_2)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)


        elif m == 1 or m == 3 or m == 5 or m == 7 or m == 8:
            for i in range(1,32):
                path_in_1 = path+"/nc4raw_data/MERRA2_300.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_2 = path+"/nc4raw_data/MERRA2_300.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/GH"+repr(y)+"/GH"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_1)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_2)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)                

    for m in range(10,13):
        if m == 10 or m == 12:
            for i in range(1,32):
                path_in_3 = path+"/nc4raw_data/MERRA2_300.inst6_3d_ana_Np."+repr(y)+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_4 = path+"/nc4raw_data/MERRA2_300.inst6_3d_ana_Np."+repr(y)+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/GH"+repr(y)+"/GH"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_3)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_4)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)

        elif m == 11:
            for i in range(1,31):
                path_in_3 = path+"/nc4raw_data/MERRA2_300.inst6_3d_ana_Np."+repr(y)+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_4 = path+"/nc4raw_data/MERRA2_300.inst6_3d_ana_Np."+repr(y)+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/GH"+repr(y)+"/GH"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_3)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_4)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)


for y in range(2011,2012):
    folder = os.path.exists(path+"/working_data/excel/GH"+repr(y))
    if not folder:
        os.makedirs(path+"/working_data/excel/GH"+repr(y))
    for m in range(1,10):
        if m == 2:
            if y%4 == 0 : # y除以4餘數為0，表示該年為閏年，2月會有29天
                for i in range(1,30):
                    path_in_1 = path+"/nc4raw_data/MERRA2_400.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                    path_in_2 = path+"/nc4raw_data/MERRA2_400.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"
                    path_out = path+"/working_data/excel/GH"+repr(y)+"/GH"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                    if i<10:
                        nc=Dataset(path_in_1)
                        data=nc.variables["T"][:]
                        matrix_b = np.array(data)
                        matrix_b.flatten()
                        df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                        df.to_excel(path_out)
                    else:
                        nc=Dataset(path_in_2)
                        data=nc.variables["T"][:]
                        matrix_b = np.array(data)
                        matrix_b.flatten()
                        df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                        df.to_excel(path_out)

            else: # y除以4餘數不為0，表示該年不為閏年，2月為28天
                for i in range(1,29):
                    path_in_1 = path+"/nc4raw_data/MERRA2_400.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                    path_in_2 = path+"/nc4raw_data/MERRA2_400.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"
                    path_out = path+"/working_data/excel/GH"+repr(y)+"/GH"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                    if i<10:
                        nc=Dataset(path_in_1)
                        data=nc.variables["T"][:]
                        matrix_b = np.array(data)
                        matrix_b.flatten()
                        df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                        df.to_excel(path_out)
                    else:
                        nc=Dataset(path_in_2)
                        data=nc.variables["T"][:]
                        matrix_b = np.array(data)
                        matrix_b.flatten()
                        df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                        df.to_excel(path_out)

        elif m == 4 or m == 6 or m == 9:
            for i in range(1,31):
                path_in_1 = path+"/nc4raw_data/MERRA2_400.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_2 = path+"/nc4raw_data/MERRA2_400.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/GH"+repr(y)+"/GH"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_1)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_2)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)


        elif m == 1 or m == 3 or m == 5 or m == 7 or m == 8:
            for i in range(1,32):
                path_in_1 = path+"/nc4raw_data/MERRA2_400.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_2 = path+"/nc4raw_data/MERRA2_400.inst6_3d_ana_Np."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/GH"+repr(y)+"/GH"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_1)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_2)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)

    for m in range(10,13):
        if m == 10 or m == 12:
            for i in range(1,32):
                path_in_3 = path+"/nc4raw_data/MERRA2_400.inst6_3d_ana_Np."+repr(y)+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_4 = path+"/nc4raw_data/MERRA2_400.inst6_3d_ana_Np."+repr(y)+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/GH"+repr(y)+"/GH"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_3)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_4)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)

        elif m == 11:
            for i in range(1,31):
                path_in_3 = path+"/nc4raw_data/MERRA2_400.inst6_3d_ana_Np."+repr(y)+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_4 = path+"/nc4raw_data/MERRA2_400.inst6_3d_ana_Np."+repr(y)+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/GH"+repr(y)+"/GH"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_3)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_4)
                    data=nc.variables["T"][:]
                    matrix_b = np.array(data)
                    matrix_b.flatten()
                    df=pd.DataFrame(matrix_b.flatten(),columns=list('T'))
                    df.to_excel(path_out)


