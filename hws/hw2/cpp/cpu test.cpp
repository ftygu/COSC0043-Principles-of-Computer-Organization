#include <iostream>
#include <vector>
#include <chrono>
#include <numeric>
#include <algorithm>
#include <cmath>
#include <random>

using namespace std;
using namespace std::chrono;

// 质数计算
int primeCount(int n) {
    vector<bool> prime(n + 1, true);
    prime[0] = prime[1] = false;
    for (int p = 2; p * p <= n; p++) {
        if (prime[p]) {
            for (int i = p * p; i <= n; i += p) {
                prime[i] = false;
            }
        }
    }
    return count(prime.begin(), prime.end(), true);
}

// 快速排序
void quickSort(vector<int>& arr, int left, int right) {
    int i = left, j = right;
    int pivot = arr[(left + right) / 2];
    while (i <= j) {
        while (arr[i] < pivot) i++;
        while (arr[j] > pivot) j--;
        if (i <= j) {
            swap(arr[i], arr[j]);
            i++;
            j--;
        }
    }
    if (left < j) quickSort(arr, left, j);
    if (i < right) quickSort(arr, i, right);
}

// 矩阵乘法
vector<vector<int>> matrixMultiply(const vector<vector<int>>& a, const vector<vector<int>>& b) {
    size_t n = a.size();
    vector<vector<int>> result(n, vector<int>(n, 0));
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++) {
            for (size_t k = 0; k < n; k++) {
                result[i][j] += a[i][k] * b[k][j];
            }
        }
    }
    return result;
}

// 计算圆周率
double computePi(int samples) {
    default_random_engine gen;
    uniform_real_distribution<double> dist(0.0, 1.0);
    int count = 0;
    for (int i = 0; i < samples; i++) {
        double x = dist(gen);
        double y = dist(gen);
        if (x * x + y * y <= 1) count++;
    }
    return 4.0 * count / samples;
}

// 性能测试主函数
int main() {
    // 可以根据需要调整测试规模
    int primeRange = 1000000;
    int sortSize = 100000;
    int matrixSize = 1000;
    int piSamples = 10000000;

    auto start = high_resolution_clock::now();

    // 质数计算
    auto primeResult = primeCount(primeRange);

    // 排序
    vector<int> sortArray(sortSize);
    iota(sortArray.begin(), sortArray.end(), 0);
    shuffle(sortArray.begin(), sortArray.end(), default_random_engine());
    quickSort(sortArray, 0, sortSize - 1);

    // 矩阵乘法
    vector<vector<int>> matrixA(matrixSize, vector<int>(matrixSize, 1));
    vector<vector<int>> matrixB(matrixSize, vector<int>(matrixSize, 2));
    auto matrixResult = matrixMultiply(matrixA, matrixB);

    // 计算圆周率
    auto pi = computePi(piSamples);

    auto end = high_resolution_clock::now();
    auto duration = duration_cast<milliseconds>(end - start).count();

    cout << "总计算时间: " << duration << " 毫秒" << endl;
    system("pause");
    return 0;
}
