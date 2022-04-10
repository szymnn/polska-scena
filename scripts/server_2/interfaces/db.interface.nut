class dbInterface{
    type    = ::ReadIniString("configuration.ini","DATABASE","db_type");
    name    = null;
    user    = null;
    pass    = null;
    ip      = null;
    port    = null;
    connect = null;
    command = null;

    constructor(){

    }
    static function config();
    static function connect();
    static function query(q);


}