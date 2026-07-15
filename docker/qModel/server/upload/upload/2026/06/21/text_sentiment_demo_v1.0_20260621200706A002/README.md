# 文本情感分析模型说明文档

## 模型名称
text_sentiment_demo

## 功能描述
基于规则的中文文本情感分析模型，输入一段文本，输出情感标签（正向/负向/中性）、置信分数和命中关键词。

## 模型类型
- 语言：Python 3.7+
- 类型：规则分类模型（可扩展为 ML 模型）
- 版本：v1.0.0

## 目录结构
```
text_sentiment_demo/
├── main.py           # 模型入口文件（qModel 调用 run() 函数）
├── requirements.txt  # 依赖声明（当前无外部依赖）
├── input.json        # 输入示例文件
└── README.md         # 本说明文档
```

## 输入格式
JSON 文件，字段说明：

| 字段  | 类型   | 必填 | 说明           |
|-------|--------|------|----------------|
| text  | string | 是   | 待分析的中文文本 |

示例：
```json
{
  "text": "这个产品真的很棒，非常满意，强烈推荐！"
}
```

## 输出格式
JSON 文件，字段说明：

| 字段     | 类型    | 说明                     |
|----------|---------|--------------------------|
| label    | string  | 情感标签：正向/负向/中性  |
| score    | float   | 置信分数，范围 0.0~1.0   |
| keywords | array   | 命中的情感关键词列表      |

示例：
```json
{
  "label": "正向",
  "score": 0.84,
  "keywords": ["棒", "满意", "推荐"]
}
```

## qModel 平台运行方式
qModel 平台会：
1. 将用户输入写入 `input.json`（或通过环境变量 `INPUT_FILE` 指定路径）
2. 调用 `python main.py`，执行 `run()` 函数
3. 读取 `output.json`（或通过环境变量 `OUTPUT_FILE` 指定路径）作为模型输出

## 本地验证方式
```bash
python main.py
```
直接运行将执行内置的4个测试用例，验证模型逻辑。

## 扩展说明
如需升级为机器学习版本（如使用 scikit-learn 或 transformers），在 requirements.txt 中添加对应依赖，并在 main.py 中替换 predict() 函数实现即可，qModel 平台调用接口保持不变。
