@echo off
mode con cols=120 lines=40
title Heztro's Windows Optimizer
color 0B
setlocal EnableDelayedExpansion

:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :main
) else (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)

:main
cls
echo.
echo      :::    ::: ::::::::::::
echo     :+:    :+:     :+:     
echo    +:+    +:+     +:+      
echo   +#++:++#++     +#+       
echo  +#+    +#+     +#+        
echo #+#    #+#     #+#         
echo ###    ###     ###
echo.
echo    ======================
echo     Windows Optimizer
echo    ======================
echo.
echo      [1] Quick Optimization Presets
echo      [2] Windows ^& Regedit Optimizations
echo      [3] Debloat Windows
echo      [4] Privacy Optimizations
echo      [5] Network Optimizations
echo      [6] Advanced Optimizations
echo      [7] Restore Point Management
echo      [8] Undo Changes
echo      [9] Exit
echo.
echo Made with Love by Heztro
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto :presets
if "%choice%"=="2" goto :windows_opt
if "%choice%"=="3" goto :debloat
if "%choice%"=="4" goto :privacy
if "%choice%"=="5" goto :network
if "%choice%"=="6" goto :advanced
if "%choice%"=="7" goto :restore
if "%choice%"=="8" goto :undo
if "%choice%"=="9" exit

:presets
cls
echo.
echo    === Optimization Presets ===
echo.
echo    [1] Minimal Optimization
echo        - Basic Windows tweaks
echo        - Light debloating
echo        - Basic network optimizations
echo.
echo    [2] Recommended Optimization
echo        - Full debloating
echo        - All network tweaks
echo        - Windows optimizations
echo        - High performance mode
echo.
echo    [3] Extreme Optimization
echo        - All optimizations
echo        - Ultimate performance
echo        - Maximum debloating
echo        - Advanced tweaks
echo.
echo    [4] Back to Main Menu
echo.
echo Made with Love by Heztro
echo.
set /p preset_choice="Select preset: "

if "%preset_choice%"=="1" goto :minimal_preset
if "%preset_choice%"=="2" goto :recommended_preset
if "%preset_choice%"=="3" goto :extreme_preset
if "%preset_choice%"=="4" goto :main
goto :presets

:windows_opt
cls
echo.
echo    === Windows ^& Regedit Optimizations ===
echo.
echo    [1] Windows Ultimate Performance Mode
echo    [2] Regedit Performance Tweaks
echo    [3] Input Lag Reduction
echo    [4] Game DVR Disable
echo    [5] DirectX Optimization
echo    [6] Process Optimization
echo    [7] Memory Management
echo    [8] Apply All Optimizations
echo    [9] Back to Main Menu
echo.
echo Made with Love by Heztro
echo.
set /p win_choice="Select optimization: "

if "%win_choice%"=="1" call :ultimate_performance
if "%win_choice%"=="2" call :regedit_tweaks
if "%win_choice%"=="3" call :input_lag
if "%win_choice%"=="4" call :disable_dvr
if "%win_choice%"=="5" call :directx_opt
if "%win_choice%"=="6" call :process_opt
if "%win_choice%"=="7" call :memory_opt
if "%win_choice%"=="8" (
    call :ultimate_performance
    call :regedit_tweaks
    call :input_lag
    call :disable_dvr
    call :directx_opt
    call :process_opt
    call :memory_opt
)
if "%win_choice%"=="9" goto :main
goto :windows_opt

:debloat
cls
echo.
echo    === Debloat Windows ===
echo.
echo    [1] Remove Microsoft Apps
echo    [2] Clear Temporary Files
echo    [3] Optimize Disk
echo    [4] Apply All Debloat Options
echo    [5] Back to Main Menu
echo.
echo Made with Love by Heztro
echo.
set /p debloat_choice="Select option: "

if "%debloat_choice%"=="1" call :remove_apps
if "%debloat_choice%"=="2" call :clear_temp
if "%debloat_choice%"=="3" call :optimize_disk
if "%debloat_choice%"=="4" (
    call :remove_apps
    call :clear_temp
    call :optimize_disk
)
if "%debloat_choice%"=="5" goto :main
goto :debloat

:privacy
cls
echo.
echo    === Privacy Optimizations ===
echo.
echo    [1] Disable Telemetry
echo    [2] Disable Diagnostics
echo    [3] Disable All Trackers
echo    [4] Configure Privacy Settings
echo    [5] Apply All Privacy Options
echo    [6] Back to Main Menu
echo.
echo Made with Love by Heztro
echo.
set /p privacy_choice="Select option: "

if "%privacy_choice%"=="1" call :disable_telemetry
if "%privacy_choice%"=="2" call :disable_diagnostics
if "%privacy_choice%"=="3" call :disable_trackers
if "%privacy_choice%"=="4" call :privacy_settings
if "%privacy_choice%"=="5" (
    call :disable_telemetry
    call :disable_diagnostics
    call :disable_trackers
    call :privacy_settings
)
if "%privacy_choice%"=="6" goto :main
goto :privacy

:network
cls
echo.
echo    === Network Optimization ===
echo.
echo    [1] Network Latency Tweaks
echo    [2] DNS Optimization
echo    [3] TCP/IP Optimization
echo    [4] Network Monitoring
echo    [5] Apply All Network Options
echo    [6] Back to Main Menu
echo.
echo Made with Love by Heztro
echo.
set /p network_choice="Select option: "

if "%network_choice%"=="1" call :latency_tweaks
if "%network_choice%"=="2" call :dns_optimization
if "%network_choice%"=="3" call :tcpip_optimization
if "%network_choice%"=="4" call :network_monitoring
if "%network_choice%"=="5" (
    call :latency_tweaks
    call :dns_optimization
    call :tcpip_optimization
    call :network_monitoring
)
if "%network_choice%"=="6" goto :main
goto :network

:advanced
cls
echo.
echo    === Advanced Optimizations ===
echo.
echo    [1] Disable Windows Defender
echo    [2] Disable Core Isolation
echo    [3] Enable XMP
echo    [4] NVIDIA Tweaks
echo    [5] Enable KBoost
echo    [6] Configure SvcHostSplitThreshold
echo    [7] Unpark CPU Cores
echo    [8] Update NVIDIA Drivers (537.xx)
echo    [9] Apply All Advanced Options
echo    [10] Back to Main Menu
echo.
echo Made with Love by Heztro
echo.
set /p advanced_choice="Select option: "

if "%advanced_choice%"=="1" call :disable_defender
if "%advanced_choice%"=="2" call :disable_isolation
if "%advanced_choice%"=="3" call :enable_xmp
if "%advanced_choice%"=="4" call :nvidia_tweaks
if "%advanced_choice%"=="5" call :enable_kboost
if "%advanced_choice%"=="6" call :svchost_threshold
if "%advanced_choice%"=="7" call :unpark_cores
if "%advanced_choice%"=="8" call :update_nvidia
if "%advanced_choice%"=="9" (
    call :disable_defender
    call :disable_isolation
    call :enable_xmp
    call :nvidia_tweaks
    call :enable_kboost
    call :svchost_threshold
    call :unpark_cores
    call :update_nvidia
)
if "%advanced_choice%"=="10" goto :main
goto :advanced

:disable_defender
echo Disabling Windows Defender...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d "1" /f
goto :eof

:disable_isolation
echo Disabling Core Isolation...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "RequirePlatformSecurityFeatures" /t REG_DWORD /d "0" /f
goto :eof

:enable_xmp
echo Note: XMP must be enabled in BIOS. Please enable it manually.
goto :eof

:nvidia_tweaks
echo Applying NVIDIA tweaks...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PerfLevelSrc" /t REG_DWORD /d "8738" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PowerMizerEnable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PowerMizerLevel" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PowerMizerLevelAC" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "TCCSupported" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "VsyncIdleTimeout" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCorePerfPstate" /t REG_DWORD /d "0" /f
goto :eof

:enable_kboost
echo Enabling KBoost...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerEnable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevel" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevelAC" /t REG_DWORD /d "1" /f
goto :eof

:svchost_threshold
echo Configuring SvcHostSplitThreshold...
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "0x8000000" /f
goto :eof

:unpark_cores
echo Unparking CPU cores...
powershell -Command "$paths = @('HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583', 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028'); foreach ($path in $paths) { Set-ItemProperty -Path $path -Name 'Attributes' -Value 0 }"
powercfg -setacvalueindex scheme_current sub_processor parkingstatetimeout 0
powercfg -setacvalueindex scheme_current sub_processor minimumprocessorstate 100
powercfg -setacvalueindex scheme_current sub_processor maximumprocessorstate 100

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "DCSettingIndex" /t REG_DWORD /d "0" /f

echo @echo off > "%TEMP%\unpark_cpu.bat"
echo for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings" /s /f "*CoreParking*" ^^^| find /i "REG_"') do ( >> "%TEMP%\unpark_cpu.bat"
echo   reg add "%%i" /v "Attributes" /t REG_DWORD /d "0" /f >> "%TEMP%\unpark_cpu.bat"
echo ) >> "%TEMP%\unpark_cpu.bat"

start "" "%TEMP%\unpark_cpu.bat"
echo CPU cores have been unparked.
goto :eof

:update_nvidia
echo Downloading NVIDIA Driver 537.58...
powershell -Command "& { $url = 'https://us.download.nvidia.com/Windows/537.58/537.58-desktop-win10-win11-64bit-international-dch-whql.exe'; $output = '$env:TEMP\nvidia_537.58.exe'; (New-Object System.Net.WebClient).DownloadFile($url, $output); Start-Process -FilePath $output -ArgumentList '/s','/n' -Wait }"

if %ERRORLEVEL% EQU 0 (
    echo NVIDIA Driver 537.58 has been installed successfully.
) else (
    echo Error downloading or installing NVIDIA driver.
    echo Please download manually from: https://www.nvidia.com/download/index.aspx
)
goto :eof

:minimal_preset
echo Creating restore point...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Before Minimal Optimization", 100, 7

:: Basic Windows tweaks
powercfg /setactive scheme_balanced
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 14 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f

:: Light debloating
powershell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *windowsfeedbackhub* | Remove-AppxPackage"

:: Basic network optimizations
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global chimney=enabled
netsh int tcp set global ecncapability=disabled

echo Minimal optimization complete!
timeout /t 3
goto :presets

:recommended_preset
echo Creating restore point...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Before Recommended Optimization", 100, 7

:: Full debloating
call :remove_apps

:: All network tweaks
call :latency_tweaks
call :dns_optimization
call :tcpip_optimization

:: Windows optimizations
call :regedit_tweaks
call :input_lag
call :disable_dvr
call :directx_opt
call :process_opt
call :memory_opt

:: Set high performance
powercfg /setactive scheme_balanced
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

echo Recommended optimization complete!
timeout /t 3
goto :presets

:extreme_preset
echo Creating restore point...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Before Extreme Optimization", 100, 7

:: All optimizations
call :ultimate_performance
call :regedit_tweaks
call :input_lag
call :disable_dvr
call :directx_opt
call :process_opt
call :memory_opt
call :remove_apps
call :clear_temp
call :optimize_disk
call :disable_telemetry
call :disable_diagnostics
call :disable_trackers
call :privacy_settings
call :latency_tweaks
call :dns_optimization
call :tcpip_optimization
call :disable_defender
call :disable_isolation
call :enable_xmp
call :nvidia_tweaks
call :enable_kboost
call :svchost_threshold

echo Extreme optimization complete!
timeout /t 3
goto :presets

:ultimate_performance
echo Enabling Ultimate Performance power plan...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg /setactive SCHEME_CURRENT
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFINCPOL 2
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFINCTHRESHOLD 10
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFBOOSTMODE 2
goto :eof

:regedit_tweaks
echo Applying registry tweaks...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "10000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
goto :eof

:input_lag
echo Reducing input lag...
reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
goto :eof

:disable_dvr
echo Disabling Game DVR...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
goto :eof

:directx_opt
echo Optimizing DirectX...
reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableAGPSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableAGPSupport" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d "20" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDdiDelay" /t REG_DWORD /d "10" /f
goto :eof

:process_opt
echo Optimizing process priorities...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
wmic process where name="csrss.exe" CALL setpriority "high priority"
wmic process where name="winlogon.exe" CALL setpriority "high priority"
goto :eof

:memory_opt
echo Optimizing memory settings...
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=16384,MaximumSize=16384
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d "983040" /f
goto :eof

:remove_apps
echo Removing Windows bloatware...
powershell -Command "Get-AppxPackage *Microsoft.WindowsCopilot* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.OneDrive* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.3DViewer* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.Office.OneNote* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.BingNews* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.549981C3F5F10* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.WindowsAI* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage"
goto :eof

:clear_temp
echo Cleaning temporary files...
del /s /f /q %temp%\*.*
del /s /f /q C:\Windows\Temp\*.*
del /s /f /q C:\Windows\Prefetch\*.*
del /s /f /q C:\Windows\SoftwareDistribution\Download\*.*
cleanmgr /sagerun:1
goto :eof

:optimize_disk
echo Optimizing disk...
defrag C: /O /U
goto :eof

:disable_telemetry
echo Disabling telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
goto :eof

:disable_diagnostics
echo Disabling diagnostics...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableTailoredExperiencesWithDiagnosticData" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "DiagTrackAuthorization" /t REG_DWORD /d "0" /f
goto :eof

:disable_trackers
echo Disabling trackers...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
goto :eof

:privacy_settings
echo Configuring privacy settings...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f
goto :eof

:latency_tweaks
echo Applying network latency tweaks...
netsh int tcp set global congestionprovider=ctcp
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global ecncapability=disabled
netsh int tcp set global rss=enabled
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
goto :eof

:dns_optimization
echo Testing DNS servers...
:: Test Cloudflare DNS
ping -n 1 1.1.1.1 | findstr "Average" > temp.txt
set /p cloudflare_latency=<temp.txt
:: Test Google DNS
ping -n 1 8.8.8.8 | findstr "Average" > temp.txt
set /p google_latency=<temp.txt
del temp.txt

echo Select DNS provider:
echo [1] Cloudflare (1.1.1.1)
echo [2] Google (8.8.8.8)
echo [3] Keep current DNS
set /p dns_choice="Choice: "

if "%dns_choice%"=="1" (
    netsh interface ip set dns "Ethernet" static 1.1.1.1
    netsh interface ip add dns "Ethernet" 1.0.0.1 index=2
)
if "%dns_choice%"=="2" (
    netsh interface ip set dns "Ethernet" static 8.8.8.8
    netsh interface ip add dns "Ethernet" 8.8.4.4 index=2
)
goto :eof

:tcpip_optimization
echo Optimizing TCP/IP settings...
netsh int tcp set global rsc=enabled
netsh int tcp set global chimney=enabled
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global timestamps=disabled
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
goto :eof

:network_monitoring
echo Starting network monitoring...
netstat -e
timeout /t 10
goto :eof

:restore
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Before HT Optimizer Changes", 100, 7
echo Restore point created successfully!
timeout /t 3
goto :main

:undo
echo Undoing changes...
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /f
powercfg -restoredefaultschemes
netsh int tcp reset
netsh int ip reset
netsh winsock reset
netsh advfirewall reset
echo Changes have been reverted. Please restart your computer.
timeout /t 5
goto :main