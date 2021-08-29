class dbController extends dbModel{
    constructor(){
        columns = "";
    }
    static function migrate(tab = null, columns=[]) {
        foreach(a,column in columns){
            if(a+1==columns.len()) this.columns += column + "";
            else this.columns += column + ", ";
        }
        this.table = tab;
        debug("db","MIGRATION RESULT:",this.table,this.columns);
        create(this.table,this.columns);
        
    }
    static function rollback() {
        
    }
    static function drop() {
        
    }
    static function add() {
        
    }
}
dbManager = dbController();
