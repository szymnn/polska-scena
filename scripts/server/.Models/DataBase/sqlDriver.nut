class sqlDriver extends dbDriver{
    constructor(){
        this.type    = "sql";
        this.name    = ::ReadIniString("configuration.ini","DATABASE","db_name");
        this.connect = ::ConnectSQL(this.name);
    }
    static function query(q) {
        try{
            debug("db",q);
            return ::QuerySQL(this.connect,q);
        } catch(e) print( "***~~SQL QUERY ERROR~~***: " + e );

    }
}
