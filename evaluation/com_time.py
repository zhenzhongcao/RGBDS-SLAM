import argparse

def calculate_average_from_file(file_path):
    total = 0
    count = 0

    # 打开文件进行读取
    with open(file_path, 'r') as file:
        # 逐行读取文件
        for line in file:
            try:
                # 将每一行转换为浮点数并累加
                total += float(line.strip())  # 使用strip()去除可能的换行符
                count += 1
            except ValueError:
                # 如果遇到无法转换为浮点数的内容，则跳过该行
                print(f"无法转换这一行的内容为浮点数: {line.strip()}")

    # 计算平均值
    if count > 0:
        average = total / count
        return average
    else:
        return None  # 如果没有有效的数字行，返回None

def main():
    # 设置命令行参数解析
    parser = argparse.ArgumentParser(description="计算文件中浮点数的平均值")
    parser.add_argument('file_path', type=str, help="输入文件的路径")
    
    # 解析命令行参数
    args = parser.parse_args()
    
    # 获取文件路径
    file_path = args.file_path
    
    # 调用函数计算平均值
    average1 = calculate_average_from_file(file_path + "TrackingTime.txt")
    average2 = calculate_average_from_file(file_path + "MappingTime.txt")

    if average1 is not None:
        print(f"Tracking FPS: {1 / average1}")
    else:
        print("文件中没有有效的浮点数数据")
    if average2 is not None:
        print(f"Mapping FPS: {1000 / average2}")
    else:
        print("文件中没有有效的浮点数数据")

if __name__ == "__main__":
    main()
