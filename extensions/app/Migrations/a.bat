@echo off
echo This is a test> test.txt
echo 123>> test.txt
echo 245.67>> test.txt

rem Or you can use variables:
set a=%RANDOM%
echo %a% > test.txt

SET a=%time:~0,2%%time:~3,2%%time:~6,2%%date:~-4%%date:~3,2%%date:~0,2%.nut
echo fd>>%a%