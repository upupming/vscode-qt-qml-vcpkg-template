@REM https://stackoverflow.com/a/56499225/8242705
:: set the path to your visual studio vcvars script, it is different for every version of Visual Studio.
set VSTOOLS="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

:: make sure we found them
if not exist %VSTOOLS% (
    echo VS 2017 Build Tools are missing!
    exit
)

:: call that script, which essentially sets up the VS Developer Command Prompt
WHERE cl.exe
IF %ERRORLEVEL% NEQ 0 call %VSTOOLS%

:: Set some variables for the source directory and the build directory
set SrcDir=%CD%
set BuildDir=%CD%\build

:: Make the build directory if it doesn't exist
if not exist "%BuildDir%" mkdir "%BuildDir%"

:: Make sure you configure with CMake from the build directory
cd "%BuildDir%"

:: Call CMake to configure the build (generates the build scripts)
cmake -S %SrcDir% -B %BuildDir% -GNinja

exit
