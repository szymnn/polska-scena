class mysqlDriver extends dbDriver{
    constructor(){
        this.type    = "mysql";
        this.name    = ::ReadIniString("configuration.ini","DATABASE","db_name");
        this.ip      = ::ReadIniString("configuration.ini","DATABASE","db_ip");
        this.user    = ::ReadIniString("configuration.ini","DATABASE","db_user");
        this.pass    = ::ReadIniString("configuration.ini","DATABASE","db_pass");
        this.connect = ::mysql_connect(this.ip, this.user, this.pass, this.connect);
    }
    static function query() {
        return ::mysql_query(this.connect,this.command);
    }
}