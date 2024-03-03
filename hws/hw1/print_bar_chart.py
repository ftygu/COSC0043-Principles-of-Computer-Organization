import matplotlib.pyplot as plt

# GPU 数据
gpu_names = [gpu.name for gpu in gpu_list]
costs_per_image = [gpu.calculate_cost_per_image() for gpu in gpu_list]

# 绘制柱状图
plt.figure(figsize=(14, 8))
plt.barh(gpu_names, costs_per_image, color='skyblue')
plt.xlabel('Cost per Image (USD)')
plt.title('Cost per Image for Different GPUs')
plt.gca().invert_yaxis()  # 反转Y轴，使最高条位于顶部
plt.tight_layout()

# 显示图表
plt.show()
