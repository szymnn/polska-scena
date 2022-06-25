@echo off
cd extensions/app/Migrations 
SET a=%time:~0,2%%time:~3,2%%time:~6,2%%date:~-4%%date:~3,2%%date:~0,2%.nut
call echo %%%handle%%% 
echo %a%>>^%a^%