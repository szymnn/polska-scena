class sqlDriver extends dbDriver{
    constructor(){
        this.type    = "sql";
        this.name    = ::ReadIniString("configuration.ini","DATABASE","db_name");
        this.connect = ::ConnectSQL(this.name);
    }
    static function query(q) {
        return ::QuerySQL(this.connect,q);
    }  
}
