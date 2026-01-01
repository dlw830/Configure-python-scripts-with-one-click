# ? Python 开发环境一键配置工具

一款专为 Python 开发者设计的依赖包批量安装工具。支持多种国内镜像源，一键安装常用科学计算、GUI、游戏开发等全套依赖包。

## ? 主要功能

### ? 依赖包管理
- 一键安装25+常用Python库
- 自动升级pip到最新版本
- 智能处理依赖关系
- 版本号精确控制

### ? 镜像源选择
- **官方 PyPI**: 全球标准源
- **清华 TUNA**: 国内高速镜像
- **阿里云**: 稳定可靠的国内源
- **华为云**: 企业级镜像服务
- **中国科大 USTC**: 教育网优选

### ?? 智能容错
- 自动重试机制（pygame特别优化）
- 超时自动切换官方源
- 错误友好提示
- 详细安装日志

### ? 包含库列表

#### 数据科学与可视化
- **numpy** (2.3.3) - 科学计算核心库
- **pandas** (2.3.3) - 数据分析工具
- **matplotlib** (3.10.7) - 绘图库
- **contourpy** (1.3.3) - 等高线绘制
- **openpyxl** (3.1.5) - Excel操作

#### GUI开发
- **PyQt5** (5.15.11) - 跨平台界面框架
- **PyQt5-Qt5** (5.15.2) - Qt核心组件
- **PyQt5_sip** (12.17.1) - Python/C++绑定

#### 游戏开发
- **pygame** (2.6.1) - 游戏开发框架

#### 打包工具
- **pyinstaller** (6.16.0) - 程序打包工具
- **pyinstaller-hooks-contrib** (2025.9) - 打包插件
- **pefile** (2023.2.7) - PE文件解析

#### 硬件交互
- **pyserial** (3.5) - 串口通信

#### 文本处理
- **Markdown** (3.10) - Markdown渲染

#### 其他依赖
- **pillow** (12.0.0) - 图像处理
- **fonttools** (4.60.1) - 字体工具
- **kiwisolver** (1.4.9) - 约束求解器
- **cycler** (0.12.1) - 样式循环器
- **pyparsing** (3.2.5) - 解析器
- **packaging** (25.0) - 版本管理
- **python-dateutil** (2.9.0.post0) - 日期处理
- **pytz** (2025.2) - 时区支持
- **tzdata** (2025.2) - 时区数据
- **pywin32-ctypes** (0.2.3) - Windows API
- **setuptools** (80.9.0) - 打包工具
- **six** (1.17.0) - 兼容性库
- **altgraph** (0.17.4) - 图算法
- **et_xmlfile** (2.0.0) - Excel XML处理

## ? 快速开始

### 使用方法

#### 方式1：双击运行
直接双击 `on_python.bat` 文件，根据提示选择镜像源。

#### 方式2：命令行运行

```cmd
cd e:\OneDrive\桌面\on_python
on_python.bat
```

### 安装步骤

1. **选择镜像源**
   ```
   请选择要使用的 pip 源:
     1) 官方 PyPI (https://pypi.org/simple)
     2) 清华 TUNA (https://pypi.tuna.tsinghua.edu.cn/simple)
     3) 阿里云 (https://mirrors.aliyun.com/pypi/simple)
     4) 华为云 (https://mirrors.huaweicloud.com/repository/pypi/simple)
     5) 中国科大 USTC (https://mirrors.ustc.edu.cn/pypi/web/simple)
   
   请输入数字选择源 [1-5]:
   ```

2. **输入数字** (1-5) 选择镜像源

3. **等待安装**
   - 脚本会自动安装所有依赖
   - pygame安装时间较长，请耐心等待
   - 如果pygame安装失败，会自动切换官方源重试

4. **安装完成**
   ```
   所有指定包的安装命令已执行完毕。
   请按任意键继续. . .
   ```

## ? 使用场景

### 1. 新环境快速配置

刚安装Python后，一键配置所有常用库：

```cmd
# 安装Python 3.12后
on_python.bat
# 选择镜像源（国内推荐2-5）
# 等待安装完成
```

### 2. 数据科学环境

配置数据分析和可视化环境：

```python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# 创建数据
data = pd.DataFrame(np.random.randn(100, 2), columns=['A', 'B'])

# 绘图
plt.figure(figsize=(10, 6))
plt.plot(data['A'], label='Series A')
plt.plot(data['B'], label='Series B')
plt.legend()
plt.show()
```

### 3. GUI应用开发

使用PyQt5开发桌面应用：

```python
from PyQt5.QtWidgets import QApplication, QMainWindow, QLabel
import sys

app = QApplication(sys.argv)
window = QMainWindow()
window.setWindowTitle('My App')
window.setGeometry(100, 100, 400, 300)

label = QLabel('Hello, PyQt5!', window)
label.move(150, 120)

window.show()
sys.exit(app.exec_())
```

### 4. 游戏开发

使用pygame开发游戏：

```python
import pygame

pygame.init()
screen = pygame.display.set_mode((800, 600))
pygame.display.set_caption('My Game')

running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
    
    screen.fill((255, 255, 255))
    pygame.display.flip()

pygame.quit()
```

### 5. 程序打包

使用pyinstaller打包为可执行文件：

```cmd
pyinstaller --onefile --windowed my_app.py
```

## ? 特色功能

### 智能容错机制

```batch
echo 正在安装 pygame==2.6.1 (可能时间较长)...
python -m pip install pygame==2.6.1 -i %PIP_INDEX_URL% --default-timeout=600
if errorlevel 1 (
    echo 从 %PIP_INDEX_URL% 安装 pygame 失败，尝试官方源...
    py -3.12 -m pip install pygame==2.6.1 -i https://pypi.org/simple --default-timeout=600
)
```

- pygame安装超时时间延长至600秒
- 安装失败自动切换官方源
- 保证关键库安装成功

### 中文支持

```batch
@echo off
chcp 65001 >nul
```

- 设置UTF-8编码
- 完美支持中文显示
- 避免乱码问题

### 版本锁定

所有依赖包都指定了精确版本号，确保：
- ? 环境可复现
- ? 避免版本冲突
- ? 稳定性保证

## ?? 系统要求

- **操作系统**: Windows 7 及以上
- **Python版本**: Python 3.8+（推荐 3.12）
- **磁盘空间**: 至少 500 MB
- **网络要求**: 稳定的互联网连接

### Python安装检查

```cmd
python --version
```

如果未安装Python，请先从[Python官网](https://www.python.org/downloads/)下载安装。

## ? 镜像源速度对比

| 镜像源 | 国内速度 | 稳定性 | 推荐场景 |
|--------|----------|--------|----------|
| 官方 PyPI | ?? | ????? | 海外用户 |
| 清华 TUNA | ????? | ???? | 通用推荐 |
| 阿里云 | ???? | ????? | 企业用户 |
| 华为云 | ???? | ???? | 企业用户 |
| 中国科大 | ????? | ???? | 教育网用户 |

### 推荐选择

- **教育网环境**: 选择 5 (中国科大)
- **企业环境**: 选择 3 (阿里云) 或 4 (华为云)
- **家庭宽带**: 选择 2 (清华TUNA)
- **海外网络**: 选择 1 (官方PyPI)

## ?? 常见问题

### 1. pygame安装失败

**问题**: pygame安装超时或失败

**解决方案**:
- 脚本会自动重试官方源
- 手动安装：`python -m pip install pygame==2.6.1 --default-timeout=600`
- 尝试其他镜像源

### 2. 权限错误

**问题**: `Permission denied` 或 `Access is denied`

**解决方案**:
```cmd
# 以管理员身份运行
# 或使用用户安装
python -m pip install --user <package>
```

### 3. SSL证书错误

**问题**: `SSL: CERTIFICATE_VERIFY_FAILED`

**解决方案**:
```cmd
# 临时信任证书（不推荐）
python -m pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org <package>
```

### 4. 网络超时

**问题**: `Read timed out`

**解决方案**:
- 切换其他镜像源
- 增加超时时间：`--default-timeout=600`
- 检查网络连接

### 5. 版本冲突

**问题**: 提示版本不兼容

**解决方案**:
```cmd
# 先卸载旧版本
python -m pip uninstall <package>
# 重新运行脚本
```

## ? 更新日志

### v1.0 (20250101)
- ? 初始版本发布
- ? 支持5大镜像源
- ? 包含25+常用Python库
- ? pip自动升级到25.3
- ? pygame智能容错机制
- ? 中文完美支持
- ? 交互式镜像源选择

## ? 自定义配置

### 修改版本号

编辑 `on_python.bat`，找到对应的安装命令：

```batch
python -m pip install numpy==2.3.3 -i %PIP_INDEX_URL%
# 改为
python -m pip install numpy==<新版本> -i %PIP_INDEX_URL%
```

### 添加新包

在适当位置添加：

```batch
python -m pip install <package_name>==<version> -i %PIP_INDEX_URL%
```

### 移除不需要的包

注释掉或删除对应行：

```batch
REM python -m pip install pygame==2.6.1 -i %PIP_INDEX_URL%
```

## ? 脚本结构

```
on_python.bat
├── 编码设置 (UTF-8)
├── 镜像源选择菜单
│   ├── 官方 PyPI
│   ├── 清华 TUNA
│   ├── 阿里云
│   ├── 华为云
│   └── 中国科大
├── pip升级 (25.3)
├── 依赖包安装
│   ├── 基础库
│   ├── 数据科学库
│   ├── GUI库
│   ├── 游戏开发库
│   └── 打包工具
├── pygame特殊处理
│   ├── 延长超时
│   └── 失败重试
└── 完成提示
```

## ? 技术特点

- **批处理脚本**: Windows原生支持
- **交互式选择**: `choice` 命令实现
- **错误处理**: `errorlevel` 判断
- **环境变量**: 动态设置镜像源
- **超时控制**: 针对大型包优化

## ? 最佳实践

### 1. 虚拟环境使用

推荐在虚拟环境中使用：

```cmd
# 创建虚拟环境
python -m venv myenv

# 激活虚拟环境
myenv\Scripts\activate

# 运行安装脚本
on_python.bat

# 退出虚拟环境
deactivate
```

### 2. 定期更新

定期检查库更新：

```cmd
python -m pip list --outdated
```

### 3. 依赖导出

导出当前环境依赖：

```cmd
python -m pip freeze > requirements.txt
```

### 4. 清理缓存

清理pip缓存释放空间：

```cmd
python -m pip cache purge
```

## ? 应用场景

### 学生学习
- 数据结构与算法实践
- 机器学习课程
- 游戏开发课程
- GUI编程学习

### 数据分析师
- 数据清洗和处理
- 可视化报告生成
- Excel自动化
- 统计分析

### 软件开发
- 桌面应用开发
- 自动化脚本
- 工具开发
- 程序打包发布

### 嵌入式开发
- 串口调试工具
- 数据采集分析
- 上位机开发
- 协议解析

## ? 支持与赞助（打赏）

如果这个项目对你有帮助，欢迎通过以下方式支持作者的持续维护与改进：

* ? **Star 本项目**（这是最好的支持方式）
* ? **Fork 并参与贡献**
* ? 提出 Issue / 改进建议
* ? **自愿打赏（非强制）**

### 打赏方式

| 平台 | 说明 |
|------|------|
| 微信 | 扫描下方二维码 |

> 打赏完全自愿，不影响项目的任何功能或授权。

## ? 许可证

本项目基于 **MIT License** 开源发布。
你可以自由地使用、修改和分发本项目，但需保留原始版权声明。

---

## ? 贡献指南

欢迎提交 **Issue** 和 **Pull Request**！

建议流程：

1. Fork 本仓库
2. 新建分支进行修改
3. 提交 PR 并简要说明修改内容

如是较大改动，建议先提交 Issue 讨论。

---

## ? 联系方式

* Email：[1013344248@qq.com](mailto:1013344248@qq.com)
* GitHub：@dlw830

---

**Happy Python Coding!** ?  
如果你觉得这个项目有价值，别忘了点个 ?
