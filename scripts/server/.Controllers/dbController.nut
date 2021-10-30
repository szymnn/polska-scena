class dbController extends dbModel{
    constructor(){
        base.constructor();
        this.columns = "";
    }
    static function migrate(tab = null, cols=[]) {
        foreach(a,column in cols){
            if(a+1==cols.len()) this.columns += column + "";
            else this.columns += column + ", ";
        }
        this.table = tab;
        return create();
    }
    static function rollback() {

    }
    static function drop() {

    }
    static function add() {

    }
    static function find(tab = null, cols=[]) {
        // foreach(a,column in cols){
        //     if(a+1==cols.len()) this.columns += column + "";
        //     else this.columns += column + ", ";
        // }
        // this.table = tab;
        // print(create());
    }
    static function findall(...) {

    }
}
dbManager = dbController();
