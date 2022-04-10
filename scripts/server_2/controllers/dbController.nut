class Database extends dbInterface{
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