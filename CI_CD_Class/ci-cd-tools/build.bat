rem
rem usage: build build-dir {Debug|Release} {all|clean}
rem

setlocal

if not [%3]==[] goto :get_args
echo "Insufficient arguments"
exit /b 1

:get_args

set "build_dir=%1"
set "build_type=%2"
set "target=%3"

cd "%build_dir%"

set PATH=D:\APP\ST_Microcontrollers\STM32Cube_IDE\STM32CubeIDE_1.16.0\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.12.3.rel1.win32_1.0.200.202406191623\tools\bin;D:\APP\ST_Microcontrollers\STM32Cube_IDE\STM32CubeIDE_1.16.0\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.make.win32_2.1.300.202402091052\tools\bin;D:/APP/ST_Microcontrollers/STM32Cube_IDE/STM32CubeIDE_1.16.0/STM32CubeIDE//plugins/com.st.stm32cube.ide.jre.win64_3.2.0.202405231314/jre/bin/server;D:/APP/ST_Microcontrollers/STM32Cube_IDE/STM32CubeIDE_1.16.0/STM32CubeIDE//plugins/com.st.stm32cube.ide.jre.win64_3.2.0.202405231314/jre/bin;C:\Program Files\Basler\pylon\Runtime\x64\;C:\Program Files\Basler\pylon\Runtime\Win32\;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Program Files\dotnet\;C:\Program Files\TortoiseSVN\bin;C:\Program Files\Git\cmd;C:\Program Files\CMake\bin;C:\Program Files\Microsoft SQL Server\150\Tools\Binn\;C:\Program Files (x86)\Windows Kits\10\Windows Performance Toolkit\;C:\Users\admin\Documents\opencv\build\x64\vc15\bin;C:\Program Files\nodejs\;C:\Program Files (x86)\Vector CANdb++ 3.1\Exec32;C:\Users\admin\AppData\Local\Programs\Python\Python312\Scripts\;C:\Users\admin\AppData\Local\Programs\Python\Python312\;C:\Users\admin\AppData\Local\Programs\Python\Launcher\;C:\Users\admin\AppData\Local\Microsoft\WindowsApps;C:\Users\admin\AppData\Local\Programs\Microsoft VS Code\bin;C:\Program Files\CMake\bin;C:\msys64\mingw64\bin;C:\Users\admin\AppData\Roaming\npm;C:\Users\admin\Documents\opencv\build\x64\vc15\bin;C:\Users\admin\.dotnet\tools;C:\Users\admin\AppData\Local\Programs\Antigravity\bin

set compiler_prefix=arm-none-eabi-

set "version_file=..\App\gpio-app\version.h"

if [%BUILD_TAG%]==[] goto :do_make

echo #ifndef _VERSION_H_ >"%version_file%"
echo #define _VERSION_H_ >>"%version_file%"
echo #define VERSION "%BUILD_TAG%-%build_type%" >>"%version_file%"
echo #endif >>"%version_file%"

:do_make

echo ==============================
echo Jenkins Build Environment
echo ==============================

echo PATH:
echo %PATH%

echo MAKE:
where make

echo GCC:
where arm-none-eabi-gcc

echo SIZE:
where arm-none-eabi-size

echo ==============================
echo BUILD
echo ==============================


make -j4 "%target%"
