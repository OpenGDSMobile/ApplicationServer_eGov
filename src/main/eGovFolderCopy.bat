@echo Off
setlocal

IF NOT EXIST .\webapp (
	echo Webapp Directory Not Exists!
	echo Please bower install [1. bower install / 2. bower-installer]
	GOTO:EOF
) ELSE (
	echo Directory Exists!
	robocopy /E .\public\bower_components\korGovMobileRuntime\css .\webapp\css
	robocopy /E .\public\bower_components\korGovMobileRuntime\js .\webapp\js
	robocopy /E .\public\bower_components\korGovMobileRuntime\images .\webapp\images
	RMDIR /S /Q public
	DEL glyphicons-halflings-regular.woff
)