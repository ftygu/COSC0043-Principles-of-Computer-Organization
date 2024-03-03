# 由于代码执行状态重置，需要重新定义GPU类和实例化显卡列表

class GPU:
    def __init__(self, name, price, power, performance):
        self.name = name
        self.price = price
        self.power = power
        self.performance = performance

    def calculate_daily_amortized_cost(self, lifespan_years=3):
        days_in_lifespan = lifespan_years * 365
        daily_amortized_cost = self.price / days_in_lifespan
        return daily_amortized_cost

    def calculate_daily_power_cost(self, electricity_cost_per_kWh=0.10, hours_per_day=24):
        power_cost_per_hour = (self.power / 1000) * electricity_cost_per_kWh
        daily_power_cost = power_cost_per_hour * hours_per_day
        return daily_power_cost

    def calculate_cost_per_image(self, electricity_cost_per_kWh=0.10, hours_per_day=24, lifespan_years=3):
        daily_amortized_cost = self.calculate_daily_amortized_cost(lifespan_years)
        daily_power_cost = self.calculate_daily_power_cost(electricity_cost_per_kWh, hours_per_day)
        images_per_day = self.performance * hours_per_day * 60
        cost_per_image = (daily_amortized_cost + daily_power_cost) / images_per_day
        return cost_per_image

# 示例显卡列表
gpu_list = [
    GPU('RTX 4090', 1599, 450, 75.13),
    GPU('RTX 4080', 1199, 320, 51.55),
    GPU('RTX 3090 Ti', 2000, 450, 46.85),
    GPU('RTX 3090', 1499, 350, 42.90),
    GPU('RTX 3080 Ti', 1199, 350, 41.62),
    GPU('RTX 4070 Ti', 799, 285, 41.62),
    GPU('RTX 3080 12G', 799, 320, 37.47),
    GPU('RTX 3080', 699, 320, 36.58),
    GPU('RTX 4070', 600, 200, 32.83),
    GPU('Titan RTX', 2499, 280, 31.95),
    GPU('RTX 2080 Ti', 999, 260, 29.31),
    GPU('RTX 3070 Ti', 599, 290, 28.70),
    GPU('RX 7900 XTX', 999, 355, 26.28),
    GPU('RTX 3070', 499, 220, 26.04)
]

# 计算并输出所有显卡的名字以及其对应的成本
for gpu in gpu_list:
    cost_per_image = gpu.calculate_cost_per_image()
    print(f"显卡: {gpu.name}, 每张图片的成本: {cost_per_image:.10f} USD")