rem
rem usage: flash st-link-sn image-file
rem

setlocal


if not [%2]==[] goto :get_args
echo "Missing arguments"
exit /b 1

:get_args

set "sn=%1"
set "image_file=%2"
set "flash_tool=D:\APP\ST_Microcontrollers\STM32Cube_IDE\STM32CubeIDE_1.16.0\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.cubeprogrammer.win32_2.1.400.202404281720\tools\bin\STM32_Programmer_CLI"
set "flash_start_addr=0x08000000"

"%flash_tool%" --connect port=SWD sn=%sn% --download "%image_file%" %flash_start_addr% -hardRst
