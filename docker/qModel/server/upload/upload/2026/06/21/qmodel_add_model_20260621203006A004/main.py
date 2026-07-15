# -*- coding: utf-8 -*-
"""
qModel 示例模型：加法运算
输入：命令行参数 x y（两个数字）
输出：x+y 的和，打印到标准输出
"""

import sys


def main():
    if len(sys.argv) < 3:
        print("用法: python main.py <x> <y>")
        sys.exit(1)

    x = float(sys.argv[1])
    y = float(sys.argv[2])
    return (x + y)


if __name__ == "__main__":
    main()
