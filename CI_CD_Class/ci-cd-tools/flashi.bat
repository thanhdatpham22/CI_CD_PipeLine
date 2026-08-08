rem @echo off
set "usage=usage: flashi [{Debug|Release}]"

setlocal

set "build_type=Debug"
if not [%1]==[] set "build_type=%1"

set "ws_root=C:\Users\admin\STM32CubeIDE\workspace_1.16.0\CI_CD_Class"
set "sn=48FF70066770535312191967"
set "image_file=%ws_root%\%build_type%\CI_CD_CLASS.bin"

"%ws_root%\ci-cd-tools\flash.bat" %sn% "%image_file%"
