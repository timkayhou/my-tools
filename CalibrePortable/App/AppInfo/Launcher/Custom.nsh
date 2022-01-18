${SegmentFile}

${SegmentPrePrimary}
	;Create environment var. for App\calibre or App\calibre64, and calibre custom env. var.
	${If} $Bits = 32
		System::Call 'Kernel32::SetEnvironmentVariable(t, t) i("PAL:CUSTOM_CALIBREAPPDIR", "$AppDirectory\calibre").r0'
		System::Call 'Kernel32::SetEnvironmentVariable(t, t) i("CALIBRE_PORTABLE_BUILD", "$AppDirectory\calibre\calibre.exe").r0'
		System::Call 'Kernel32::SetEnvironmentVariable(t, t) i("QT_PLUGIN_PATH", "$AppDirectory\calibre\qt_plugins").r0'
	${Else}
		System::Call 'Kernel32::SetEnvironmentVariable(t, t) i("PAL:CUSTOM_CALIBREAPPDIR", "$AppDirectory\calibre64").r0'
		System::Call 'Kernel32::SetEnvironmentVariable(t, t) i("CALIBRE_PORTABLE_BUILD", "$AppDirectory\calibre64\calibre.exe").r0'
		System::Call 'Kernel32::SetEnvironmentVariable(t, t) i("QT_PLUGIN_PATH", "$AppDirectory\calibre64\qt_plugins").r0'
	${EndIf}
!macroend

${SegmentPostPrimary}
	;remove cache whether local calibre present or not
	RMDir /r '$LOCALAPPDATA\calibre-cache'
!macroend
