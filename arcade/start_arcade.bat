@Echo OFF
SETLOCAL
:: 64-bit version of matlab 2014a
rem SET PATH="C:\Program Files\MATLAB\R2014a\bin\";"C:\Program Files\MATLAB\R2014a\bin\win64";C:\Windows\system32;C:\Windows;%~dp0StimServer\;%~dp0External\EyelinkToolbox;%~dp0DaqServer\;"
SET ARCADEDIR="%~dp0"\Core\


IF "%~1"=="/DEBUG" (
	SET RUNCMD=matlab -r "dbstop if error; runCore";
) ELSE (
	SET RUNCMD=matlab -nodesktop -r "runCore('%~1')"
)

%RUNCMD%
