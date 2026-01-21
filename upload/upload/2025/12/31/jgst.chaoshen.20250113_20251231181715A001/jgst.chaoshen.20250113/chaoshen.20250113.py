import math;
import pandas as pd;
import numpy as np;
import json;

########## 0.定义基本参数 ##########

#### IK表示选择哪个下渗曲线 ####
#### 0表示选取霍尔顿型 1表示选取菲利普型 ####
IK = 0;
#### 模型输入文件
json_input_file = r'data_input.json'
#### 模型输入保存文件
json_output_file = r'data_output.json'
#### 参数T0需要提前定义，用来计算ST，最终求得土壤含水率WT ####
T0 = 0;

########## 1.读取模型输入、单位线、参数 ##########

# 1.1 读取模型输入
# 打开文件并读取JSON数据
with open(json_input_file, 'r') as file:
    data_input = json.load(file)
# 读取蒸发数据
## EM：时段流域蒸散发能力（mm）
EM = data_input['EM']
size_EM = len(EM);
N  = size_EM;   ## N：计算时段数
# 读取降雨数据
## P：时段降雨（mm）
P = data_input['P']
# 读取气温数据
## P：时段降雨（mm）
T= data_input['T']

# 1.2 读取模型单位线
# 定义需要打开的文件名
json_UH_file = r'data_UH.json'
# 打开文件并读取JSON数据
with open(json_UH_file, 'r') as file:
    data_UH = json.load(file)
# 读取蒸发数据
## EM：时段流域蒸散发能力（mm）
UH = data_UH['UH']

# 1.3 读取模型参数
# 定义需要打开的文件名
json_parameter_file = r'data_parameter.json'
# 打开文件并读取JSON数据
with open(json_parameter_file, 'r') as file:
    data_parameter = json.load(file)
#### IK=0对应霍尔顿型需要的参数 ####
if IK == 0: 
    F0   = data_parameter['F0'];    # 流域平均最大下渗能力	mm/h
    FC   = data_parameter['FC'];    # 流域平均稳定下渗能力	mm/h
    K    = data_parameter['K'];     # 下渗能力衰减系数	h-1
    DW   = data_parameter['DW'];    # 迭代计算时，对土壤含水量的允许误差	mm
    BX   = data_parameter['BX'];    # 流域下渗能力分布曲线指数
    AREA = data_parameter['AREA'];  # 流域面积	km2
    WT   = data_parameter['WT'];    # 土壤含水量	mm
    DT   = data_parameter['DT'];    # 计算时段步长	h
#### IK=1对应菲利普型需要的参数 ####
elif IK == 1:
    A    = data_parameter['A'];     # 菲利普下渗曲线参数	mm/h
    B    = data_parameter['B'];     # 菲利普下渗曲线参数	mm/h0.5
    BX   = data_parameter['BX'];    # 流域下渗能力分布曲线指数
    AREA = data_parameter['AREA'];  # 流域面积	km2
    W    = data_parameter['W'];     # 土壤含水量	mm
    DT   = data_parameter['DT'];    # 计算时段步长	h

########## 2.数据初始化 ##########
#### 数据初始化
Q    = [0 for i in range(N)];   ## Q：出流量（m3/s）
PES  = [0 for i in range(N)];
FS   = [0 for i in range(N)];
T0S  = [0 for i in range(N)];
RS   = [0 for i in range(N)];
STS  = [0 for i in range(N)];
WTS  = [0 for i in range(N)];
FMMS = [0 for i in range(N)];
M    = [0 for i in range(N)];  # 融雪水量（mm/d） 
d    = 0.69;  # 度日因子（mmoC/d） 取值范围：0.5~7
T00  = 1.13;  # 临界温度（oC）  取值范围：-1.0~2.7

########## 3.融雪模块 ##########

for K in range(N):
    # T_if = T[K];
    if T[K] > T00:
        M[K] = d*(T[K]-T00)/24;

########## 4.产汇流计算 ##########

for L in range(N):
    PE = P[L]+M[L]-EM[L];
    PES[L] = PE;
    if PE <= 0:
        WT = WT+P[L]-EM[L]
        R  = 0;
        if WT < 0:
            WT = 0;
    else:
        if IK == 0:
            T0 = WT/F0;
            ## ST表示土壤含水量W的第一个近似值ST
            ST = FC*T0+(1-math.exp(-K*T0))*(F0-FC)/K; 
            for II in range(100):
                if II == 100:
                    print("模型不收敛");
                if abs(ST-WT)>DW:
                    F  = F0-K*(ST-FC*T0);
                    T0 = T0+(WT-ST)/F;
                    ST = FC*T0+(1-math.exp(-K*T0))*(F0-FC)/K;  
                else:
                    F = F0-K*(ST-FC*T0);
                    break
        elif IK == 1:
            F  = math.pow(B, 2)*(1+math.sqrt(1+A*WT/(math.pow(B, 2))))/WT+A;
        F   = F*DT;
        FMM = F*(1+BX);
        FS[L] = F;
        T0S[L] = T0;
        if PE >= FMM:
            R  = PE-F;
            WT = WT+F;
        elif PE > 0 and PE < FMM:                
            R  = PE-F+F*math.pow((1-PE/FMM), (1+BX));
            WT = WT+PE-R;
        RS[L] = R;
        STS[L] = ST;
        WTS[L] = WT;
        FMMS[L] = FMM;
    for J in range(len(UH)):
        if L+J <= N-1:
            Q[L+J]=Q[L+J]+R*UH[J];

for I in range(N):
    Q[I-1] = Q[I-1]*AREA/3.6/DT; 
# print(Q)
print(type(Q))

########## 5.计算结果保存 ##########

# 将结果保存成json文件
data_Q = {"Q": Q}  # 代表单位线
data_output = json.dumps(data_Q, ensure_ascii=False, indent=4)
# df.to_excel(excel_file_output, header=custom_header, index=False, engine='openpyxl')
with open(json_output_file, 'w', encoding='utf-8') as file:
    json.dump(data_output, file, ensure_ascii=False, indent=4)
