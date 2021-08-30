class dbController extends dbModel{
    constructor(){
        base.constructor();
        this.columns = "";
    }
    static function migrate(tab = null, columns=[]) {
        foreach(a,column in columns){
            if(a+1==columns.len()) this.columns += column + "";
            else this.columns += column + ", ";
        }
        this.table = tab;
        create();
    }
    static function rollback() {
        
    }
    static function drop() {
        
    }
    static function add() {
        
    }
}
dbManager = dbController();
