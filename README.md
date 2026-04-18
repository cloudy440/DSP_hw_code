# DSP_hw_code

> 数字信号处理（DSP）课程实验 MATLAB 代码合集

[![MATLAB](https://img.shields.io/badge/MATLAB-R2018b%2B-blue?logo=matlab)](https://www.mathworks.com/products/matlab.html)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

本仓库包含数字信号处理课程全部上机实验的 MATLAB 代码，涵盖离散时间信号基本运算、卷积、DFT/FFT、IIR 滤波器设计与 FIR 滤波器设计等核心内容。

---

## 📁 目录结构

```
DSP_hw_code/
├── E1_code/    # 实验一：离散时间信号的基本运算
├── E2/         # 实验二：卷积和
├── E4/         # 实验六：DTFT 与 DFT 分析
├── E5/         # 实验八：快速傅里叶变换（FFT）
├── E6/         # 实验十一：IIR 数字滤波器设计
├── E7/         # 实验十三：FIR 滤波器设计（窗函数法）
└── E8/         # 实验十四：FIR 滤波器设计（频率采样法）
```

---

## 🧪 实验内容概览

### E1 — 离散时间信号的基本运算
| 文件 | 功能描述 |
|------|----------|
| `E1.m` | 主实验脚本：信号生成、移位、翻转、相加、周期延拓、LFM 信号 |
| `sigadd.m` | 两序列相加 |
| `sigmult.m` | 两序列相乘 |
| `sigshift.m` | 序列移位 |
| `sigfold.m` | 序列翻转 |
| `period.m` | 周期延拓（方法一） |
| `sigperi.m` | 周期延拓（方法二） |
| `LFMdemo.m` | 线性调频（LFM）信号演示 |

**涵盖知识点：** 冲激序列、阶跃序列、指数序列、正弦序列、复指数序列的生成与基本运算，以及周期性判断。

---

### E2 — 卷积和
| 文件 | 功能描述 |
|------|----------|
| `E2.m` | 主实验脚本：多种方法计算卷积和、音频回声仿真 |
| `convolution.m` | 自定义卷积（含时间轴信息） |
| `conv_m.m` | 基于 `conv` 的改进封装（含时间轴） |
| `stepseq.m` | 阶跃序列生成 |
| `test.wav` | 示例音频文件（用于回声效果实验） |

**涵盖知识点：** 线性卷积的三种实现方式对比、LTI 系统响应、音频回声效果仿真。

---

### E4 — DTFT 与 DFT 分析
| 文件 | 功能描述 |
|------|----------|
| `E4.m` | 主实验脚本：DTFT 计算、DFT 与 DTFT 关系、频率分辨率分析 |
| `DFTfor.m` | 循环实现 DFT |
| `DFTmat.m` | 矩阵实现 DFT |

**涵盖知识点：** DTFT 的幅度/相位/实部/虚部图，DFT 采样与 DTFT 的关系，零填充对频率分辨率的影响。

---

### E5 — 快速傅里叶变换（FFT）
| 文件 | 功能描述 |
|------|----------|
| `E5.m` | 主实验脚本：DIT-FFT 正变换与逆变换、与内置 `fft` 对比、计算效率比较 |
| `ditfft.m` | 按时间抽取（DIT）FFT 实现 |
| `DFTfor.m` | 循环 DFT（用于计算效率对比） |
| `DFTmat.m` | 矩阵 DFT（用于计算效率对比） |

**涵盖知识点：** DIT-FFT 蝶形运算原理、位倒序、IFFT 利用 FFT 实现、三种 DFT 算法的时间复杂度对比。

---

### E6 — IIR 数字滤波器设计
| 文件 | 功能描述 |
|------|----------|
| `E6.m` | 主实验脚本：Butterworth/Chebyshev 滤波器阶数估计与设计，冲激响应不变法与双线性变换法对比 |
| `butterworthord.m` | 自定义 Butterworth 滤波器阶数计算函数 |

**涵盖知识点：** 模拟滤波器原型设计、冲激响应不变法（`impinvar`）、双线性变换法（`bilinear`）、Butterworth 与 Chebyshev I 型滤波器设计。

---

### E7 — FIR 滤波器设计（窗函数法）
| 文件 | 功能描述 |
|------|----------|
| `E7.m` | 主实验脚本：矩形窗/汉明窗低通 FIR 设计，带通 FIR 设计，FIR 滤波实例 |

**涵盖知识点：** 窗函数法 FIR 设计（`fir1`/`fir2`），矩形窗与汉明窗性能对比，`fftfilt` 快速 FIR 滤波，线性相位特性。

---

### E8 — FIR 滤波器设计（频率采样法）
| 文件 | 功能描述 |
|------|----------|
| `E8.m` | 主实验脚本：频率采样法设计低通、带通、微分器等 FIR 滤波器，过渡采样点优化 |
| `Hr_type3.m` | III 型线性相位 FIR 滤波器振幅响应计算 |

**涵盖知识点：** 频率采样法（`fir2`）FIR 滤波器设计，过渡带采样点优化，III/IV 型线性相位 FIR 微分器设计，振幅响应分析。

---

## 🚀 快速开始

### 运行环境

- **MATLAB R2018b 或更高版本**
- 需要以下工具箱：
  - Signal Processing Toolbox（E6、E7、E8 实验需要）

### 使用方法

1. 克隆仓库到本地：
   ```bash
   git clone https://github.com/cloudy440/DSP_hw_code.git
   ```
2. 在 MATLAB 中打开对应实验文件夹，例如：
   ```matlab
   cd DSP_hw_code/E1_code
   ```
3. 打开并运行对应的主脚本（`E1.m`、`E2.m` 等）。  
   每个主脚本按 `%%` 分节，可在 MATLAB 编辑器中逐节运行（`Ctrl+Enter`）。

> **注意：** E2 中的 `E2.m` 第 2-4 节需要将工作目录设置在 `E2/` 内，才能正确读取 `test.wav`。

---

## 📊 功能函数速查

| 函数 | 所在目录 | 说明 |
|------|----------|------|
| `sigadd(x1,n1,x2,n2)` | E1_code / E2 | 序列相加（含时间轴对齐） |
| `sigmult(x1,n1,x2,n2)` | E1_code / E2 | 序列相乘（含时间轴对齐） |
| `sigshift(x,nx,m)` | E1_code / E2 | 序列移位 |
| `sigfold(x,nx)` | E1_code / E2 | 序列翻转 |
| `sigperi(x,nx,P,M)` | E1_code / E2 | 周期延拓 |
| `stepseq(n0,n1,n2)` | E2 | 单位阶跃序列生成 |
| `conv_m(x,nx,h,nh)` | E2 | 带时间轴的卷积和 |
| `DFTfor(xn)` | E4 / E5 | 循环计算 DFT |
| `DFTmat(xn)` | E4 / E5 | 矩阵计算 DFT |
| `ditfft(xn)` | E5 | DIT-FFT 快速傅里叶变换 |
| `butterworthord(wp,ws,rp,rs)` | E6 | Butterworth 滤波器阶数估算 |
| `Hr_type3(h)` | E8 | III 型 FIR 振幅响应计算 |

---

## 📚 参考资料

- 程佩青，《数字信号处理教程》（第五版），清华大学出版社
- MATLAB Signal Processing Toolbox Documentation

---

## 📄 许可证

本项目仅供学习参考，采用 [MIT License](LICENSE) 开源。
