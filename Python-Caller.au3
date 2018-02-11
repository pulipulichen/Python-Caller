#include <File.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#pragma compile(Icon, 'icon.ico')

$config_path = @ScriptDir & "\config.ini"
If FileExists(@ScriptDir & "\config-my.ini") Then
   $config_path = @ScriptDir & "\config-my.ini"
EndIf

$env_path = IniRead ( $config_path, "config", "path", "C:\Program Files\R\R-3.4.1\bin\x64\Rscript.exe" )

If Not(FileExists($env_path)) Then
   MsgBox($MB_SYSTEMMODAL, "Config Error", "python doesn't exists in path " & $env_path & @LF & "Please setup your config.ini")
   Exit (1)
EndIf

Local $CommandLine = $CmdLine

For $i = 1 To $CommandLine[0]
   Local $file = $CommandLine[$i]
   IF FileExists($file) = False Then
	  ContinueLoop
   EndIf

   Local $sDrive = "", $sDir = "", $sFileName = "", $sExtension = ""
   Local $aPathSplit = _PathSplit($file, $sDrive, $sDir, $sFileName, $sExtension)

   Local $tmp = _TempFile() & '.bat'

   If FileExists($tmp) Then
	  FileRecycle($tmp)
   EndIf

   Local $cmd = 'chdir /d "' & $sDrive & "\"  & $sDir & '"'
   $cmd = $cmd & ' & '
   $cmd = $cmd & '"'  & $env_path & '" "' & $file & '"'
   $cmd = $cmd & ' & '
   $cmd = $cmd & 'pause'
   ;MsgBox($MB_SYSTEMMODAL, "Config Error", $cmd)
   Run(@ComSpec & " /c " & $cmd)
Next