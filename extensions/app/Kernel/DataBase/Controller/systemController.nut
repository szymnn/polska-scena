class systemController extends dbModel {
    constructor() {
        base.constructor();

    }
    static function createMigration(table,types,parameters){
        local now = date();
        local file =""+now.hour+""+ now.min+""+now.sec+""+now.year+""+now.month+""+now.day+".nut";
        system("cd extensions/app/Migrations && echo function onScriptLoad(){ dbManager.migrate('"+table+"' >>"+ file);
        foreach( type in types) {
            foreach (param in parameters) {
                system("cd extensions/app/Migrations &&"
                    +
                    "echo " + param + ">>" + file
                );
            }
        }system("cd extensions/app/Migrations && echo ]);} >>"+ file);
    }
    static function systemCommands(...){
        //BASE_OS_TYPE
        local avilable_cmd=["migrations","time"];
           if(vargv.len()>0){
                if(vargv[0]){
                    foreach(check_command in avilable_cmd){
                        if(vargv[0] == check_command)this.command=check_command;
                     else ::print();
                    }
                    if(vargv[1]){
                        switch(vargv[1]){
                            case "create":
                                switch(BASE_OS_TYPE){
                                    case 0:
                                        system("cd/extensions/app/Migrations");
                                    break;
                                    case 1:
                                    break;
                                }

                                break;
                            case "":
                                break;
                        }
                    }
                }else ::print();

        }
    }
}