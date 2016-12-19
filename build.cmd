SET PROJECT_PATH=%cd%
SET PACKER_PATH=C:\HashiCorp\Packer

IF NOT EXIST "%PROJECT_PATH%\ansible" mkdir ansible
cd "%PROJECT_PATH%\ansible"

IF NOT EXIST "%PROJECT_PATH%\ansible\roles\" mkdir roles
cd roles

cd "%PROJECT_PATH%"

rem IF NOT EXIST "%PROJECT_PATH%\build" mkdir build

IF EXIST "%PROJECT_PATH%\build\debian-iso820-amd64.ovf" (
    "%PACKER_PATH%\packer.exe" build debian-provision.json
)

IF NOT EXIST "%PROJECT_PATH%\build\debian-iso820-amd64.ovf" (
    "%PACKER_PATH%\packer.exe" build debian.json
)

IF EXIST "%PROJECT_PATH%\build\debian-x86_64.box" vagrant box remove debian-x86_64
IF EXIST "%PROJECT_PATH%\build\debian-x86_64.box" vagrant box add debian-x86_64 "%PROJECT_PATH%\build\debian-x86_64.box"
