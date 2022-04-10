class dbController extends dbModel{
    constructor(){
        base.constructor();

    }
    static function migrate(tab = null, cols=null) {
        foreach(a,column in cols){
            if(a+1==cols.len()) this.columns += column + "";
            else this.columns += column + ", ";
        }
        this.table = tab;
        create();
        this.columns = "";
        return true;
    }
    static function rollback() {

    }
    static function drop() {

    }
    static function add() {

    }
    static function findall() {
      this.command= "SELECT * FROM " + this.table;
      this.driver.query(this.command);
      return this.command;
    }
    static function find(...) {
      if(vargv.len()>0){
        if(vargv[0])this.name 			= vargv[0];
        else if(vargv[1])this.row 		= vargv[1];
        else if(vargv[2])this.table 	    = vargv[2];
      }
      this.command = "SELECT * FROM " + this.table + " WHERE "+ this.row +" = '"+ this.name+"'";
      debug("db",this.command);
      return base.query(this.command);
    }
    static function update(cols=null,vals=null){
      if(cols.len()>0 &&  vals.len()>0 ){
        local setUpdate="";
        local setInsertCols = "";
        local rows = find(this.name,this.row,this.row,this.table);
        if(rows && mysql_num_rows( rows )>0){
          for(local a = 0; a<cols.len(); a++){
            if (vals[a] == true || vals[a] == false){
              if(a+1==cols.len()) setUpdate += cols[a]+"= "+vals[a]+" ";
              else setUpdate += cols[a]+"= "+vals[a]+", ";
          }
          else{
            if(a+1==cols.len()) setUpdate += cols[a]+"= '"+vals[a]+"' ";
            else setUpdate += cols[a]+"= '"+vals[a]+"', ";
          }
          }
          this.command = "UPDATE `"+this.table+"` SET "+setUpdate+" WHERE "+this.row+" = '"+this.name+"'";
          print(this.command);
          return base.query(this.command);
        }else{
          foreach(a,col in cols){
            if(a+1==cols.len()) setInsertCols += "`"+col+"` ";
              else setInsertCols += "`"+col+"`, ";
          }
          foreach(a,val in vals ){
            if(a+1==vals.len()){
              if (val == true || val == false)
                setUpdate += ""+val+"";
              else setUpdate += "'"+val+"'";
            }
            else {
              if( val == true || val == false)
                setUpdate += ""+val+", ";
              else setUpdate += "'"+val+"', ";
            }
          }
          this.command = "INSERT INTO `"+this.table+"` ("+setInsertCols+") VALUES("+setUpdate+");";
          print(this.command);
          debug("db",this.command);
          return base.query(this.command);
        }
      }
    }
      
    // static function find(tab = null, cols=[]) {
    //     // foreach(a,column in cols){
    //     //     if(a+1==cols.len()) this.columns += column + "";
    //     //     else this.columns += column + ", ";
    //     // }
    //     // this.table = tab;
    //     // print(create());
    // }
    // static function findall(...) {

    // }


}
dbManager = dbController();
