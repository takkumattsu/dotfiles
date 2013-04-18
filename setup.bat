@echo OFF

set VIM_RUNTIME_DIR=%USERPROFILE%\vimfiles
set BUNDLE_DIR=%VIM_RUNTIME_DIR%\bundle
set VIMRC=%USERPROFILE%\_vimrc
set VIM_DIR=%USERPROFILE%\_vim

for /f "tokens=*" %%i in ('cd') do set CWD=%%i


::=====================================
:: main

:: set backup list 
set  CHECK_TARGET=%VIMRC% %VIM_DIR% %VIM_RUNTIME_DIR%
for %%i in (%CHECK_TARGET%) do (
 echo %%i
 call :backup %%i
)

:: create symbolic link
:: mklink is support after VISTA.

:: create directory
mkdir %BUNDLE_DIR%

:: Install neobundle
:: Please set git path
:: e.g)
:: set GIT="C:\Program Files (x86)\Git\cmd\git.exe"
::
:: Windows Git client
:: "Git for Windows"
:: <https://code.google.com/p/msysgit/downloads/list?q=full+installer+official+git>
::
:: "msysGit"
:: <https://code.google.com/p/msysgit/downloads/list?q=net+installer>
set GIT="YOUR GIT PATH"
set GIT="C:\Program Files (x86)\Git\cmd\git.exe"
%GIT% clone git://github.com/Shougo/neobundle.vim.git %BUNDLE_DIR%\neobundle.vim

:: cretae symbolic link
mklink %VIMRC% %CWD%\.vimrc

exit 0

::=====================================
:: backup function
:backup
setlocal
 :: YYYYMMDD
 set date=%DATE:/=%
 :: HHMMSS
 set tm=%time:~0,8%
 set tm=%tm::=%
 set tm=%tm: =0%
 :: YYYYYMMDDHHMMSS
 set BACKUP=%date%%tm%

 :: backup
 if exist "%1" (
  xcopy /i /e %1 %1.%BACKUP%.bk
 )

 :: remove (first)
 if exist "%1" (
  del /q %1
 )

 :: del command can not delete the directory.
 if exist "%1" ( 
  rmdir /s /q "%1"
 )
 
endlocal
exit /b 0
::backup end

