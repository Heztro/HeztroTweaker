@echo off
powershell -Command "if($Host.UI.RawUI.WindowTitle -notmatch 'Properties$') { $Host.UI.RawUI.FlushInputBuffer(); $console = $Host.UI.RawUI; $cursorSize = $console.CursorSize; $windowSize = $console.WindowSize; $bufferSize = $console.BufferSize; $windowPosition = $console.WindowPosition; $console.WindowTitle = 'HeztroTweaker'; $console.CursorSize = $cursorSize; $console.WindowSize = $windowSize; $console.BufferSize = $bufferSize; $console.WindowPosition = $windowPosition; }"
mode con cols=120 lines=40
title HeztroTweaker - Windows Optimizer
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
color 0D
echo.
echo      :::    ::: ::::::::::::
echo     :+:    :+:     :+:      
echo    +:+    +:+     +:+       
echo   +#++:++#++     +#+        
echo  +#+    +#+     +#+         
echo #+#    #+#     #+#          
echo ###    ###     ###   v2.0
echo.
echo    ======================
echo     Windows Optimizer
echo    ======================
echo.
echo      [1] Quick Optimization Presets
echo      [2] Windows ^& Registry Optimizations
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
goto :main

:loading_animation
echo.
echo    Please wait...
for /l %%i in (1,1,3) do (
    echo    ^> Processing.
    timeout /t 1 /nobreak >nul
    echo    ^> Processing..
    timeout /t 1 /nobreak >nul
    echo    ^> Processing...
    timeout /t 1 /nobreak >nul
    cls
)
goto :eof

:restore
cls
echo.
echo    === Restore Point Management ===
echo.
echo    [1] Create Restore Point
echo    [2] View Restore Points
echo    [3] Back to Main Menu
echo.
set /p restore_choice="Select option: "

:restore
cls
echo.
echo    === System Protection Settings ===
echo.
echo Opening System Protection settings...
systempropertiesprotection
echo.
echo Press any key to return to main menu...
pause >nul
goto :main

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
set /p preset_choice="Select preset: "

if "%preset_choice%"=="1" goto :minimal_preset
if "%preset_choice%"=="2" goto :recommended_preset
if "%preset_choice%"=="3" goto :extreme_preset
if "%preset_choice%"=="4" goto :main
goto :presets

:minimal_preset
echo Creating restore point...
call :loading_animation
powershell -Command "Checkpoint-Computer -Description 'Before Minimal Optimization' -RestorePointType 'MODIFY_SETTINGS'"

echo Applying basic Windows tweaks...
call :loading_animation
powercfg /setactive scheme_balanced
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 14 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f

echo Performing light debloating...
call :loading_animation
powershell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *windowsfeedbackhub* | Remove-AppxPackage"

echo Applying basic network optimizations...
call :loading_animation
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global chimney=enabled
netsh int tcp set global ecncapability=disabled

:windows_opt
cls
echo.
echo    === Windows ^& Registry Optimizations ===
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

if "%win_choice%"=="1" (
    call :ultimate_performance
    call :loading_animation
    echo Optimization complete!
    timeout /t 2 >nul
    goto :windows_opt
)
if "%win_choice%"=="2" (
    call :regedit_tweaks
    call :loading_animation
    echo Optimization complete!
    timeout /t 2 >nul
    goto :windows_opt
)
if "%win_choice%"=="3" (
    call :input_lag
    call :loading_animation
    echo Optimization complete!
    timeout /t 2 >nul
    goto :windows_opt
)
if "%win_choice%"=="4" (
    call :disable_dvr
    call :loading_animation
    echo Optimization complete!
    timeout /t 2 >nul
    goto :windows_opt
)
if "%win_choice%"=="5" (
    call :directx_opt
    call :loading_animation
    echo Optimization complete!
    timeout /t 2 >nul
    goto :windows_opt
)
if "%win_choice%"=="6" (
    call :process_opt
    call :loading_animation
    echo Optimization complete!
    timeout /t 2 >nul
    goto :windows_opt
)
if "%win_choice%"=="7" (
    call :memory_opt
    call :loading_animation
    echo Optimization complete!
    timeout /t 2 >nul
    goto :windows_opt
)
if "%win_choice%"=="8" (
    call :ultimate_performance
    call :regedit_tweaks
    call :input_lag
    call :disable_dvr
    call :directx_opt
    call :process_opt
    call :memory_opt
    call :loading_animation
    echo All optimizations complete!
    timeout /t 2 >nul
    goto :windows_opt
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
echo    [4] Disable Unnecessary Services
echo    [5] Remove Legacy Components
echo    [6] Apply All Debloat Options
echo    [7] Back to Main Menu
echo.
echo Made with Love by Heztro
echo.
set /p debloat_choice="Select option: "

if "%debloat_choice%"=="1" (
    call :remove_apps
    call :loading_animation
    echo Microsoft Apps removed!
    timeout /t 2 >nul
    goto :debloat
)
if "%debloat_choice%"=="2" (
    call :clear_temp
    call :loading_animation
    echo Temporary files cleared!
    timeout /t 2 >nul
    goto :debloat
)
if "%debloat_choice%"=="3" (
    call :optimize_disk
    call :loading_animation
    echo Disk optimized!
    timeout /t 2 >nul
    goto :debloat
)
if "%debloat_choice%"=="4" (
    call :disable_services
    call :loading_animation
    echo Services optimized!
    timeout /t 2 >nul
    goto :debloat
)
if "%debloat_choice%"=="5" (
    call :remove_legacy
    call :loading_animation
    echo Legacy components removed!
    timeout /t 2 >nul
    goto :debloat
)
if "%debloat_choice%"=="6" (
    call :remove_apps
    call :clear_temp
    call :optimize_disk
    call :disable_services
    call :remove_legacy
    call :loading_animation
    echo All debloat options applied!
    timeout /t 2 >nul
    goto :debloat
)
if "%debloat_choice%"=="7" goto :main
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
echo    [5] Disable Cortana
echo    [6] Configure Windows Updates
echo    [7] Apply All Privacy Options
echo    [8] Back to Main Menu
echo.
echo Made with Love by Heztro
echo.
set /p privacy_choice="Select option: "

if "%privacy_choice%"=="1" (
    call :disable_telemetry
    call :loading_animation
    echo Telemetry disabled!
    timeout /t 2 >nul
    goto :privacy
)
if "%privacy_choice%"=="2" (
    call :disable_diagnostics
    call :loading_animation
    echo Diagnostics disabled!
    timeout /t 2 >nul
    goto :privacy
)
if "%privacy_choice%"=="3" (
    call :disable_trackers
    call :loading_animation
    echo Trackers disabled!
    timeout /t 2 >nul
    goto :privacy
)
if "%privacy_choice%"=="4" (
    call :privacy_settings
    call :loading_animation
    echo Privacy settings configured!
    timeout /t 2 >nul
    goto :privacy
)
if "%privacy_choice%"=="5" (
    call :disable_cortana
    call :loading_animation
    echo Cortana disabled!
    timeout /t 2 >nul
    goto :privacy
)
if "%privacy_choice%"=="6" (
    call :configure_updates
    call :loading_animation
    echo Windows Updates configured!
    timeout /t 2 >nul
    goto :privacy
)
if "%privacy_choice%"=="7" (
    call :disable_telemetry
    call :disable_diagnostics
    call :disable_trackers
    call :privacy_settings
    call :disable_cortana
    call :configure_updates
    call :loading_animation
    echo All privacy options applied!
    timeout /t 2 >nul
    goto :privacy
)
if "%privacy_choice%"=="8" goto :main
goto :privacy

:network
cls
echo.
echo    === Network Optimizations ===
echo.
echo    [1] Network Latency Tweaks
echo    [2] DNS Optimization
echo    [3] TCP/IP Optimization
echo    [4] Network Adapter Settings
echo    [5] QoS Optimization
echo    [6] Network Monitoring
echo    [7] Apply All Network Options
echo    [8] Back to Main Menu
echo.
echo Made with Love by Heztro
echo.
set /p network_choice="Select option: "

if "%network_choice%"=="1" (
    call :latency_tweaks
    call :loading_animation
    echo Latency tweaks applied!
    timeout /t 2 >nul
    goto :network
)
if "%network_choice%"=="2" (
    call :dns_optimization
    call :loading_animation
    echo DNS optimized!
    timeout /t 2 >nul
    goto :network
)
if "%network_choice%"=="3" (
    call :tcpip_optimization
    call :loading_animation
    echo TCP/IP optimized!
    timeout /t 2 >nul
    goto :network
)
if "%network_choice%"=="4" (
    call :network_adapter
    call :loading_animation
    echo Network adapter optimized!
    timeout /t 2 >nul
    goto :network
)
if "%network_choice%"=="5" (
    call :qos_optimization
    call :loading_animation
    echo QoS optimized!
    timeout /t 2 >nul
    goto :network
)
if "%network_choice%"=="6" (
    call :network_monitoring
    goto :network
)
if "%network_choice%"=="7" (
    call :latency_tweaks
    call :dns_optimization
    call :tcpip_optimization
    call :network_adapter
    call :qos_optimization
    call :loading_animation
    echo All network options applied!
    timeout /t 2 >nul
    goto :network
)
if "%network_choice%"=="8" goto :main
goto :network

:advanced
cls
echo.
echo    === Advanced Optimizations ===
echo.
echo    [1] Disable Windows Defender
echo    [2] Disable Core Isolation
echo    [3] NVIDIA Tweaks
echo    [4] Enable KBoost
echo    [5] Configure SvcHostSplitThreshold
echo    [6] Unpark CPU Cores
echo    [7] Update NVIDIA Drivers
echo    [8] Memory Optimization
echo    [9] Apply All Advanced Options
echo    [10] Back to Main Menu
echo.
echo Made with Love by Heztro
echo.
set /p advanced_choice="Select option: "

if "%advanced_choice%"=="1" (
    call :disable_defender
    call :loading_animation
    echo Windows Defender disabled!
    timeout /t 2 >nul
    goto :advanced
)
if "%advanced_choice%"=="2" (
    call :disable_isolation
    call :loading_animation
    echo Core Isolation disabled!
    timeout /t 2 >nul
    goto :advanced
)
if "%advanced_choice%"=="3" (
    call :nvidia_tweaks
    call :loading_animation
    echo NVIDIA tweaks applied!
    timeout /t 2 >nul
    goto :advanced
)
if "%advanced_choice%"=="4" (
    call :enable_kboost
    call :loading_animation
    echo KBoost enabled!
    timeout /t 2 >nul
    goto :advanced
)
if "%advanced_choice%"=="5" (
    call :svchost_threshold
    call :loading_animation
    echo SvcHostSplitThreshold configured!
    timeout /t 2 >nul
    goto :advanced
)
if "%advanced_choice%"=="6" (
    call :unpark_cores
    call :loading_animation
    echo CPU cores unparked!
    timeout /t 2 >nul
    goto :advanced
)
if "%advanced_choice%"=="7" (
    call :update_nvidia
    call :loading_animation
    echo NVIDIA drivers updated!
    timeout /t 2 >nul
    goto :advanced
)
if "%advanced_choice%"=="8" (
    call :memory_optimization
    call :loading_animation
    echo Memory optimized!
    timeout /t 2 >nul
    goto :advanced
)
if "%advanced_choice%"=="9" (
    call :disable_defender
    call :disable_isolation
    call :nvidia_tweaks
    call :enable_kboost
    call :svchost_threshold
    call :unpark_cores
    call :update_nvidia
    call :memory_optimization
    call :loading_animation
    echo All advanced options applied!
    timeout /t 2 >nul
    goto :advanced
)
if "%advanced_choice%"=="10" goto :main
goto :advanced

:disable_services
echo Disabling unnecessary services...
sc config "TabletInputService" start= disabled >nul 2>&1
sc config "DiagTrack" start= disabled >nul 2>&1
sc config "dmwappushservice" start= disabled >nul 2>&1
sc config "RetailDemo" start= disabled >nul 2>&1
sc config "lfsvc" start= disabled >nul 2>&1
goto :eof

:remove_legacy
echo Removing legacy components...
dism /online /disable-feature /featurename:WindowsMediaPlayer /norestart >nul 2>&1
dism /online /disable-feature /featurename:Internet-Explorer-Optional-amd64 /norestart >nul 2>&1
goto :eof

:disable_cortana
echo Disabling Cortana...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Experience\AllowCortana" /v "value" /t REG_DWORD /d 0 /f
goto :eof

:configure_updates
echo Configuring Windows Updates...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d 2 /f
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
goto :eof

:network_adapter
echo Optimizing network adapter settings...
powershell -Command "Get-NetAdapter | Set-NetIPInterface -AutomaticMetric Disabled"
powershell -Command "Get-NetAdapter | Set-NetIPv4Protocol -WeakHostSend Disabled -WeakHostReceive Disabled"
goto :eof

:qos_optimization
echo Optimizing QoS settings...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t REG_DWORD /d "1" /f
goto :eof

:memory_optimization
echo Optimizing memory settings...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f
goto :eof

:update_nvidia
echo Checking for NVIDIA updates...
echo This may take a few minutes...
powershell -Command "& { $url = 'https://us.download.nvidia.com/Windows/537.58/537.58-desktop-win10-win11-64bit-international-dch-whql.exe'; $output = '$env:TEMP\nvidia_537.58.exe'; (New-Object System.Net.WebClient).DownloadFile($url, $output); Start-Process -FilePath $output -ArgumentList '/s','/n' -Wait }"
goto :eof

echo.
echo Minimal optimization complete!
echo.
echo [1] Back to Presets
echo [2] Back to Main Menu
echo.
set /p nav_choice="Select option: "
if "%nav_choice%"=="1" goto :presets
if "%nav_choice%"=="2" goto :main
goto :minimal_preset

:recommended_preset
echo Creating restore point...
call :loading_animation
powershell -Command "Checkpoint-Computer -Description 'Before Recommended Optimization' -RestorePointType 'MODIFY_SETTINGS'"

echo Applying full debloating...
call :loading_animation
call :remove_apps

echo Applying network optimizations...
call :loading_animation
call :latency_tweaks
call :dns_optimization
call :tcpip_optimization

echo Applying Windows optimizations...
call :loading_animation
call :regedit_tweaks
call :input_lag
call :disable_dvr
call :directx_opt
call :process_opt
call :memory_opt

echo Setting high performance power plan...
call :loading_animation
powercfg /setactive scheme_balanced
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

echo.
echo Recommended optimization complete!
echo.
echo [1] Back to Presets
echo [2] Back to Main Menu
echo.
set /p nav_choice="Select option: "
if "%nav_choice%"=="1" goto :presets
if "%nav_choice%"=="2" goto :main
goto :recommended_preset

:extreme_preset
echo Creating restore point...
call :loading_animation
powershell -Command "Checkpoint-Computer -Description 'Before Extreme Optimization' -RestorePointType 'MODIFY_SETTINGS'"

echo Applying all optimizations...
call :loading_animation
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
call :nvidia_tweaks
call :enable_kboost
call :svchost_threshold
call :unpark_cores

echo.
echo Extreme optimization complete!
echo.
echo [1] Back to Presets
echo [2] Back to Main Menu
echo.
set /p nav_choice="Select option: "
if "%nav_choice%"=="1" goto :presets
if "%nav_choice%"=="2" goto :main
goto :extreme_preset

:ultimate_performance
echo Enabling Ultimate Performance power plan...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 > nul 2>&1
powercfg /setactive SCHEME_CURRENT
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFINCPOL 2
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFINCTHRESHOLD 10
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFBOOSTMODE 2
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
wmic process where name="csrss.exe" CALL setpriority "high priority" >nul 2>&1
wmic process where name="winlogon.exe" CALL setpriority "high priority" >nul 2>&1
goto :eof

:memory_opt
echo Optimizing memory settings...
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False >nul 2>&1
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=16384,MaximumSize=16384 >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d "983040" /f
goto :eof

:remove_apps
cls
echo.
echo    === Remove Microsoft Apps ===
echo.
echo Enter the numbers of apps you want to KEEP (space-separated)
echo Example: 1 5 7 will keep those apps and remove the rest
echo The following apps can be safely removed:
echo.
echo    [1] 3D Viewer
echo    [2] Microsoft Solitaire Collection
echo    [3] Office Hub (Office App)
echo    [4] OneNote for Windows 10
echo    [5] Skype
echo    [6] Mixed Reality Portal
echo    [7] Feedback Hub
echo    [8] Get Help
echo    [9] Microsoft Tips
echo    [10] Paint 3D
echo    [11] Voice Recorder
echo    [12] Weather
echo    [13] News
echo    [14] Movies and TV
echo    [15] Bing Apps
echo    [16] Your Phone
echo    [17] Microsoft To Do
echo    [18] Power Automate (Note: Automation tool for workflows between apps - useful for office work)
echo    [19] Mail and Calendar
echo    [20] People
echo    [21] Cortana
echo    [22] Windows Copilot
echo    [23] OneDrive
echo    [24] Teams
echo    [25] Xbox Apps
echo    [26] Phone Link
echo    [27] Quick Assist
echo    [28] Microsoft Family
echo    [29] Microsoft Pay
echo    [30] Office Speaking Dictionary
echo.
echo Critical system apps like Store, Security, Photos, Calculator, etc. are protected.
echo.
set /p keep_apps="Enter numbers to keep (or press Enter to remove all): "

echo.
echo Removing selected Microsoft Apps...
call :loading_animation

setlocal EnableDelayedExpansion

REM Create a lookup table for apps to keep
for %%a in (%keep_apps%) do set "keep_app[%%a]=1"

REM Remove non-essential apps based on whitelist
if not defined keep_app[1] powershell -Command "Get-AppxPackage Microsoft.Microsoft3DViewer | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[2] powershell -Command "Get-AppxPackage Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[3] powershell -Command "Get-AppxPackage Microsoft.MicrosoftOfficeHub | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[4] powershell -Command "Get-AppxPackage Microsoft.Office.OneNote | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[5] powershell -Command "Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[6] powershell -Command "Get-AppxPackage Microsoft.MixedReality.Portal | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[7] powershell -Command "Get-AppxPackage Microsoft.WindowsFeedbackHub | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[8] powershell -Command "Get-AppxPackage Microsoft.GetHelp | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[9] powershell -Command "Get-AppxPackage Microsoft.Getstarted | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[10] powershell -Command "Get-AppxPackage Microsoft.MSPaint | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[11] powershell -Command "Get-AppxPackage Microsoft.WindowsSoundRecorder | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[12] powershell -Command "Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[13] powershell -Command "Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[14] powershell -Command "Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[15] powershell -Command "Get-AppxPackage *Bing* | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[16] powershell -Command "Get-AppxPackage Microsoft.YourPhone | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[17] powershell -Command "Get-AppxPackage Microsoft.Todos | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[18] powershell -Command "Get-AppxPackage Microsoft.PowerAutomateDesktop | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[19] powershell -Command "Get-AppxPackage microsoft.windowscommunicationsapps | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[20] powershell -Command "Get-AppxPackage Microsoft.People | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[21] powershell -Command "Get-AppxPackage Microsoft.549981C3F5F10 | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[22] powershell -Command "Get-AppxPackage Microsoft.WindowsCopilot | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[23] powershell -Command "Get-AppxPackage Microsoft.OneDrive | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[24] powershell -Command "Get-AppxPackage MicrosoftTeams | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[25] (
    powershell -Command "Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage" >nul 2>&1
    powershell -Command "Get-AppxPackage Microsoft.XboxIdentityProvider | Remove-AppxPackage" >nul 2>&1
    powershell -Command "Get-AppxPackage Microsoft.XboxSpeechToTextOverlay | Remove-AppxPackage" >nul 2>&1
    powershell -Command "Get-AppxPackage Microsoft.XboxGameOverlay | Remove-AppxPackage" >nul 2>&1
    powershell -Command "Get-AppxPackage Microsoft.Xbox.TCUI | Remove-AppxPackage" >nul 2>&1
    powershell -Command "Get-AppxPackage Microsoft.GamingApp | Remove-AppxPackage" >nul 2>&1
)
if not defined keep_app[26] powershell -Command "Get-AppxPackage Microsoft.YourPhone | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[27] powershell -Command "Get-AppxPackage MicrosoftCorporationII.QuickAssist | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[28] powershell -Command "Get-AppxPackage Microsoft.Xbox.FamilySettings | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[29] powershell -Command "Get-AppxPackage Microsoft.Wallet | Remove-AppxPackage" >nul 2>&1
if not defined keep_app[30] powershell -Command "Get-AppxPackage Microsoft.LanguageExperiencePacken-US | Remove-AppxPackage" >nul 2>&1

REM Additional Cleanup for Cortana
if not defined keep_app[21] (
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Experience\AllowCortana" /v "value" /t REG_DWORD /d "0" /f >nul 2>&1
)

REM Additional Cleanup for OneDrive
if not defined keep_app[23] (
    taskkill /F /IM OneDrive.exe >nul 2>&1
    %SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall >nul 2>&1
)

echo Apps removal complete!
echo.
endlocal
goto :eof

:clear_temp
echo Cleaning temporary files...
del /s /f /q %temp%\*.* >nul 2>&1
del /s /f /q C:\Windows\Temp\*.* >nul 2>&1
del /s /f /q C:\Windows\Prefetch\*.* >nul 2>&1
del /s /f /q C:\Windows\SoftwareDistribution\Download\*.* >nul 2>&1
powershell -Command "Clear-RecycleBin -Force" >nul 2>&1
goto :eof

:network_monitoring
cls
echo.
echo    === Network Monitoring ===
echo.
echo Monitoring network performance...
echo Press any key to stop monitoring
echo.

:monitor_loop
cls
echo    === Network Statistics ===
echo.
netstat -e
echo.
echo    === Current Connections ===
netstat -n | find "ESTABLISHED"
echo.
echo    === Network Interface Status ===
netsh interface show interface
echo.
echo    === Current DNS Settings ===
ipconfig /all | find "DNS"
echo.
echo Press any key to stop monitoring...
echo.
timeout /t 2 >nul 2>&1
if errorlevel 1 goto :monitor_end
goto :monitor_loop

:monitor_end
echo.
echo [1] Back to Network Menu
echo [2] Back to Main Menu
echo.
set /p monitor_choice="Select option: "
if "%monitor_choice%"=="1" goto :network
if "%monitor_choice%"=="2" goto :main
goto :monitor_end

:optimize_disk
echo Optimizing disk...
defrag C: /O /U >nul 2>&1
goto :eof

:disable_telemetry
echo Disabling telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
sc stop dmwappushservice >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1
goto :eof

:disable_diagnostics
echo Disabling diagnostics...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableTailoredExperiencesWithDiagnosticData" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "DiagTrackAuthorization" /t REG_DWORD /d "0" /f
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable >nul 2>&1
goto :eof

:disable_trackers
echo Disabling trackers...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f
goto :eof

:privacy_settings
echo Configuring privacy settings...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
goto :eof

:latency_tweaks
echo Applying network latency tweaks...
netsh int tcp set global congestionprovider=ctcp >nul 2>&1
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global ecncapability=disabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
goto :eof

:dns_optimization
echo Testing DNS servers...
set "cloudflare_latency=999"
set "google_latency=999"

ping -n 1 1.1.1.1 | findstr "Average" > temp.txt
if %errorlevel% equ 0 (
    for /f "tokens=4 delims==" %%a in (temp.txt) do set "cloudflare_latency=%%a"
)

ping -n 1 8.8.8.8 | findstr "Average" > temp.txt
if %errorlevel% equ 0 (
    for /f "tokens=4 delims==" %%a in (temp.txt) do set "google_latency=%%a"
)
del temp.txt

echo.
echo Current DNS Latency:
echo Cloudflare (1.1.1.1): %cloudflare_latency%ms
echo Google (8.8.8.8): %google_latency%ms
echo.
echo Select DNS provider:
echo [1] Cloudflare (1.1.1.1)
echo [2] Google (8.8.8.8)
echo [3] Keep current DNS
echo.
set /p dns_choice="Choice: "

if "%dns_choice%"=="1" (
    netsh interface ip set dns "Ethernet" static 1.1.1.1 >nul 2>&1
    netsh interface ip add dns "Ethernet" 1.0.0.1 index=2 >nul 2>&1
    echo DNS set to Cloudflare
)
if "%dns_choice%"=="2" (
    netsh interface ip set dns "Ethernet" static 8.8.8.8 >nul 2>&1
    netsh interface ip add dns "Ethernet" 8.8.4.4 index=2 >nul 2>&1
    echo DNS set to Google
)
goto :eof

:tcpip_optimization
echo Optimizing TCP/IP settings...
netsh int tcp set global rsc=enabled >nul 2>&1
netsh int tcp set global chimney=enabled >nul 2>&1
netsh int tcp set global dca=enabled >nul 2>&1
netsh int tcp set global netdma=enabled >nul 2>&1
netsh int tcp set global timestamps=disabled >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
goto :eof

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

:nvidia_tweaks
echo Applying NVIDIA tweaks...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PerfLevelSrc" /t REG_DWORD /d "8738" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PowerMizerEnable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PowerMizerLevel" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PowerMizerLevelAC" /t REG_DWORD /d "1" /f
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
goto :eof

:undo
cls
echo Creating restore point before undoing changes...
call :loading_animation
powershell -Command "Checkpoint-Computer -Description 'Before Undoing HeztroTweaker Changes' -RestorePointType 'MODIFY_SETTINGS'"

echo Undoing changes...
call :loading_animation
:: Reset power settings
powercfg -restoredefaultschemes

:: Reset network settings
netsh int tcp reset
netsh int ip reset
netsh winsock reset
netsh advfirewall reset

:: Reset registry settings
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /f >nul 2>&1

:: Re-enable services
sc config DiagTrack start= auto >nul 2>&1
sc config dmwappushservice start= auto >nul 2>&1

:: Reset mouse settings
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "1" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "6" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "10" /f

echo.
echo Changes have been reverted. Please restart your computer.
echo.
echo [1] Back to Main Menu
echo [2] Exit
echo.
set /p undo_choice="Select option: "
if "%undo_choice%"=="1" goto :main
if "%undo_choice%"=="2" exit
goto :undo
