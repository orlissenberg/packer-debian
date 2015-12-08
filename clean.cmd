SET PROJECT_PATH=%cd%

cd "%PROJECT_PATH%\ansible"

IF EXIST "%PROJECT_PATH%\ansible\roles\" rmdir /s /q roles

cd "%PROJECT_PATH%"

IF EXIST "%PROJECT_PATH%\ansible" rmdir /s /q ansible

IF EXIST "%PROJECT_PATH%\build\" rmdir /s /q build

REM IF EXIST "%PROJECT_PATH%\output-virtualbox-iso" rmdir /s /q output-virtualbox-iso

REM IF EXIST "%PROJECT_PATH%\packer_cache" rmdir /s /q packer_cache

vagrant box remove debian-7.8-x86_64

cls