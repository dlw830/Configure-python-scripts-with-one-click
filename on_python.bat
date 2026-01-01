@echo off
chcp 65001 >nul
REM 使用当前 Python 的 pip 安装指定版本的依赖，可选择常用镜像源

echo 请选择要使用的 pip 源:
echo   1) 官方 PyPI (https://pypi.org/simple)
echo   2) 清华 TUNA (https://pypi.tuna.tsinghua.edu.cn/simple)
echo   3) 阿里云 (https://mirrors.aliyun.com/pypi/simple)
echo   4) 华为云 (https://mirrors.huaweicloud.com/repository/pypi/simple)
echo   5) 中国科大 USTC (https://mirrors.ustc.edu.cn/pypi/web/simple)

choice /c 12345 /n /m "请输入数字选择源 [1-5]: "
if errorlevel 5 goto use_ustc
if errorlevel 4 goto use_huawei
if errorlevel 3 goto use_aliyun
if errorlevel 2 goto use_tsinghua
if errorlevel 1 goto use_pypi

:use_ustc
set PIP_INDEX_URL=https://mirrors.ustc.edu.cn/pypi/web/simple
goto after_mirror_select

:use_huawei
set PIP_INDEX_URL=https://mirrors.huaweicloud.com/repository/pypi/simple
goto after_mirror_select

:use_aliyun
set PIP_INDEX_URL=https://mirrors.aliyun.com/pypi/simple
goto after_mirror_select

:use_tsinghua
set PIP_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
goto after_mirror_select

:use_pypi
set PIP_INDEX_URL=https://pypi.org/simple

:after_mirror_select
echo.
echo 当前使用的 pip 源为: %PIP_INDEX_URL%
echo.

python -m pip install --upgrade pip==25.3 -i %PIP_INDEX_URL%

python -m pip install altgraph==0.17.4 -i %PIP_INDEX_URL%
python -m pip install contourpy==1.3.3 -i %PIP_INDEX_URL%
python -m pip install cycler==0.12.1 -i %PIP_INDEX_URL%
python -m pip install et_xmlfile==2.0.0 -i %PIP_INDEX_URL%
python -m pip install fonttools==4.60.1 -i %PIP_INDEX_URL%
python -m pip install kiwisolver==1.4.9 -i %PIP_INDEX_URL%
python -m pip install Markdown==3.10 -i %PIP_INDEX_URL%
python -m pip install matplotlib==3.10.7 -i %PIP_INDEX_URL%
python -m pip install numpy==2.3.3 -i %PIP_INDEX_URL%
python -m pip install openpyxl==3.1.5 -i %PIP_INDEX_URL%
python -m pip install packaging==25.0 -i %PIP_INDEX_URL%
python -m pip install pandas==2.3.3 -i %PIP_INDEX_URL%
python -m pip install pefile==2023.2.7 -i %PIP_INDEX_URL%
python -m pip install pillow==12.0.0 -i %PIP_INDEX_URL%
echo.
echo 正在安装 pygame==2.6.1 (可能时间较长)...
python -m pip install pygame==2.6.1 -i %PIP_INDEX_URL% --default-timeout=600
if errorlevel 1 (
	echo 从 %PIP_INDEX_URL% 安装 pygame 失败，尝试官方源...
	py -3.12 -m pip install pygame==2.6.1 -i https://pypi.org/simple --default-timeout=600
)
python -m pip install pyinstaller==6.16.0 -i %PIP_INDEX_URL%
python -m pip install pyinstaller-hooks-contrib==2025.9 -i %PIP_INDEX_URL%
python -m pip install pyparsing==3.2.5 -i %PIP_INDEX_URL%
python -m pip install PyQt5==5.15.11 -i %PIP_INDEX_URL%
python -m pip install PyQt5-Qt5==5.15.2 -i %PIP_INDEX_URL%
python -m pip install PyQt5_sip==12.17.1 -i %PIP_INDEX_URL%
python -m pip install pyserial==3.5 -i %PIP_INDEX_URL%
python -m pip install python-dateutil==2.9.0.post0 -i %PIP_INDEX_URL%
python -m pip install pytz==2025.2 -i %PIP_INDEX_URL%
python -m pip install pywin32-ctypes==0.2.3 -i %PIP_INDEX_URL%
python -m pip install setuptools==80.9.0 -i %PIP_INDEX_URL%
python -m pip install six==1.17.0 -i %PIP_INDEX_URL%
python -m pip install tzdata==2025.2 -i %PIP_INDEX_URL%

echo.
echo 所有指定包的安装命令已执行完毕。
pause
