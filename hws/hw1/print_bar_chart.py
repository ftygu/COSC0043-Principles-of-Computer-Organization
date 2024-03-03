import matplotlib.pyplot as plt

gpu_names = [gpu.name for gpu in gpu_list]
costs_per_image = [gpu.calculate_cost_per_image() for gpu in gpu_list]

plt.figure(figsize=(14, 8))
plt.barh(gpu_names, costs_per_image, color='skyblue')
plt.xlabel('Cost per Image (USD)')
plt.title('Cost per Image for Different GPUs')
plt.gca().invert_yaxis()
plt.tight_layout()

plt.show()
