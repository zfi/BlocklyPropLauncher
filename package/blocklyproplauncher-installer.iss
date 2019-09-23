; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "BlocklyProp Launcher"
#define MyAppStartMenuName "BlocklyProp"
#define MyAppVersion "0.9.9"
#define MyAppPublisher "Parallax Inc."
#define MyAppStartMenu "Parallax Inc"
#define MyAppURL "http://blockly.parallax.com/"
#define MyAppExeName "BPLauncher.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{9E8A89EC-31E4-4DF8-8359-A7DBD0D057D4}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppStartMenu}\{#MyAppStartMenuName}
DisableProgramGroupPage=yes
OutputDir=..\release_exe
OutputBaseFilename=Setup-BPLauncher
SetupIconFile=win-resources\blocklyprop.ico
Compression=lzma
SolidCompression=yes
DisableWelcomePage=no
WizardImageFile=win-resources\BlocklyPropLauncher-windows-installer-background.bmp
PrivilegesRequired=admin

[Messages]
BeveledLabel={#MyAppName} Setup

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Components]
Name: "program"; Description: "Program Files"; Types: full compact custom; Flags: fixed
Name: "driver"; Description: "FTDI driver"; Types: full

[Files]
Source: "win-resources\nwjs\dependencies\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: program
Source: "win-resources\readme.txt"; DestDir: "{app}"; Flags: isreadme; Components: program
Source: "drivers\Install-Parallax-USB-Drivers-v2.12.16.exe"; DestDir: "{app}\drivers"; AfterInstall: RunDriverInstaller; Flags: ignoreversion; Components: driver
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{commonprograms}\{#MyAppStartMenu}\{#MyAppStartMenuName}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
procedure RunDriverInstaller;
var
  ResultCode: Integer;
begin
  if not WizardSilent then
    begin
    if not Exec(ExpandConstant('{app}\drivers\Install-Parallax-USB-Drivers-v2.12.16.exe'), '/UpperLeft /Immediate', '', SW_SHOWNORMAL,
      ewWaitUntilTerminated, ResultCode)
    then
      MsgBox('USB Driver Installer failed to run!' + #13#10 +
        SysErrorMessage(ResultCode), mbError, MB_OK)
    end
  else
    Exec(ExpandConstant('{app}\drivers\Install-Parallax-USB-Drivers-v2.12.16.exe'), '/Quiet', '', SW_SHOWNORMAL,
      ewWaitUntilTerminated, ResultCode);
end;

