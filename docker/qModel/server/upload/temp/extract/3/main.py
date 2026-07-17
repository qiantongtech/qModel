import json
import sys
import numpy as np
from scipy.optimize import curve_fit

# 读取水位流量实测数据
def load_hq_json():
    with open("data.json", "r", encoding="utf-8") as f:
        data = json.load(f)
    H_arr = np.array(data["H"], dtype=np.float64)
    Q_arr = np.array(data["Q"], dtype=np.float64)
    return H_arr, Q_arr

# 水位流量幂函数模型
def hq_model(H, a, H0, b):
    diff = H - H0
    diff[diff < 0] = 0
    return a * np.power(diff, b)

# 计算拟合优度R²
def calc_r2(y_true, y_pred):
    ss_res = np.sum((y_true - y_pred) ** 2)
    ss_tot = np.sum((y_true - np.mean(y_true)) ** 2)
    return 1 - ss_res / ss_tot

H_obs, Q_obs = load_hq_json()
# 非线性拟合
p0 = [8, 0.0, 2.1]
params, cov = curve_fit(hq_model, H_obs, Q_obs, p0=p0)
a_fit, H0_fit, b_fit = params
# 预计算R²
Q_fit = hq_model(H_obs, a_fit, H0_fit, b_fit)
r2 = calc_r2(Q_obs, Q_fit)

def predict(input_dict: dict) -> dict:
    """
    入参：dict，只需要1个key：H（水位数值）
    示例输入JSON：{"H":2.6}
    """
    h = float(input_dict.get("H", 0.0))
    d = max(h - H0_fit, 0.0)
    q_pred = a_fit * (d ** b_fit)
    return {
        "input_water_level": round(h, 2),
        "predict_flow": round(q_pred, 2),
        "fit_info": {
            "a": round(a_fit, 4),
            "H0": round(H0_fit, 4),
            "b": round(b_fit, 4),
            "r2": round(r2, 4)
        },
        "formula": f"Q = {round(a_fit,4)} * (H - {round(H0_fit,4)})^{round(b_fit,4)}"
    }

def main():
    try:
        input_json = sys.stdin.read()
        input_data = json.loads(input_json)
        result = predict(input_data)
        print(json.dumps(result, ensure_ascii=False))
    except Exception as e:
        print(json.dumps({"error": str(e)}, ensure_ascii=False))

if __name__ == "__main__":
    main()