class mysqlDriver extends Database{
    constructor(){
        this.type    = "mysql";
        this.name    = ::ReadIniString("configuration.ini","DATABASE","db_name");
        this.ip      = ::ReadIniString("configuration.ini","DATABASE","db_ip");
        this.port    = ::ReadIniInteger("configuration.ini","DATABASE","db_port");
        this.user    = ::ReadIniString("configuration.ini","DATABASE","db_user");
        this.pass    = ::ReadIniString("configuration.ini","DATABASE","db_pass");
        this.connect = ::mysql_connect(this.ip, this.user, this.pass, this.name, this.port);
    }
    static function query(q) {
        try{
            debug("db",q);
            return ::mysql_query(this.connect,q);
        } catch(e) print( "***~~MySQL QUERY ERROR~~***: " + e );
    }
}