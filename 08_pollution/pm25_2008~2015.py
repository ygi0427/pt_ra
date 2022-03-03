#%%
# ==============================================================================
#  Program: Africa_pm25_and_so2_2001~2005
#  Creator: Wang  
#  Created: 2020//03/27
#  Updated: Lin
#  Purpose: KE TZ UG 2008-15
# =============================================================================
import pandas as pd
import numpy as np
import numpy
from netCDF4 import Dataset

path = "d:/00_work/08_pollution"

for y in range(2008,2011): #year_code==300
    for m in range(1,10):
        if m == 2:
            if y%4 == 0 : # y除以4餘數為0，表示該年為閏年，2月會有29天
                for i in range(1,30):
                    path_in_1 = path+"/rawdata/"+repr(y)+"/MERRA2_300.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                    path_in_2 = path+"/rawdata/"+repr(y)+"/MERRA2_300.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"    
                    path_out = path+"/working_data/excel/"+repr(y)+"/"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                    if i<10:
                        nc=Dataset(path_in_1)
                        
                        data1=nc.variables["SSSMASS25"][:]
                        matrix_a = np.array(data1)            
                        data2=nc.variables["OCSMASS"][:]
                        matrix_b = np.array(data2)
                        data3=nc.variables["BCSMASS"][:]
                        matrix_c = np.array(data3)
                        data4=nc.variables["SO4SMASS"][:]
                        matrix_d = np.array(data4)
                        data5=nc.variables["DUSMASS25"][:]
                        matrix_e = np.array(data5)
                        data6=nc.variables["SO2SMASS"][:]
                        matrix_f = np.array(data6)
                        
                        merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                        df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                        df.to_excel(path_out)

                    else:
                        nc=Dataset(path_in_2)
                        
                        data1=nc.variables["SSSMASS25"][:]
                        matrix_a = np.array(data1)            
                        data2=nc.variables["OCSMASS"][:]
                        matrix_b = np.array(data2)
                        data3=nc.variables["BCSMASS"][:]
                        matrix_c = np.array(data3)
                        data4=nc.variables["SO4SMASS"][:]
                        matrix_d = np.array(data4)
                        data5=nc.variables["DUSMASS25"][:]
                        matrix_e = np.array(data5)
                        data6=nc.variables["SO2SMASS"][:]
                        matrix_f = np.array(data6)
                        
                        merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                        df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                        df.to_excel(path_out)
            else: # y除以4餘數不為0，表示該年不為閏年，2月為28天
                for i in range(1,29):
                    path_in_1 = path+"/rawdata/"+repr(y)+"/MERRA2_300.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                    path_in_2 = path+"/rawdata/"+repr(y)+"/MERRA2_300.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"    
                    path_out = path+"/working_data/excel/"+repr(y)+"/"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                    if i<10:
                        nc=Dataset(path_in_1)
                        
                        data1=nc.variables["SSSMASS25"][:]
                        matrix_a = np.array(data1)            
                        data2=nc.variables["OCSMASS"][:]
                        matrix_b = np.array(data2)
                        data3=nc.variables["BCSMASS"][:]
                        matrix_c = np.array(data3)
                        data4=nc.variables["SO4SMASS"][:]
                        matrix_d = np.array(data4)
                        data5=nc.variables["DUSMASS25"][:]
                        matrix_e = np.array(data5)
                        data6=nc.variables["SO2SMASS"][:]
                        matrix_f = np.array(data6)
                        
                        merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                        df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                        df.to_excel(path_out)
                    else:
                        nc=Dataset(path_in_2)
                        
                        data1=nc.variables["SSSMASS25"][:]
                        matrix_a = np.array(data1)            
                        data2=nc.variables["OCSMASS"][:]
                        matrix_b = np.array(data2)
                        data3=nc.variables["BCSMASS"][:]
                        matrix_c = np.array(data3)
                        data4=nc.variables["SO4SMASS"][:]
                        matrix_d = np.array(data4)
                        data5=nc.variables["DUSMASS25"][:]
                        matrix_e = np.array(data5)
                        data6=nc.variables["SO2SMASS"][:]
                        matrix_f = np.array(data6)
                        
                        merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                        df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                        df.to_excel(path_out)

        elif m == 4 or m == 6 or m == 9:
            for i in range(1,31):
                path_in_1 = path+"/rawdata/"+repr(y)+"/MERRA2_300.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_2 = path+"/rawdata/"+repr(y)+"/MERRA2_300.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/"+repr(y)+"/"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_1)
                        
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_2)
                    
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)

        elif m == 1 or m == 3 or m == 5 or m == 7 or m == 8:
            for i in range(1,32):
                path_in_1 = path+"/rawdata/"+repr(y)+"/MERRA2_300.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_2 = path+"/rawdata/"+repr(y)+"/MERRA2_300.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/"+repr(y)+"/"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_1)
                        
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_2)
                        
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)               

    for m in range(10,13):
        if m == 10 or m == 12:
            for i in range(1,32):
                path_in_3 = path+"/rawdata/"+repr(y)+"/MERRA2_300.tavg1_2d_aer_Nx."+repr(y)+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_4 = path+"/rawdata/"+repr(y)+"/MERRA2_300.tavg1_2d_aer_Nx."+repr(y)+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/"+repr(y)+"/"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_3)
                        
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_4)
                        
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)

        elif m == 11:
            for i in range(1,31):
                path_in_3 = path+"/rawdata/"+repr(y)+"/MERRA2_300.tavg1_2d_aer_Nx."+repr(y)+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_4 = path+"/rawdata/"+repr(y)+"/MERRA2_300.tavg1_2d_aer_Nx."+repr(y)+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/"+repr(y)+"/"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_3)
                        
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_4)
                        
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)

#%%

for y in range(2011,2016): #year_code==400
    for m in range(1,10):
        if m == 2:
            if y%4 == 0 : # y除以4餘數為0，表示該年為閏年，2月會有29天
                for i in range(1,30):
                    path_in_1 = path+"/rawdata/"+repr(y)+"/MERRA2_400.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                    path_in_2 = path+"/rawdata/"+repr(y)+"/MERRA2_400.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"    
                    path_out = path+"/working_data/excel/"+repr(y)+"/"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                    if i<10:
                        nc=Dataset(path_in_1)
                        
                        data1=nc.variables["SSSMASS25"][:]
                        matrix_a = np.array(data1)            
                        data2=nc.variables["OCSMASS"][:]
                        matrix_b = np.array(data2)
                        data3=nc.variables["BCSMASS"][:]
                        matrix_c = np.array(data3)
                        data4=nc.variables["SO4SMASS"][:]
                        matrix_d = np.array(data4)
                        data5=nc.variables["DUSMASS25"][:]
                        matrix_e = np.array(data5)
                        data6=nc.variables["SO2SMASS"][:]
                        matrix_f = np.array(data6)
                        
                        merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                        df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                        df.to_excel(path_out)

                    else:
                        nc=Dataset(path_in_2)
                        
                        data1=nc.variables["SSSMASS25"][:]
                        matrix_a = np.array(data1)            
                        data2=nc.variables["OCSMASS"][:]
                        matrix_b = np.array(data2)
                        data3=nc.variables["BCSMASS"][:]
                        matrix_c = np.array(data3)
                        data4=nc.variables["SO4SMASS"][:]
                        matrix_d = np.array(data4)
                        data5=nc.variables["DUSMASS25"][:]
                        matrix_e = np.array(data5)
                        data6=nc.variables["SO2SMASS"][:]
                        matrix_f = np.array(data6)
                        
                        merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                        df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                        df.to_excel(path_out)
            else: # y除以4餘數不為0，表示該年不為閏年，2月為28天
                for i in range(1,29):
                    path_in_1 = path+"/rawdata/"+repr(y)+"/MERRA2_400.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                    path_in_2 = path+"/rawdata/"+repr(y)+"/MERRA2_400.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"    
                    path_out = path+"/working_data/excel/"+repr(y)+"/"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                    if i<10:
                        nc=Dataset(path_in_1)
                        
                        data1=nc.variables["SSSMASS25"][:]
                        matrix_a = np.array(data1)            
                        data2=nc.variables["OCSMASS"][:]
                        matrix_b = np.array(data2)
                        data3=nc.variables["BCSMASS"][:]
                        matrix_c = np.array(data3)
                        data4=nc.variables["SO4SMASS"][:]
                        matrix_d = np.array(data4)
                        data5=nc.variables["DUSMASS25"][:]
                        matrix_e = np.array(data5)
                        data6=nc.variables["SO2SMASS"][:]
                        matrix_f = np.array(data6)
                        
                        merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                        df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                        df.to_excel(path_out)
                    else:
                        nc=Dataset(path_in_2)
                        
                        data1=nc.variables["SSSMASS25"][:]
                        matrix_a = np.array(data1)            
                        data2=nc.variables["OCSMASS"][:]
                        matrix_b = np.array(data2)
                        data3=nc.variables["BCSMASS"][:]
                        matrix_c = np.array(data3)
                        data4=nc.variables["SO4SMASS"][:]
                        matrix_d = np.array(data4)
                        data5=nc.variables["DUSMASS25"][:]
                        matrix_e = np.array(data5)
                        data6=nc.variables["SO2SMASS"][:]
                        matrix_f = np.array(data6)
                        
                        merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                        df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                        df.to_excel(path_out)

        elif m == 4 or m == 6 or m == 9:
            for i in range(1,31):
                path_in_1 = path+"/rawdata/"+repr(y)+"/MERRA2_400.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_2 = path+"/rawdata/"+repr(y)+"/MERRA2_400.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/"+repr(y)+"/"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_1)
                        
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_2)
                    
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)

        elif m == 1 or m == 3 or m == 5 or m == 7 or m == 8:
            for i in range(1,32):
                path_in_1 = path+"/rawdata/"+repr(y)+"/MERRA2_400.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_2 = path+"/rawdata/"+repr(y)+"/MERRA2_400.tavg1_2d_aer_Nx."+repr(y)+"0"+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/"+repr(y)+"/"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_1)
                        
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_2)
                        
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)               

    for m in range(10,13):
        if m == 10 or m == 12:
            for i in range(1,32):
                path_in_3 = path+"/rawdata/"+repr(y)+"/MERRA2_400.tavg1_2d_aer_Nx."+repr(y)+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_4 = path+"/rawdata/"+repr(y)+"/MERRA2_400.tavg1_2d_aer_Nx."+repr(y)+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/"+repr(y)+"/"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_3)
                        
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_4)
                        
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)

        elif m == 11:
            for i in range(1,31):
                path_in_3 = path+"/rawdata/"+repr(y)+"/MERRA2_400.tavg1_2d_aer_Nx."+repr(y)+repr(m)+"0"+repr(i)+".nc4.nc4"
                path_in_4 = path+"/rawdata/"+repr(y)+"/MERRA2_400.tavg1_2d_aer_Nx."+repr(y)+repr(m)+repr(i)+".nc4.nc4"
                path_out = path+"/working_data/excel/"+repr(y)+"/"+repr(y)+"_"+repr(m)+"_"+repr(i)+".xlsx"
                if i<10:
                    nc=Dataset(path_in_3)
                        
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)
                else:
                    nc=Dataset(path_in_4)
                        
                    data1=nc.variables["SSSMASS25"][:]
                    matrix_a = np.array(data1)            
                    data2=nc.variables["OCSMASS"][:]
                    matrix_b = np.array(data2)
                    data3=nc.variables["BCSMASS"][:]
                    matrix_c = np.array(data3)
                    data4=nc.variables["SO4SMASS"][:]
                    matrix_d = np.array(data4)
                    data5=nc.variables["DUSMASS25"][:]
                    matrix_e = np.array(data5)
                    data6=nc.variables["SO2SMASS"][:]
                    matrix_f = np.array(data6)
                        
                    merge=np.vstack((matrix_a.flatten(),matrix_b.flatten(),matrix_c.flatten(),matrix_d.flatten(),matrix_e.flatten(),matrix_f.flatten()))
                    df=pd.DataFrame(merge.T,columns=list('BCDEFG'))                
                        
                    df.to_excel(path_out)