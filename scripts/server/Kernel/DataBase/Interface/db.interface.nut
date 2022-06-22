class dbInterface{
    default_user_table    = "users";
    default_user_row      = "nick";
    default_user_name     = "player";

    /**
    *@VEHICLE DEFAULTS
    */
    
    vehicle_table         = null;

    type    = null;
    name    = null;
    user    = null;
    pass    = null;
    ip      = null;
    port    = null;
    connect = null;
    command = null;
    table    = null;
    columns  = null;
    values   = null;
    where    = null;
    row      = null;
    from     = null;
    atribute = null;
    driver   = null;
    command  = null;
    
    constructor(){

    }
    static function findall();
    static function create();
    static function query(q);
    static function update();
    static function find(...);
}