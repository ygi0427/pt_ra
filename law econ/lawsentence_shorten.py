'''
Project by ygi0427
Started_181129.
using to get 案號、日期、案由、判決長度
output 分為 三年 up down 其他 三類
Ended_181226.
'''


import os
path = r'/Users/ygi/Downloads/刑事判決更新'
for fpathe,dirs,fs in os.walk(path):
    for f in fs:
        result = os.path.join(fpathe,f) #遍歷資料夾
        #print(result)
        global T
        T = 0
        print(result)

        with open(result, mode='r', encoding='utf-8', errors = 'ignore') as file:
            output = []  #輸出案號、案由、判決長度
            if (file.readline != -1):
                content1 = file.readline()
                if(content1.find('字號') != -1):
                    content1 = content1.replace(",",'.')
                    Content1 = content1.split(".")
                    content2 = file.readline()
                    print(content1) #案號
                    print(Content1[4])
                    print(content2) #案由
                    out = content1.replace("\n",'') + ','\
                          + Content1[4] + ',' \
                          + content2.replace("\n",'')
                    content = file.readlines()
                    #print(type(content))
                    Content =''
                    i = len(content)

                    for a in range(i):
                        Content += content[a]
                    #content.strip("\n")

                    Content = Content.replace(" ", "")
                    Content = Content.replace("\n", "")
                    Content = Content.replace("\u3000", "")

                    #print("Content:", Content)
                    sentence = Content.find("有期徒刑")#"處有期徒刑"的位置(有期徒刑才處理
                    take = Content.split("有期徒刑")

                    if (sentence != -1): #只做有期徒刑
                        Con1 = Content.split('主文')
                        if len(Con1) >= 2:
                            Con2 = Con1[1]  # 主文後全部
                        Con3 = Con2.split('理由')
                        Con4 = Con3[0]
                        Con5 = Con4.split('事實')
                        Content = Con5[0]  # 只取主文
                        minus = Content.find("減為有期徒刑") #若減刑

                        #有期徒刑
                        #print(take)
                        takex = take[1] #處有期徒刑後的部份
                        take1 = takex.split("，")
                        take1_ = take1[0]
                        take2 = take1_.split("。")
                        take2_ = take2[0]
                        take3 = take2_.split("；")
                        take3_ = take3[0]
                        take4 = take3_.split("、")
                        take4_ = take4[0]
                        take5 = take4_.split("確定")
                        take5_ = take5[0]
                        take6 = take5_.split('（')
                        take6_ = take6[0]
                        take7 = take6_.split('並')
                        take7_ = take7[0]
                        take8 = take7_.split('及')
                        take8_ = take8[0]
                        take9 = take7_.split('「')
                        time1st = take9[0]#處有期徒刑後到標點符號之間
                        print(time1st)
                        out = out + ',' + time1st

                        time2nd = ''
                        if (minus != -1 and take != -1):  # 減刑
                            t = type(sentence)
                            # print("sent", t)
                            Minus = Content.split("減為有期徒刑")
                            minus = Minus[1]
                            take1 = minus.split("，")
                            take1_ = take1[0]
                            take2 = take1_.split("。")
                            take2_ = take2[0]
                            take3 = take2_.split("；")
                            take3_ = take3[0]
                            take4 = take3_.split("、")
                            take4_ = take4[0]
                            take5 = take4_.split("確定")
                            take5_ = take5[0]
                            take6 = take5_.split('（')
                            take6_ = take6[0]
                            take7 = take6_.split('並')
                            take7_ = take7[0]
                            take8 = take7_.split('及')
                            take8_ = take8[0]
                            take9 = take7_.split('「')
                            time1st = take9[0]
                            time2nd = take8[0]
                            print(time2nd)
                            out = out + ',' + time2nd
                        else:
                            time2nd = time1st
                            print(time2nd)
                            out = out + ',' + time2nd
                        # 轉數字start
                        if (time1st):
                            CN_NUM = {'零': 0, '壹': 1, '貳': 2, '參': 3, '肆': 4, '伍': 5,
                                      '陸': 6, '柒': 7, '捌': 8, '玖': 9,
                                      '一': 1, '二': 2, '三': 3, '四': 4, '五': 5,
                                      '六': 6, '七': 7, '八': 8, '九': 9, '': 3,
                                      '１': 1, '２': 2, '３': 3, '４': 4, '５': 5,
                                      '６': 6, '７': 7, '８': 8, '９': 9,
                                    '1': 1, '2': 2, '3': 3,'4': 4, '5': 5,
                                   '6': 6, '7': 7, '8': 8, '9': 9}

                            ZERO = {'0': 10}
                            #9+1=10 十月
                            CN_UNIT = {
                                '十': 10,
                                '拾': 10,
                                '百': 100,
                                '佰': 100,
                                '千': 1000,
                                '仟': 1000,
                                '萬': 10000,
                                '億': 100000000,
                                '兆': 1000000000000,
                            }


                            def chinese_to_arabic(cn: str) -> int:
                                unit = 0  # current
                                ldig = []  # digest
                                cn = str(cn)
                                for cndig in reversed(cn):
                                    if cndig in CN_UNIT:
                                        unit = CN_UNIT.get(cndig)
                                        if unit == 10000 or unit == 100000000:
                                                ldig.append(unit)
                                                unit = 1
                                    elif cndig in (ZERO):
                                        unit = ZERO.get(cndig)
                                    elif cndig in (CN_NUM):
                                        dig = CN_NUM.get(cndig)
                                        if unit:
                                            dig *= unit
                                            unit = 0
                                        ldig.append(dig)
                                    elif cndig in (CN_NUM):
                                        return int(cn)

                                    else:
                                        print("N/A")
                                        global out
                                        out += "N/A\n"
                                        T = -11111
                                        return -11111
                                if unit == 10:
                                    ldig.append(10)
                                val, tmp = 0, 0
                                for x in reversed(ldig):
                                    if x == 10000 or x == 100000000:
                                        val += tmp * x
                                        tmp = 0
                                    else:
                                        tmp += x
                                val += tmp
                                return val
                        # 轉數字end

                        Y = time1st.find('年')
                        M = time1st.find('月')
                        if (Y != -1 and M == -1):#如果只有「年」
                            y = time1st.split('年')
                            Y = y[0]
                            if type(Y) == int:
                                Y = Y
                            else:
                                M1 = chinese_to_arabic(Y)
                                Y = M1
                                Y = int(M1) * 12
                                #print (Y)
                        elif (M != -1 and Y == -1):#如果只有「月」
                            m = time1st.split('月')
                            M = m[0]
                            #print (type(m))
                            if type(M) == int:
                                M = M
                            else:
                                M2 = chinese_to_arabic(M)
                                M = int(M2)
                                #print('M',M)
                        elif(M != -1 and Y != -1): #如果有年且有月
                            y = time1st.split('年')
                            Y = y[0]
                            if type(Y) == int:
                                Y = Y
                                M = M
                            else:
                                M1 = chinese_to_arabic(Y)
                                Y = M1
                                Y = int(M1) * 12
                                m = time1st.split('月')
                                M_ = m[0]
                                Mo = M_.split('年')
                                if len(Mo) >= 2:
                                    M = Mo[1]
                                # print (type(m))
                                M2 = chinese_to_arabic(M)
                                M = int(M2)
                                #print(type(M))
                                #print('m',M)
                        if (Y != -1 and M != -1 and T >= 0):#年月
                            Time = int(Y + M)
                        elif (Y == -1 and M != -1 and T >= 0):#月
                            Time = int(M)
                        elif (Y != -1 and M == -1 and T >= 0):#年
                            Time = int(Y)
                        else:#皆無
                            Time = -11111

                        Y = time2nd.find('年')
                        M = time2nd.find('月')
                        if (Y != -1 and M == -1):#如果只有「年」
                            y = time2nd.split('年')
                            Y = y[0]
                            M1 = chinese_to_arabic(Y)
                            Y = M1
                            Y = int(M1) * 12
                            #print (Y)
                        elif (M != -1 and Y == -1):#如果只有「月」
                            m = time2nd.split('月')
                            M = m[0]
                            #print (type(m))
                            M2 = chinese_to_arabic(M)
                            M = int(M2)
                            #print('M',M)
                        elif(M != -1 and Y != -1): #如果有年且有月
                            y = time2nd.split('年')
                            Y = y[0]
                            M1 = chinese_to_arabic(Y)
                            Y = M1
                            Y = int(M1) * 12
                            m = time2nd.split('月')
                            M_ = m[0]
                            Mo = M_.split('年')
                            if len(Mo) >= 2:
                                M = Mo[1]
                            # print (type(m))
                            M2 = chinese_to_arabic(M)
                            M = int(M2)
                            #print(type(M))
                            #print('m',M)
                        if (Y != -1 and M != -1 and T >= 0):#年月
                            TTime = Y + M
                        elif (Y == -1 and M != -1 and T >= 0):#月
                            TTime = M
                        elif (Y != -1 and M == -1 and T >= 0):#年
                            TTime = Y
                        else:#皆無
                            TTime = -22222


                        print(Time) #刑期
                        print(TTime) #減刑後
                        T = Time
                        TT = TTime
                        Times = str(T)
                        TTimes = str(TT)
                        out = out + ',' + Times + ',' + TTimes +"\n"
                        print(out)
                    else:
                        print("非有期徒刑")
                        T = -11111
                        out = out + ',' + "非有期徒刑\n"

                    if(T >= 36): #大於三年
                        with open(r'/Users/ygi/Desktop/大於三年.csv', 'a', encoding='utf-8')as fin:
                            fin.write(out)
                            fin.close()
                    elif(T < 36 and T > 0): #小於三年
                        with open(r'/Users/ygi/Desktop/小於等於三年.csv', 'a', encoding='utf-8')as fin:
                            fin.write(out)
                            fin.close()
                    else: #其他
                        with open(r'/Users/ygi/Desktop/其他.csv', 'a', encoding='utf-8')as fin:
                            fin.write(out)
                            fin.close()