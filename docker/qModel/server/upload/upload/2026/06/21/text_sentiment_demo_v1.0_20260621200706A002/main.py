# -*- coding: utf-8 -*-
"""
qModel 示例模型：文本情感分析（规则版）
入口文件：main.py
接口：调用 predict(input_data) 即可
"""

import json


def predict(input_data: dict) -> dict:
    """
    输入：
        input_data = {
            "text": "待分析的文本内容"
        }
    输出：
        {
            "label": "正向 / 负向 / 中性",
            "score": 0.0~1.0,
            "keywords": ["关键词1", "关键词2"]
        }
    """
    text = input_data.get("text", "").strip()

    if not text:
        return {
            "label": "中性",
            "score": 0.5,
            "keywords": [],
            "message": "输入为空，默认返回中性"
        }

    # 简单规则：正向 / 负向关键词匹配
    positive_words = ["好", "棒", "优秀", "喜欢", "满意", "推荐", "完美", "赞", "不错", "出色", "强", "牛"]
    negative_words = ["差", "烂", "糟糕", "讨厌", "不满", "失望", "垃圾", "坏", "差劲", "难用", "慢", "崩"]

    pos_count = sum(1 for w in positive_words if w in text)
    neg_count = sum(1 for w in negative_words if w in text)

    hit_keywords = [w for w in positive_words + negative_words if w in text]

    if pos_count > neg_count:
        label = "正向"
        score = round(min(0.6 + pos_count * 0.08, 0.99), 2)
    elif neg_count > pos_count:
        label = "负向"
        score = round(max(0.4 - neg_count * 0.08, 0.01), 2)
    else:
        label = "中性"
        score = 0.5

    return {
        "label": label,
        "score": score,
        "keywords": hit_keywords
    }


# ── qModel 平台调用入口 ──────────────────────────────────────────
# qModel 会读取 input.json，调用 run()，把结果写入 output.json

def run():
    import os

    input_path = os.environ.get("INPUT_FILE", "input.json")
    output_path = os.environ.get("OUTPUT_FILE", "output.json")

    with open(input_path, "r", encoding="utf-8") as f:
        input_data = json.load(f)

    result = predict(input_data)

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(result, f, ensure_ascii=False, indent=2)

    print(f"[qModel] 执行完成，结果：{json.dumps(result, ensure_ascii=False)}")


# ── 本地调试入口 ─────────────────────────────────────────────────
if __name__ == "__main__":
    test_cases = [
        {"text": "这个产品真的很棒，非常满意，强烈推荐！"},
        {"text": "太差了，完全糟糕，垃圾产品，非常失望。"},
        {"text": "今天天气一般，没什么特别的感觉。"},
        {"text": ""},
    ]

    print("=" * 50)
    print("qModel 示例模型 - 本地调试运行")
    print("=" * 50)
    for i, case in enumerate(test_cases, 1):
        result = predict(case)
        print(f"\n[测试 {i}] 输入: {case}")
        print(f"         输出: {json.dumps(result, ensure_ascii=False)}")
