web_addres<-"http://example_website.com/";
show <- {
    info    = "[#FFFFFF][INFO][#66CC00] "
    eror    = ["[#FF0000][ERROR][#FF7F50] ","[#FF0000][BLAD][#FF7F50] "]
    succes  = ["[#FFD700][SUCCES][#F0E68C] ","[#FFD700][SUKCES][#F0E68C] "]
    sytnax  = ["[#00FF00][SYTNAX][#98FB98] ","[#00FF00][SKLADNIA][#98FB98] "]
    admin   = "[#00FFFF][ADMIN][#00BFFF] "
    server  = "[#FF00FF][SERVER][#FF69B4] "
    /*| END DEFAULT SYTNAX |*/
   /*|| LOGIN-REGISTER MESSAGE's ||*/
    must_login       = ["You must logged in", "Musisz sie zalogowac"]
    must_register    = ["You must be registered", "Musisz sie zarejsetrowac"]
    has_login        = ["Has logged", "Zalogowal sie"]
    has_register     = ["Has registered", "Zarejestrowal sie"]
    auto_login       = ["You are has been automatically logged in", "Zostales zalogowany automatycznie"]
    _login           = ["You are has been logged in", "Zostales zalogowany "]
    _wrongPass       = ["This password is incorrect", "Podano bledne haslo"]
    _alreadyLogged   = ["You are already logged in", "Jesteś już zalogowany"]
    _pass_empty      = ["Password cannot be empty", "Wpisz hasło"]
    busy             = ["This nickname is already registered", "Wybrana nazwa użytkownika jest już zarejestrowana."]
    reg_succes       = ["Thanks for your register, now u can spawn player and have fun:) !", "Dziękujemy za rejestracje, od teraz możesz zrodzić gracza i się świetnie bawić :)"]
  /*|| JOIN MESSAGE's || */
    first_join       = [" [#66CC00]join the game for the first time", "[#66CC00]dolaczyl do gry poraz pierwszy"]
    has_join         = [" [#66CC00]join the game", " [#66CC00]dolaczyl do gry"]
  /*||LEFT MESSAGE's||*/
    has_left         = [" [#66CC00]has left game - reason: [#B0C4DE]", " opuścił grę - powód: [#B0C4DE]"]
  /*||STATS||*/
    update_stats     = ["Your stats have been updated ", "Twoje statystyki zostaly zaktualizowane"]
    update_all_stats = ["updated statistics for all players", "zaktualizowano statystyki wszystkich graczy"]
  /*ADMIN COMMAND*/
    
  /*||LOGS||*/
    save_to_log      = ["**SAVED IN LOG**", "**ZAPISANO W LOGU**"]
    register_in_log  = ["Your steps in game is registred in logs", "Twoje kroki w grze są rejestrowane w logach"]
    check_log        = ["If you want to check your logs, you need to have an account on the extensions website [#FFFFFF]"+web_addres+" [#66CC00]and pair it with the game.",
                       "Jeśli chcesz sprawdzić swoje logi, musisz mieć konto na stronie internetowej serwera [#FFFFFF]"+web_addres+" [#66CC00 i sparować je z grą."]
  /*GLOBAL*/
  unload_script      = ["The extensions will be restarted", "Serwer zostanie zrestartowany"]
  load_script        = ["The extensions has been successfully restarted", "Serwer został pomyślnie zresetowany"]
  cmd_exists         = ["This command not exists", "Podana komenda nie istnieje"]
  cmd_params         = ["You need to add more characters to use the command type/<command> <param>", "Aby uzyc komendy musisz wprowadzic parametr wpisz: /<nazwa komendy> <cokolwiek>"]
  cmd_low            = ["You don't have privileges to use this command", "Nie masz uprwanien do uzycia tej komendy"]
  cmd_secure         = ["This command is secure by password, type <cmd> <password> <type of cmd> <cmd sytnax> example: /set token moeney <player> <value>", 
                        "To polecenie jest chronione hasłem, wpisz <cmd> <haslo> <typ komendy> <skladnia komendy> np: /set haslo money <gracz> <wartosc>"]
/*SYTNAXES*/
  player_value      = ["<player> <value>", "<gracz> <wartosc>"]

}
