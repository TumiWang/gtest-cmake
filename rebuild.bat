@ECHO OFF

CD %~dp0

SET BUILD_DIR=build
SET PREFIX_DIR=prefix

@REM Debug, Release, RelWithDebInfo and MinSizeRel
SET BUILD_TYPE=RelWithDebInfo

@REM win32 x64
SET BUIND_ARCH=x64

IF EXIST %BUILD_DIR% (
    RD /S /Q %BUILD_DIR%
    PING -n 1 127.0.0.1>nul
)

IF EXIST %PREFIX_DIR% (
    RD /S /Q %PREFIX_DIR%
    PING -n 1 127.0.0.1>nul
)

cmake -B %BUILD_DIR% -S . -G "Visual Studio 17 2022" -A %BUIND_ARCH% -DCMAKE_BUILD_TYPE=%BUILD_TYPE% -DBUILD_SHARED_LIBS=ON
IF %ERRORLEVEL% NEQ 0 (
    ECHO "Make Failed"
    EXIT /B %ERRORLEVEL%
)

cmake --build %BUILD_DIR% --config %BUILD_TYPE%
IF %ERRORLEVEL% NEQ 0 (
    ECHO "Build Failed"
    EXIT /B %ERRORLEVEL%
)

cmake --install %BUILD_DIR% --prefix %PREFIX_DIR% --config %BUILD_TYPE%
IF %ERRORLEVEL% NEQ 0 (
    ECHO "Install Failed"
    EXIT /B %ERRORLEVEL%
)
