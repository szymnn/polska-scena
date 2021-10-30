class dbDriver extends dbConfig{
    type    = ::ReadIniString("configuration.ini","DATABASE","db_type");
    name    = null;
    user    = null;
    pass    = null;
    ip      = null;
    connect = null;
    command = null;
    //default_user_name	= this.default_user_name;
    //default_user_row	= this.default_user_row;
    //default_user_table	= this.default_user_table;
    constructor(){

    }
    static function connect() {
        if(this.type=="sql")return sqlDriver();
        else if(this.type=="mysql")return mysqlDriver();
        else return var.err;
    }
    static function query(q) {
        this.command = q;
    }

}