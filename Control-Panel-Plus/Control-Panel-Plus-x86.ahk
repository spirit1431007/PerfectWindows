#Persistent
#NoTrayIcon
#SingleInstance ignore

v:="1.0.0"

if A_Is64bitOS
{
    msgbox,0x40130,Windows 高级控制面板 %v% by 知阳,您必须使用本工具的 64 位版本以调整 Windows 高级设置！
    exitapp
}

if !A_IsAdmin
{
try
{
Run *RunAs "%A_ScriptFullPath%" /restart
}
sleep 500
msgbox,0x40130,Windows 高级控制面板 %v% by 知阳,本工具需要管理员权限以调整 Windows 设置！
exitapp
}

SetWorkingDir %systemroot%\system32

gui -minimizebox +alwaysontop
gui, font,w350 s12 bold q5, Segoe UI
Gui, Color, ffffff

gui,add,text,h35 y20 x20,实用功能

gui,add,checkbox,h35 yp+40 vcortana,小娜
regread,allowcortana,HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search,AllowCortana
if allowcortana=0
guicontrol,,Cortana,0
else
guicontrol,,Cortana,1

gui,add,checkbox,h35 yp+35 vonedrive,OneDrive
regread,disableonedrive,HKLM\Software\Policies\Microsoft\Windows\OneDrive,DisableFileSyncNGSC
if disableonedrive=1
guicontrol,,onedrive,0
else
guicontrol,,onedrive,1

gui,add,checkbox,h35 yp+35 vtimeline,时间轴
regread,timeline,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System,EnableActivityFeed
if timeline=0
guicontrol,,timeline,0
else
guicontrol,,timeline,1

gui,add,checkbox,h35 yp+35 vsmartpowerplan,智能电源计划
regread,smartpowerplan,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings,Smart Power Plan
if smartpowerplan=1
guicontrol,,smartpowerplan,1
else
guicontrol,,smartpowerplan,0

gui,add,checkbox,h35 yp+35 vlockscreen,锁屏
regread,nolockscreen,HKLM\Software\Policies\Microsoft\Windows\Personalization,NoLockScreen
if nolockscreen=1
guicontrol,,lockscreen,0
else
guicontrol,,lockscreen,1

gui,add,checkbox,h35 yp+35 vphotoviewer,旧版照片查看器
guicontrol,,photoviewer,1

gui,add,checkbox,h35 yp+35 viedge,同步 IE 和 Edge 的收藏夹
regread,enableiedge,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main,SyncFavoritesBetweenIEAndMicrosoftEdge
if enableiedge=1
guicontrol,,iedge,1
else
guicontrol,,iedge,0

gui,add,checkbox,h35 yp+35 vhomegroup,家庭组
regread,disablehomegroup,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup,DisableHomeGroup
if disablehomegroup=1
guicontrol,,homegroup,0
else
guicontrol,,homegroup,1

gui,add,checkbox,h35 yp+35 vUseOLEDTaskbarTransparency,更透明的任务栏
regread,UseOLEDTaskbarTransparency,HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced,UseOLEDTaskbarTransparency
if UseOLEDTaskbarTransparency=1
guicontrol,,UseOLEDTaskbarTransparency,1
else
guicontrol,,UseOLEDTaskbarTransparency,0

gui,add,text,h35 y20 x280,关乎安全

gui,add,checkbox,h35 yp+40 vau,自动更新
regread,noau,HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU,noautoupdate
if noau=1
guicontrol,,au,0
else
guicontrol,,au,1

gui,add,checkbox,h35 yp+35 vwd,Windows Defender
regread,nowd,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender,DisableAntispyware
if nowd=1
guicontrol,,wd,0
else
guicontrol,,wd,1

gui,add,checkbox,h35 yp+35 vuacpassword,要求密码的 UAC
regread,uacpassword,HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System,ConsentPromptBehaviorAdmin
if uacpassword=1
guicontrol,,uacpassword,1
else
guicontrol,,uacpassword,0

gui,add,checkbox,h35 yp+35 vsystemrestore,系统还原
regread,nosystemrestore,HKLM\Software\Policies\Microsoft\Windows NT\SystemRestore,DisableSR
if nosystemrestore=1
guicontrol,,systemrestore,0
else
guicontrol,,systemrestore,1

gui,add,checkbox,h35 yp+35 vfilehistory,文件历史记录
regread,nofilehistory,HKLM\Software\Policies\Microsoft\Windows\FileHistory,Disabled
if nofilehistory=1
guicontrol,,filehistory,0
else
guicontrol,,filehistory,1

gui,add,checkbox,h35 yp+35 vregedit,注册表编辑器
regread,noregedit,HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System,DisableRegistryTools
if noregedit=1
guicontrol,,regedit,0
else
guicontrol,,regedit,1

gui,add,checkbox,h35 yp+35 vtaskmgr,任务管理器
regread,notaskmgr,HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System,DisableTaskMgr
if notaskmgr=1
guicontrol,,taskmgr,0
else
guicontrol,,taskmgr,1

gui,add,checkbox,h35 yp+35 vremoteregistry,远程访问注册表
regread,remoteregistry,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\remoteregistry,start
if remoteregistry=4
guicontrol,,remoteregistry,0
else
guicontrol,,remoteregistry,1

gui,add,checkbox,h35 yp+35 vsmbv1,SMBv1
regread,smbv1,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mrxsmb10,start
if smbv1=4
guicontrol,,smbv1,0
else
guicontrol,,smbv1,1

gui,add,checkbox,h35 yp+35 vNetBIOS,NetBIOS
regread,NetBIOS,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBIOS,start
if NetBIOS=4
guicontrol,,NetBIOS,0
else
guicontrol,,NetBIOS,1

gui,add,checkbox,h35 yp+35 vfilesharing,文件共享
regread,filesharing,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lmhosts,start
if filesharing=4
guicontrol,,filesharing,0
else
guicontrol,,filesharing,1

gui,add,checkbox,h35 yp+35 vautorun,自动播放
regread,noautorun,HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer,noautorun
if noautorun=1
guicontrol,,autorun,0
else
guicontrol,,autorun,1

gui,add,text,h35 y20 x500,后台服务

gui,add,checkbox,h35 yp+40 vsuperfetch,超级预读取
regread,Superfetch,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SysMain,start
if Superfetch=4
guicontrol,,Superfetch,0
else
guicontrol,,Superfetch,1

gui,add,checkbox,h35 yp+35 vmaintenance,自动维护
regread,nomaintenance,HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance,MaintenanceDisabled
if nomaintenance=1
guicontrol,,Maintenance,0
else
guicontrol,,Maintenance,1

gui,add,checkbox,h35 yp+35 viphelper,IPv6
regread,iphelper,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\iphlpsvc,start
if iphelper=4
guicontrol,,iphelper,0
else
guicontrol,,iphelper,1

gui,add,checkbox,h35 yp+35 vdefrag,自动整理磁盘碎片
regread,nodefrag,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\defragsvc,nodefrag
if nodefrag=1
guicontrol,,defrag,0
else
guicontrol,,defrag,1

gui,add,checkbox,h35 yp+35 vwsearch,文件索引
regread,wsearch,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wsearch,start
if wsearch=4
guicontrol,,wsearch,0
else
guicontrol,,wsearch,1

gui,add,checkbox,h35 yp+35 vpca,程序兼容性助手
regread,pca,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PcaSvc,start
if pca=4
guicontrol,,pca,0
else
guicontrol,,pca,1

gui,add,checkbox,h35 yp+35 verrorreport,错误报告
regread,errorreport,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WerSvc,start
if errorreport=4
guicontrol,,errorreport,0
else
guicontrol,,errorreport,1

gui,add,checkbox,h35 yp+35 vuserexprience,用户体验反馈
regread,userexprience,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack,start
if userexprience=4
guicontrol,,userexprience,0
else
guicontrol,,userexprience,1

gui,show,w750 h520 center,Windows 高级控制面板 %v% by 知阳
return

guiclose:
guiescape:

regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc,start,2
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv,start,2
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache,start,2
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\defragsvc,start,3

guicontrolget,cortana
if cortana=1
{
regdelete,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search,allowcortana
regdelete,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search,allowcortanaabovelock
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search,allowcortana,0
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search,allowcortanaabovelock,0
}

guicontrolget,onedrive
if onedrive=1
{
regdelete,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive,DisableFileSync
regdelete,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive,DisableFileSyncNGSC
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive,DisableFileSync,1
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive,DisableFileSyncNGSC,1
}

guicontrolget,timeline
if timeline=1
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System,EnableActivityFeed,1
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System,EnableActivityFeed,0
}

guicontrolget,smartpowerplan
if smartpowerplan=1
{
filedelete,smartpowerplan.reg
regdelete,HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System,DisableRegistryTools
fileappend,
(
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Power]
"Start"=dword:00000002

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings]
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings]
"Smart Power Plan"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\03680956-93bc-4294-bba6-4e0f09bb717f]
"DCSettingIndex"=dword:00000001
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\10778347-1370-4ee0-8bbd-33bdacaade49]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\12bbebe6-58d6-4636-95bb-3217ef867c1a]
"DCSettingIndex"=dword:00000003
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\17aaa29b-8b43-4b94-aafe-35f64daaf1ee]
"DCSettingIndex"=dword:00000032
"ACSettingIndex"=dword:00000032

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\309dce9b-bef4-4119-9921-a851fb12f0f4]
"DCSettingIndex"=dword:00000001
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4]
"DCSettingIndex"=dword:00000002
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\3619c3f2-afb2-4afc-b0e9-e7fef372de36]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000002

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\48e6b7a6-50f5-4782-a5d4-53bb8f07e226]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\4c793e7d-a264-42e1-87d3-7a0d2f523ccd]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\637EA02F-BBCB-4015-8E2C-A1C7B9C0B546]
"DCSettingIndex"=dword:00000002
"ACSettingIndex"=dword:00000002

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\6738E2C4-E8A5-4A42-B16A-E040E769756E]
"DCSettingIndex"=dword:0000012c
"ACSettingIndex"=dword:00002a30

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0]
"ACSettingIndex"=dword:00002a30
"DCSettingIndex"=dword:00002a30

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\8183ba9a-e910-48da-8769-14ae6dc1170a]
"DCSettingIndex"=dword:0000000a
"ACSettingIndex"=dword:0000000a

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\893dee8e-2bef-41e0-89c6-b55d0929964c]
"DCSettingIndex"=dword:00000005
"ACSettingIndex"=dword:00000064

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\90959D22-D6A1-49B9-AF93-BCE885AD335B]
"ACSettingIndex"=dword:00002a30
"DCSettingIndex"=dword:00002a30

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\94d3a615-a899-4ac5-ae2b-e4d8f634367f]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9A66D8D7-4FF7-4EF9-B5A2-5A326CA2A469]
"DCSettingIndex"=dword:00000005
"ACSettingIndex"=dword:00000005

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\a1662ab2-9d34-4e53-ba8b-2639b9e20857]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000003

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\A4B195F5-8225-47D8-8012-9D41369786E2]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab]
"DCSettingIndex"=dword:00000001
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\B7A27025-E569-46c2-A504-2B96CAD225A1]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\bc5038f7-23e0-4960-96da-33abaf5935ec]
"DCSettingIndex"=dword:00000064
"ACSettingIndex"=dword:00000064

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\bcded951-187b-4d05-bccc-f7e51960c258]
"DCSettingIndex"=dword:00000001
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d]
"ACSettingIndex"=dword:00000000
"DCSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d]
"DCSettingIndex"=dword:00000001
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\E69653CA-CF7F-4F05-AA73-CB833FA90AD4]
"DCSettingIndex"=dword:00000064
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\ee12f906-d277-404b-b6da-e5fa1a576df5]
"DCSettingIndex"=dword:00000002
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\F3C5027D-CD16-4930-AA6B-90DB844A8F00]
"DCSettingIndex"=dword:00000007
"ACSettingIndex"=dword:00000007

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\fbd9aa66-9553-4097-ba44-ed6e9d65eab8]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000000


),smartpowerplan.reg,UTF-16
runwait,regedit.exe /s smartpowerplan.reg,,hide
filedelete,smartpowerplan.reg
}
else
{
regdelete,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings
}

guicontrolget,lockscreen
if lockscreen=1
regdelete,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization,NoLockScreen
else
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization,NoLockScreen,1

guicontrolget,iedge
if iedge=1
regwrite,reg_dword,HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\MicrosoftEdge\Main,SyncFavoritesBetweenIEAndMicrosoftEdge,1
else
regdelete,HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\MicrosoftEdge\Main,SyncFavoritesBetweenIEAndMicrosoftEdge

guicontrolget,homegroup
if homegroup=1
{
regdelete,HKLM\Software\Policies\Microsoft\Windows\HomeGroup
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupListener,start,2
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupProvider,start,2
}
else
{
regwrite,reg_dword,HKLM\Software\Policies\Microsoft\Windows\HomeGroup,disablehomegroup,1
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupListener,start,4
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupProvider,start,4
}

guicontrolget,UseOLEDTaskbarTransparency
if UseOLEDTaskbarTransparency=1
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced,UseOLEDTaskbarTransparency,1
else
regdelete,HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced,UseOLEDTaskbarTransparency

guicontrolget,au
regdelete,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\au,auoptions
regdelete,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\au,noautoupdate
if au=1
{
runwait,icacls.exe "%WINDIR%\System32\UsoClient.exe" /reset,,hide
runwait,icacls.exe "%WINDIR%\System32\MusNotification.exe" /reset,,hide
}
else
{
runwait,takeown.exe /f "%WINDIR%\System32\UsoClient.exe" /a,,hide
runwait,icacls.exe "%WINDIR%\System32\UsoClient.exe" /inheritance:r /remove "Administrators" "Authenticated Users" "Users" "System",,hide
runwait,takeown.exe /f "%WINDIR%\System32\MusNotification.exe" /a,,hide
runwait,icacls.exe "%WINDIR%\System32\MusNotification.exe" /inheritance:r /remove "Administrators" "Authenticated Users" "Users" "System",,hide
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\au,noautoupdate,1
}

guicontrolget,wd
regdelete,HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System,DisableRegistryTools
runwait,schtasks.exe /DELETE /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" /F,,hide
if wd=1
{
regwrite,reg_dword,HKLM\Software\Policies\Microsoft\Windows Defender,DisableAntiSpyware,0
filedelete,WindowsDefenderZZY.reg
fileappend,
(
Windows Registry Editor Version 5.00

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]
"DisableRoutinelyTakingAction"=dword:00000000
"AllowFastServiceStartup"=dword:00000001
"ServiceKeepAlive"=dword:00000000
"DisableAntispyware"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Quarantine]
"PurgeItemsAfterDelay"=dword:00000001
"LocalSettingOverridePurgeItemsAfterDelay"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine]
"MpEnablePus"=dword:00000001
"MpCloudBlockLevel"=dword:00000002
"MpBafsExtendedTimeout"=dword:00000032

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection]
"DisableIOAVProtection"=-
"DisableRealtimeMonitoring"=-
"DisableBehaviorMonitoring"=-
"DisableOnAccessProtection"=-
"DisableScanOnRealtimeEnable"=dword:00000000
"DisableRawWriteNotification"=dword:00000000
"IOAVMaxSize"=dword:0098967f
"RealtimeScanDirection"=dword:00000000
"LocalSettingOverrideDisableBehaviorMonitoring"=dword:00000000
"LocalSettingOverrideDisableOnAccessProtection"=dword:00000000
"LocalSettingOverrideDisableIOAVProtection"=dword:00000000
"LocalSettingOverrideDisableRealtimeMonitoring"=dword:00000000
"LocalSettingOverrideRealtimeScanDirection"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Remediation]
"LocalSettingOverrideScan_ScheduleTime"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet]
"SpynetReporting"=dword:00000002
"LocalSettingOverrideSpynetReporting"=dword:00000000
"SubmitSamplesConsent"=dword:00000003
"DisableBlockAtFirstSeen"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Scan]
"ArchieveMaxSize"=dword:00000000
"ArchieveMaxDepth"=dword:ffffffff
"AvgCPULoadFactor"=dword:00000032
"DisableEmailScanning"=dword:00000000
"DisableArchiveScanning"=dword:00000000
"DisableRemovableDriveScanning"=dword:00000000
"DisablePackedExeScanning"=dword:00000000
"DisableHeuristics"=dword:00000000
"DisableReparsePointScanning"=dword:00000001
"DisableRemovableDriveScanning"=dword:00000000
"DisableScanningNetworkFiles"=dword:00000000
"CheckForSignaturesBeforeRunningScan"=dword:00000001
"ScanOnlyIfIdle"=dword:00000001
"PurgeItemsAfterDelay"=dword:00000001
"LocalSettingOverrideScanParameters"=dword:00000000
"LocalSettingOverrideAvgCPULoadFactor"=dword:00000000
"LocalSettingOverrideScheduleDay"=dword:00000000
"LocalSettingOverrideScheduleQuickScanTime"=dword:00000000
"LocalSettingOverrideScheduleTime"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates]
"UpdateOnStartUp"=dword:00000001
"DisableUpdateOnStartupWithoutEngine"=dword:00000000
"AVSignatureDue"=dword:00000001
"ASSignatureDue"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Threats]
"Threats_ThreatSeverityDefaultAction"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction]
"1"="2"
"2"="2"
"4"="3"
"5"="3"

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR]
"ExploitGuard_ASR_Rules"=dword:00000001

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules]
"BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550"="1"
"D4F940AB-401B-4EFC-AADC-AD5F3C50688A"="1"
"3B576869-A4EC-4529-8536-B80A7769E899"="1"
"75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84"="1"
"D3E037E1-3EB8-44C8-A917-57927947596D"="1"
"5BEB7EFE-FD9A-4556-801D-275E5FFC04CC"="1"
"92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B"="1"

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access]
"EnableControlledFolderAccess"=dword:00000000
"ExploitGuard_ControlledFolderAccess_ProtectedFolders"=dword:00000000

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access\ProtectedFolders]

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection]
"EnableNetworkProtection"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender ExploitGuard\Exploit Protection]
"ExploitProtectionSettings"=-

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Device performance and health]
"UILockDown"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Family options]
"UILockDown"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Firewall and network protection]
"UILockDown"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection]
"UILockDown"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Enterprise Customization]
"Url"="microsoft.com/en-us/wdsi"
"CompanyName"="Windows Defender Security Intelligence"

),WindowsDefenderZZY.reg,UTF-16
runwait,regedit.exe /s WindowsDefenderZZY.reg
filedelete,WindowsDefenderZZY.reg
filedelete,WindowsDefenderZZY.xml
fileappend,
(
<?xml version="1.0" encoding="UTF-16"?>
<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">
  <RegistrationInfo>
    <URI>\Microsoft\Windows\Windows Defender\Windows Defender Signature Update</URI>
  </RegistrationInfo>
  <Triggers>
    <TimeTrigger>
      <Repetition>
        <Interval>PT30M</Interval>
        <StopAtDurationEnd>false</StopAtDurationEnd>
      </Repetition>
      <StartBoundary>2000-01-01T00:00:00</StartBoundary>
      <Enabled>true</Enabled>
    </TimeTrigger>
  </Triggers>
  <Principals>
    <Principal id="Author">
      <RunLevel>HighestAvailable</RunLevel>
    </Principal>
  </Principals>
  <Settings>
    <MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>
    <DisallowStartIfOnBatteries>false</DisallowStartIfOnBatteries>
    <StopIfGoingOnBatteries>false</StopIfGoingOnBatteries>
    <AllowHardTerminate>true</AllowHardTerminate>
    <StartWhenAvailable>true</StartWhenAvailable>
    <RunOnlyIfNetworkAvailable>false</RunOnlyIfNetworkAvailable>
    <IdleSettings>
      <StopOnIdleEnd>false</StopOnIdleEnd>
      <RestartOnIdle>true</RestartOnIdle>
    </IdleSettings>
    <AllowStartOnDemand>true</AllowStartOnDemand>
    <Enabled>true</Enabled>
    <Hidden>true</Hidden>
    <RunOnlyIfIdle>false</RunOnlyIfIdle>
    <WakeToRun>false</WakeToRun>
    <ExecutionTimeLimit>PT0S</ExecutionTimeLimit>
    <Priority>7</Priority>
  </Settings>
  <Actions Context="Author">
    <Exec>
      <Command>"%systemdrive%\Program Files\Windows Defender\MpCmdRun.exe"</Command>
      <Arguments>-SignatureUpdate -MMPC</Arguments>
    </Exec>
  </Actions>
</Task>
),WindowsDefenderZZY.xml,UTF-16
runwait,schtasks.exe /CREATE /RU SYSTEM /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" /XML WindowsDefenderZZY.xml /F,,hide
;runwait,schtasks.exe /RUN /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" /I,,hide
filedelete,WindowsDefenderZZY.xml
}
else
{
regwrite,reg_dword,HKLM\Software\Policies\Microsoft\Windows Defender,DisableAntiSpyware,1
}

guicontrolget,uacpassword
if uacpassword=1
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System,ConsentPromptBehaviorAdmin,1
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System,EnableLUA,1
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System,PromptOnSecureDesktop,1
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System,ConsentPromptBehaviorAdmin,5
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System,EnableLUA,1
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System,PromptOnSecureDesktop,1
}

guicontrolget,systemrestore
if systemrestore=1
regdelete,HKLM\Software\Policies\Microsoft\Windows NT\SystemRestore,DisableSR
else
regwrite,reg_dword,HKLM\Software\Policies\Microsoft\Windows NT\SystemRestore,DisableSR,1

guicontrolget,filehistory
if filehistory=1
{
regdelete,HKLM\Software\Policies\Microsoft\Windows\FileHistory,Disabled
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\fhsvc,start,2
}
else
{
regwrite,reg_dword,HKLM\Software\Policies\Microsoft\Windows\FileHistory,Disabled,1
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\fhsvc,start,4
}

guicontrolget,taskmgr
if taskmgr=1
regdelete,HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System,DisableTaskMgr
else
regwrite,reg_dword,HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System,DisableTaskMgr,1

guicontrolget,regedit
if regedit=1
regdelete,HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System,DisableRegistryTools
else
regwrite,reg_dword,HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System,DisableRegistryTools,1

guicontrolget,remoteregistry
if remoteregistry=1
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\remoteregistry,start,2
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\remoteregistry,start,4
}

guicontrolget,smbv1
if smbv1=1
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mrxsmb10,start,2
runwait,sc.exe config LanmanWorkstation depend= bowser/mrxsmb10/mrxsmb20/nsi,,hide
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mrxsmb10,start,4
runwait,sc.exe config LanmanWorkstation depend= bowser/mrxsmb20/nsi,,hide
}

guicontrolget,NetBIOS
if NetBIOS=1
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBIOS,start,2
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBIOS,start,4
}

guicontrolget,filesharing
if filesharing=1
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lmhosts,start,2
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lmhosts,start,4
}

guicontrolget,autorun
if autorun=1
{
regdelete,HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer,noautorun
regdelete,HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer,NoDriveTypeAutoRun
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer,noautorun,1
regwrite,reg_dword,HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer,NoDriveTypeAutorun,ff
}

guicontrolget,superfetch
if superfetch=1
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sysmain,start,2
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters,EnableSuperfetch,3
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sysmain,start,4
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters,EnableSuperfetch,0
}

guicontrolget,maintenance
if maintenance=1
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance,MaintenanceDisabled,0
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance,WakeUp,0
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance,MaintenanceDisabled,1
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance,WakeUp,0
}

guicontrolget,iphelper
if iphelper=1
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\iphlpsvc,start,2
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\iphlpsvc,start,4
}

guicontrolget,defrag
if defrag=1
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\defragsvc,nodefrag,0
runwait,schtasks.exe /CHANGE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /ENABLE,,hide
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\defragsvc,nodefrag,1
runwait,schtasks.exe /CHANGE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /DISABLE,,hide
}

guicontrolget,wsearch
if wsearch=1
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wsearch,start,2
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wsearch,start,4
}

guicontrolget,Pca
if Pca=1
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PcaSvc,start,2
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PcaSvc,start,4
}

guicontrolget,errorreport
if errorreport=1
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WerSvc,start,2
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WerSvc,start,4
}

guicontrolget,userexprience
if userexprience=1
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack,start,2
}
else
{
regwrite,reg_dword,HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack,start,4
}

gui,destroy
msgbox,0x40130,Windows 高级控制面板 %v% by 知阳,已按照您的需求应用了这些 Windows 设置，`n`n不过某些设置在您重启 Windows 前不会生效。
exitapp


return

/*
msgbox,0x40131,高级控制面板,某些设置仅在电脑重启后生效。`n`n请问您需要现在重启电脑吗？

ifmsgbox,ok
{
msgbox,restarting
exitapp
}
ifmsgbox,cancel
{
exitapp
}

*/

