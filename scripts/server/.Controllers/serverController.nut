var         <-null;
DEBUG       <-false;
debug       <-null;
::dofile( "scripts/server/.Models/Server/serverModel.nut" );
class serverController{
    config = serverModel();
    static function setServerModel() {
        config.SetDeathmatchScoreboard         = ::GetDeathmatchScoreboard();
        config.SetDeathMessages                = ::GetDeathMessages();
        config.SetDrivebyEnabled               = ::GetDrivebyEnabled();
        config.SetDriveOnWater                 = ::GetDriveOnWater();
        config.SetFallEnabled                  = ::GetFallEnabled();
        config.SetFastSwitch                   = ::GetFastSwitch();
        config.SetFlyingCars                   = ::GetFlyingCars();
        config.SetFrameLimiter                 = ::GetFrameLimiter();
        config.SetFriendlyFire                 = ::GetFriendlyFire();
        config.SetGameModeName                 = ::GetGameModeName();
        config.SetGamespeed                    = ::GetGamespeed();
        config.SetGravity                      = ::GetGravity();
        config.SetHour                         = ::GetHour();
        config.SetJoinMessages                 = ::GetJoinMessages();
        config.SetJumpSwitch                   = ::GetJumpSwitch();
        config.SetKillDelay                    = ::GetKillDelay();
        config.SetMaxHeight                    = ::GetMaxHeight();
        config.SetMaxPlayers                   = ::GetMaxPlayers();
        config.SetMinute                       = ::GetMinute();
        config.SetPerfectHandling              = ::GetPerfectHandling();
        config.SetServerName                   = ::GetServerName();
        config.SetPassword                     = ::GetPassword();
        config.SetShootInAir                   = ::GetShootInAir();
        config.SetShowNametags                 = ::GetShowNametags();
        config.SetShowOnRadar                  = ::GetShowOnRadar();
        config.SetStuntBike                    = ::GetStuntBike();
        config.SetSyncFrameLimiter             = ::GetSyncFrameLimiter();
        config.SetTaxiBoostJump                = ::GetTaxiBoostJump();
        config.SetTimeRate                     = ::GetTimeRate();
        config.SetVehiclesForcedRespawnHeight  = ::GetVehiclesForcedRespawnHeight();
        config.SetWallglitch                   = ::GetWallglitch();
        config.SetWaterLevel                   = ::GetWaterLevel().tofloat();            
        
    }
    static function saveConfig() {
        /*****************************STRINGS***********************************************/
        ::WriteIniString(           "configuration.ini", "SERVER", "SetServerName",config.SetServerName);
        ::WriteIniString(             "configuration.ini", "SERVER", "SetPassword",config.SetPassword);
        ::WriteIniString(         "configuration.ini", "SERVER", "SetGameModeName",config.SetGameModeName);
        /******************************BOOLEANS********************************************/
        ::WriteIniBool(   "configuration.ini", "SERVER", "SetDeathmatchScoreboard",config.SetDeathmatchScoreboard);
        ::WriteIniBool(          "configuration.ini", "SERVER", "SetDeathMessages",config.SetDeathMessages);
        ::WriteIniBool(         "configuration.ini", "SERVER", "SetDrivebyEnabled",config.SetDrivebyEnabled);
        ::WriteIniBool(           "configuration.ini", "SERVER", "SetDriveOnWater",config.SetDriveOnWater);
        ::WriteIniBool(            "configuration.ini", "SERVER", "SetFallEnabled",config.SetFallEnabled);
        ::WriteIniBool(             "configuration.ini", "SERVER", "SetFastSwitch",config.SetFastSwitch);
        ::WriteIniBool(             "configuration.ini", "SERVER", "SetFlyingCars",config.SetFlyingCars);
        ::WriteIniBool(           "configuration.ini", "SERVER", "SetFrameLimiter",config.SetFrameLimiter);
        ::WriteIniBool(           "configuration.ini", "SERVER", "SetFriendlyFire",config.SetFriendlyFire);
        ::WriteIniBool(           "configuration.ini", "SERVER", "SetJoinMessages",config.SetJoinMessages);
        ::WriteIniBool(             "configuration.ini", "SERVER", "SetJumpSwitch",config.SetJumpSwitch);
        ::WriteIniBool(        "configuration.ini", "SERVER", "SetPerfectHandling",config.SetPerfectHandling);
        ::WriteIniBool(             "configuration.ini", "SERVER", "SetShootInAir",config.SetShootInAir);
        ::WriteIniBool(           "configuration.ini", "SERVER", "SetShowNametags",config.SetShowNametags);
        ::WriteIniBool(            "configuration.ini", "SERVER", "SetShowOnRadar",config.SetShowOnRadar);
        ::WriteIniBool(              "configuration.ini", "SERVER", "SetStuntBike",config.SetStuntBike);
        ::WriteIniBool(       "configuration.ini", "SERVER", "SetSyncFrameLimiter",config.SetSyncFrameLimiter);
        ::WriteIniBool(          "configuration.ini", "SERVER", "SetTaxiBoostJump",config.SetTaxiBoostJump);
        ::WriteIniBool(             "configuration.ini", "SERVER", "SetWallglitch",config.SetWallglitch);
        ::WriteIniBool(             "configuration.ini", "SERVER", "SetWeaponSync",config.SetWeaponSync);               
        /***************************** NUMBERS **************************************/
        ::WriteIniNumber(                 "configuration.ini", "SERVER", "SetWaterLevel",config.SetWaterLevel);
        ::WriteIniNumber(                    "configuration.ini", "SERVER", "SetGravity",config.SetGravity);
        ::WriteIniNumber("configuration.ini", "SERVER", "SetVehiclesForcedRespawnHeight",config.SetVehiclesForcedRespawnHeight);
        ::WriteIniNumber(                  "configuration.ini", "SERVER", "SetGamespeed",config.SetGamespeed);
        ::WriteIniNumber(                  "configuration.ini", "SERVER", "SetMaxHeight",config.SetMaxHeight);
        /******************************INTEGERS********************************/
        ::WriteIniInteger(                       "configuration.ini", "SERVER", "SetHour",config.SetHour);
        ::WriteIniInteger(                   "configuration.ini", "SERVER", "SetTimeRate",config.SetTimeRate);
        ::WriteIniInteger(                 "configuration.ini", "SERVER", "SetMaxPlayers",config.SetMaxPlayers);
        ::WriteIniInteger(                     "configuration.ini", "SERVER", "SetMinute",config.SetMinute);
    }
    static function StartServer() {
        //if(!file("configuration.ini","wb+")) print("dupa");
        if(!::ReadIniString( "configuration.ini", "DATABASE", "db_type"))
        {
            local file = file("configuration.ini","wb+");
            ::WriteIniString( "configuration.ini", "DATABASE", "db_type", "" );
            ::WriteIniString( "configuration.ini", "DATABASE", "db_name", "" );
            ::WriteIniString( "configuration.ini", "DATABASE", "db_user", "" );
            ::WriteIniString( "configuration.ini", "DATABASE", "db_pass", "" );
            ::WriteIniString( "configuration.ini", "DATABASE", "db_ip", "" );
            /*****************************STRINGS***********************************************/
            ::WriteIniString(           "configuration.ini", "SERVER", "SetServerName","");
            ::WriteIniString(             "configuration.ini", "SERVER", "SetPassword","");
            ::WriteIniString(         "configuration.ini", "SERVER", "SetGameModeName","");
            /******************************BOOLEANS********************************************/
            ::WriteIniBool(   "configuration.ini", "SERVER", "SetDeathmatchScoreboard",false);
            ::WriteIniBool(          "configuration.ini", "SERVER", "SetDeathMessages",false);
            ::WriteIniBool(         "configuration.ini", "SERVER", "SetDrivebyEnabled",false);
            ::WriteIniBool(           "configuration.ini", "SERVER", "SetDriveOnWater",false);
            ::WriteIniBool(            "configuration.ini", "SERVER", "SetFallEnabled",false);
            ::WriteIniBool(             "configuration.ini", "SERVER", "SetFastSwitch",false);
            ::WriteIniBool(             "configuration.ini", "SERVER", "SetFlyingCars",false);
            ::WriteIniBool(           "configuration.ini", "SERVER", "SetFrameLimiter",false);
            ::WriteIniBool(           "configuration.ini", "SERVER", "SetFriendlyFire",false);
            ::WriteIniBool(           "configuration.ini", "SERVER", "SetJoinMessages",false);
            ::WriteIniBool(             "configuration.ini", "SERVER", "SetJumpSwitch",false);
            ::WriteIniBool(        "configuration.ini", "SERVER", "SetPerfectHandling",false);
            ::WriteIniBool(             "configuration.ini", "SERVER", "SetShootInAir",false);
            ::WriteIniBool(           "configuration.ini", "SERVER", "SetShowNametags",false);
            ::WriteIniBool(            "configuration.ini", "SERVER", "SetShowOnRadar",false);
            ::WriteIniBool(              "configuration.ini", "SERVER", "SetStuntBike",false);
            ::WriteIniBool(       "configuration.ini", "SERVER", "SetSyncFrameLimiter",false);
            ::WriteIniBool(          "configuration.ini", "SERVER", "SetTaxiBoostJump",false);
            ::WriteIniBool(             "configuration.ini", "SERVER", "SetWallglitch",false);
            /***************************** NUMBERS **************************************/
            ::WriteIniNumber(                 "configuration.ini", "SERVER", "SetWaterLevel",0);
            ::WriteIniNumber(                    "configuration.ini", "SERVER", "SetGravity",0);
            ::WriteIniNumber("configuration.ini", "SERVER", "SetVehiclesForcedRespawnHeight",0);
            ::WriteIniNumber(                  "configuration.ini", "SERVER", "SetGamespeed",0);
            ::WriteIniNumber(                  "configuration.ini", "SERVER", "SetMaxHeight",0);
            /******************************INTEGERS********************************/
            ::WriteIniInteger(                       "configuration.ini", "SERVER", "SetHour",0);
            ::WriteIniInteger(                 "configuration.ini", "SERVER", "SetMaxPlayers",0);
            ::WriteIniInteger(                   "configuration.ini", "SERVER", "SetTimeRate",0);
            ::WriteIniInteger(                     "configuration.ini", "SERVER", "SetMinute",0);
            ::WriteIniBool(                     "configuration.ini", "SERVER", "DEBUG",false);
            file.close();
            print("***SERVER HAS CREATED CONFIGURATION FILE***");
            print("**CONFIGURE YOUR configuration.ini FILE IN THE ROOT DIRECTORY");
            print("**THE SERVER WILL BE SHUT DOWN");
            NewTimer("print", 1000, 1, "*****THE SERVER WILL BE SHUT DOWN IN 5 SECOND");
            NewTimer("print", 1000, 1, "*****CONFIGURE YOUR configuration.ini FILE IN THE ROOT DIRECTORY");
            NewTimer("print", 3000, 1, "*****THE SERVER WILL BE SHUT DOWN IN 4 SECOND");
            NewTimer("print", 3000, 1, "*****CONFIGURE YOUR configuration.ini FILE IN THE ROOT DIRECTORY");
            NewTimer("print", 5000, 1, "*****THE SERVER WILL BE SHUT DOWN IN 3 SECOND");
            NewTimer("print", 5000, 1, "*****CONFIGURE YOUR configuration.ini FILE IN THE ROOT DIRECTORY");
            NewTimer("print", 7000, 1, "*****THE SERVER WILL BE SHUT DOWN IN 2 SECOND");
            NewTimer("print", 7000, 1, "*****CONFIGURE YOUR configuration.ini FILE IN THE ROOT DIRECTORY");
            NewTimer("print", 9000, 1, "*****THE SERVER WILL BE SHUT DOWN IN 1 SECOND");
            NewTimer("print", 9000, 1, "*****CONFIGURE YOUR configuration.ini FILE IN THE ROOT DIRECTORY");
            NewTimer("print", 10000, 1, ".................................");
            NewTimer("ShutdownServer", 12500, 1);
        }else{
            /*****************************STRINGS***********************************************/
            ::SetServerName(::ReadIniString(           "configuration.ini", "SERVER", "SetServerName"));
            ::SetPassword(::ReadIniString(             "configuration.ini", "SERVER", "SetPassword"));
            ::SetGameModeName(::ReadIniString(         "configuration.ini", "SERVER", "SetGameModeName"));
            /******************************BOOLEANS********************************************/
            ::SetDeathmatchScoreboard(::ReadIniBool(        "configuration.ini", "SERVER", "SetDeathmatchScoreboard"));
            ::SetDeathMessages(::ReadIniBool(               "configuration.ini", "SERVER", "SetDeathMessages"));
            ::SetDrivebyEnabled(::ReadIniBool(              "configuration.ini", "SERVER", "SetDrivebyEnabled"));
            ::SetDriveOnWater(::ReadIniBool(                "configuration.ini", "SERVER", "SetDriveOnWater"));
            ::SetFallEnabled(::ReadIniBool(                 "configuration.ini", "SERVER", "SetFallEnabled"));
            ::SetFastSwitch(::ReadIniBool(                  "configuration.ini", "SERVER", "SetFastSwitch"));
            ::SetFlyingCars(::ReadIniBool(                  "configuration.ini", "SERVER", "SetFlyingCars"));
            ::SetFrameLimiter(::ReadIniBool(                "configuration.ini", "SERVER", "SetFrameLimiter"));
            ::SetFriendlyFire(::ReadIniBool(                "configuration.ini", "SERVER", "SetFriendlyFire"));
            ::SetJoinMessages(::ReadIniBool(                "configuration.ini", "SERVER", "SetJoinMessages"));
            ::SetJumpSwitch(::ReadIniBool(                  "configuration.ini", "SERVER", "SetJumpSwitch"));
            ::SetPerfectHandling(::ReadIniBool(             "configuration.ini", "SERVER", "SetPerfectHandling"));
            ::SetShootInAir(::ReadIniBool(                  "configuration.ini", "SERVER", "SetShootInAir"));
            ::SetShowNametags(::ReadIniBool(                "configuration.ini", "SERVER", "SetShowNametags"));
            ::SetShowOnRadar(::ReadIniBool(                 "configuration.ini", "SERVER", "SetShowOnRadar"));
            ::SetStuntBike(::ReadIniBool(                   "configuration.ini", "SERVER", "SetStuntBike"));
            ::SetSyncFrameLimiter(::ReadIniBool(            "configuration.ini", "SERVER", "SetSyncFrameLimiter"));
            ::SetTaxiBoostJump(::ReadIniBool(               "configuration.ini", "SERVER", "SetTaxiBoostJump"));
            ::SetWallglitch(::ReadIniBool(                  "configuration.ini", "SERVER", "SetWallglitch"));            
            /***************************** NUMBERS **************************************/
            ::SetWaterLevel(::ReadIniNumber(                 "configuration.ini", "SERVER", "SetWaterLevel"));
            ::SetGravity(::ReadIniNumber(                    "configuration.ini", "SERVER", "SetGravity"));
            ::SetVehiclesForcedRespawnHeight(::ReadIniNumber("configuration.ini", "SERVER", "SetVehiclesForcedRespawnHeight"));
            ::SetGamespeed(::ReadIniNumber(                  "configuration.ini", "SERVER", "SetGamespeed"));
            ::SetMaxHeight(::ReadIniNumber(                  "configuration.ini", "SERVER", "SetMaxHeight"));
            /*******************************INTEGERS*************************************/
            ::SetHour(::ReadIniInteger(                       "configuration.ini", "SERVER", "SetHour"));
            ::SetMinute(::ReadIniInteger(                     "configuration.ini", "SERVER", "SetMinute"));
            ::SetTimeRate(::ReadIniInteger(                   "configuration.ini", "SERVER", "SetTimeRate"));
            ::SetMaxPlayers(::ReadIniInteger(                 "configuration.ini", "SERVER", "SetMaxPlayers"));
            /*SET SERVER MODEL*/
            ::DEBUG = ::ReadIniBool(                          "configuration.ini", "SERVER", "DEBUG");
            setServerModel();
        }
    }

    static function dump(...) {
        local dump = "";
        foreach(a,values in vargv){
            dump += "" + values + " ";
        }
        print(dump);
    }
    err = function () {
        system("echo [91m[DATABASE ERROR][0m [97mWRONG DB_TYPE IN CONFIGURATION.INI[0m");
    }
}
var = serverController;
debug = function(typ,...) {
    if(DEBUG){
        local dump = "";
        foreach(a,values in vargv){
            dump += "" + values + " ";
        }
        switch(typ){
            case "db":
                system("echo [95m[DATABASE][0m [97m"+dump+"[0m");
                //system("echo:^<ESC^>[37m[35m "+"***~~DATABASE~~***[0m [37m "+dump+"[0m\n");
            break;
        }
            
    }
}
// print = function(...) {
//     if(vargv.len()>0){
//         local dump = "", var = "", var1 ="";
//         if(vargv[0]!=null){
//             var = vargv[0];
//             if(vargv[1])var1 = vargv[1];
//             foreach(a,values in vargv){
//                 if(var1){
//                     if(a>1)dump += values + " ";
//                 }else {
//                     if(a>0)dump += values + " ";
//                 }
//             }
//             if(var1){
//                 if(var.tointeger()==0 ||var.tointeger()==1 || var.tointeger()==2  || var.tointeger()==3 || var.tointeger()==4 || var.tointeger()==5 || var.tointeger()==6 || var.tointeger()==7)
//                 {
//                     switch(var){
//                         case 0:
//                             return system("echo [90m"+var1+" [90m"+dump+"[0m");
//                         break;
//                         case 1:
//                             return system("echo [91m"+var1+" [90m"+dump+"[0m");
//                         break;
//                         case 2:
//                             return system("echo [92m"+var1+" [90m"+dump+"[0m");
//                         break;
//                         case 3:
//                             return system("echo [93m"+var1+" [90m"+dump+"[0m");
//                         break;
//                         case 4:
//                             return system("echo [94m"+var1+" [90m"+dump+"[0m");
//                         break;
//                         case 5:
//                             return system("echo [95m"+var1+" [90m"+dump+"[0m");
//                         break;
//                         case 6:
//                             return system("echo [96m"+var1+" [90m"+dump+"[0m");
//                         break;
//                         case 7:
//                             return system("echo [97m"+var1+" [90m"+dump+"[0m");
//                         break;
//                     }
//                 }else system("echo [96m[SCRIPT][0m [90m"+dump+"[0m");  
//             }else system("echo [96m[SCRIPT][0m [90m"+var+"[0m");  
//         }else system("echo [91m[ERROR][0m [97mWRONG PRINT() SYTNAX[0m"); 
//     }else system("echo [91m[ERROR][0m [97mWRONG PRINT() SYTNAX[0m"); 
    
// }