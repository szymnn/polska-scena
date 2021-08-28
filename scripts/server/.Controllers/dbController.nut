class dbController{
    static function  config() {
        local dataBase = dbModel();
        if(::ReadIniString("configuration.ini","DATABASE","db_type")){
            dataBase.type = ::ReadIniString("configuration.ini","DATABASE","db_type");
            if(::ReadIniString("configuration.ini","DATABASE","db_name")){
                if(dataBase.type == "sql") dataBase.name = ::ReadIniString("configuration.ini","DATABASE","db_name");
                else{
                    if(::ReadIniString("configuration.ini","DATABASE","db_user") && ::ReadIniString("configuration.ini","DATABASE","db_pass") && ::ReadIniString("configuration.ini","DATABASE","db_ip") ){
                        dataBase.name = ::ReadIniString("configuration.ini","DATABASE","db_name");
                        dataBase.ip   = ::ReadIniString("configuration.ini","DATABASE","db_ip");
                        dataBase.user = ::ReadIniString("configuration.ini","DATABASE","db_user");
                        dataBase.pass = ::ReadIniString("configuration.ini","DATABASE","db_pass");
                        
                    }else print("\n\n\n\n\n\n\n\n<----SYTNAX----> WRONG CONFIGURATION VALUES... [db_type], [db_name], [db_ip], [db_user], [db_pass]\n\n");
                }
                return dataBase;
            }else print("\n\n\n\n\n\n\n\n<----SYTNAX----> WRONG CONFIGURATION VALUES... [db_type], [db_name]\n\n");
        }else print("\n\n\n\n\n\n\n\n<----SYTNAX----> WRONG CONFIGURATION VALUES... SELECT YOUR [db_type]\n\n");
    }
    static function connect() {
        switch (db.type){
            case "sql":
                try{
                    db.connect = ::ConnectSQL(db.name);
                    print("DATA BASE ["+db.name+"] CONNECTED SUCCESFUL");
                    return  db.connect;
                }catch (e) error( "\n\n\n\n\n\n\n\n<----[ERROR]---->SQL CONNECT: " + e + "\n\n");
            break;
            case "mysql":
                try{
                    db.connect = ::mysql_connect( db.ip, db.user, db.pass, db.name);
                    print("DATA BASE ["+db.name+"] CONNECTED SUCCESFUL");
                    return db.connect;
                }catch (e) error( "\n\n\n\n\n\n\n\n<----[ERROR]---->MySQL CONNECT: " + e + "\n\n" );
            break;
        }
    }
    static function create(table=null,columns=[],values=[], atributes=[]) {
        local polecenie = "";
        foreach(a,column in columns){
               foreach(b,value in values){
                    if(a+1<columns.len()){
                       if(a==b)polecenie+= column + " " +value + ", ";
                    }if(a+1==columns.len()){
                       if(a==b)polecenie+= column + " " +value + "";
                    }
               }
           }
        if(atributes.len()>=0){
            foreach (atribute in atributes){
                polecenie += atribute;
            }
        }
        print(polecenie);
        switch(db.type){
            case "sql":
                ::QuerySQL(db.connect,"CREATE TABLE IF NOT EXISTS " + table + "("+polecenie+")");
            break;
            case "mysql":
                ::mysql_query(db.connect,"CREATE TABLE IF NOT EXISTS " + table + "("+polecenie+")");
            break;
        }
         
    }
    static function insert(table=null,columns=[],values=[]) {
        local polecenie = "";
        local wartosci  = "";
        foreach(a,column in columns){
               foreach(b,value in values){
                    if(a+1<columns.len()){
                       if(a==b){
                           polecenie+= column + ", ";
                           wartosci+= "'" +value + "', ";
                       }
                    }if(b+1==columns.len()){
                       if(a==b)wartosci+= "'" +value + "'";
                    }
                    if(a+1==columns.len()){
                        if(a==b)polecenie+= "'"+column + "'";
                     }
               }
           }
        print(polecenie + " " + wartosci);
        switch(db.type){
            case "sql":
                ::QuerySQL(db.connect,"INSERT OR REPLACE INTO " + table + "("+polecenie+") values("+wartosci+")");
            break;
            case "mysql":
                ::mysql_query(db.connect,"INSERT OR REPLACE INTO " + table + "("+polecenie+") values("+wartosci+")");
            break;
        }
         
    }
    
}










db <- dbController.config();
dbController.connect();
