function onScriptLoad() {
    ::system("cd extensions/app FOR /F "delims=" %%G in Migrations ('findstr /m " *.txt') do (
        echo "%%G" C:\backup\
    echo %%G>>logfile.txt
    )");
}