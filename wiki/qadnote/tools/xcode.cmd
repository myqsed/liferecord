rem @echo off
set xrc=c:\qadguicli
set xcode=C:\qadguicli\proedit
set src=C:\qadguicli\garbage\src
set cim=C:\qadguicli\garbage\cim
del %src%\*.* /s/q/f/a
del %xrc%\xrc\*.* /s/q/f/a
rem rd %xrc%\xrc
mkdir %xrc%\garbage\src
mkdir /d %xrc%\xrc

rem copy src to srcdir
mkdir %src%
copy /y D:\ss2k10\trunk\common\xxlbliq\*.p %src%\
rem copy /y D:\ss2k10\trunk\showa\xxpk\xxlnwkmt\*.i %src%\  
rem Xcode.
cd /d %src%
%xcode%\xcode -d %xrc%\xrc xx*.p
%xcode%\xcode -d %xrc%\xrc xx*.i

copy %cim%\*.cim %xrc%\xrc\c.cim

rem convert.
mkdir %xrc%\gui
if %1=="A" goto exitme
echo srcSearchPath=%src%> %xrc%\convert.tmp
echo targetDir=%xrc%\gui>> %xrc%\convert.tmp
echo workDir=%xrc%>> %xrc%\convert.tmp
%xcode%\convert.exe -r -ini=%xrc%\convert.tmp %src%\xx*.p>%xrc%\convert.log
%xcode%\convert.exe -r -ini=%xrc%\convert.tmp %src%\xx*.i>>%xrc%\convert.log
rem del %xrc%\convert.tmp /s/q/f/a

:exitme
