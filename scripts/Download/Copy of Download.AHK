; AutoHotkey Version: 1.x
; Language:       English
; Platform:       WinXP.SP2
; Author:         FreemanZY
;
; Script Function:
; Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#NoTrayIcon
============================================================
Gui, Add, Button, x30 y10 w190 h30 , ����
Gui, Add, Button, x30 y50 w190 h30 , ����
; Generated using SmartGUI Creator 4.0
Gui, Show, x131 y91 h100 w250, Avira Offline Update
Return

GuiClose:
ExitApp


Button����:
WinMinimize, Avira Offline Update
Loop
{
	Run, wget -t 0 -w 31 -c http://www.srware.net/downloads/IronPortable.zip,, Min ,NewPID
	Loop
	{
		Process, exist, %NewPID%  ; �жϳ����Ƿ��������
		if ErrorLevel = 0
			Break  ; ������ϣ������ж�ѭ��������ִ��
	}
	IfExist, ivdf_fusebundle_nt_en.zip  ; �ж��Ƿ����ص��ļ�
		{
			Run, %comspec% /c 7za t ivdf_fusebundle_nt_en.zip >>Test.txt  ; У��ѹ����
			Sleep, 2000
			FileRead, Result, Test.txt  ; ��ȡУ����
			if not ErrorLevel  ; ����ɹ�����
				{
					IfInString, Result, Everything is Ok
						{
							MsgBox, good
							FileDelete, Test.txt
							Result =  ; �ͷż���洢
							Break
						}
				}
		}
}
Return

Button����:
IfExist, ivdf_fusebundle_nt_en.zip
{
	WinMinimize, Avira Offline Update
	Run, d:\Program Files\Avira\AntiVir PersonalEdition Classic\avcenter.exe
	;Run, %ProgramFiles%\Avira\AntiVir PersonalEdition Classic\avcenter.exe
	WinWaitActive, Avira AntiVir Personal - Free Antivirus
	Send, !{u}{m}
	WinWaitActive, Open
	ControlSetText, Edit1, %A_ScriptDir%\ivdf_fusebundle_nt_en.zip, Open
	ControlClick,Button2, Open,
	Send, {Enter}
	WinWaitActive, ,The VDF update kit has been successfully updated.,
	Send, {Space}
	WinWaitActive, Avira AntiVir Personal - Free Antivirus
	Send, !{F4}
	FileDelete, ivdf_fusebundle_nt_en.zip
}
Else
{
	MsgBox, 16, ����ʧ��, δ���ָ��°������������أ�
}
Return