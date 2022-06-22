class dbModel extends dbDriver{

  constructor(){
    this.driver = dbDriver().connect();
  }

  static function query(q){
    local  query = this.driver.query(q);
    return query;
  }

  // static function findall() {
  //   this.command= "SELECT * FROM " + this.table;
  //   this.driver.query(this.command);
  //   return this.command;
  // }

  static function create() {
    this.command = "CREATE TABLE IF NOT EXISTS "+this.table+"( "+this.columns+" )";
    //print(this.command);
    query(this.command);
    return this.command;
  }

  // static function update(cols=[],vals=[]){
  //   if(cols.len()>0){
  //     local setUpdate="";
  //     foreach(a,col in cols){
  //       foreach(b,val in vals ){
  //         setUpdate += col[a]+"= '"+val[b]+"',"
  //       }
  //     }
  //     this.command = "UPDATE "+this.table+" SET "+setUpdate+" WHERE "+this.row+" = "+this.name;
  //     debug("db",this.command);
  //     return base.query(this.command);
  //   }
  // }
  // static function find(...) {
  //   if(vargv.len()>0){
  //     if(vargv[0])this.name 			= vargv[0];
  //     else if(vargv[1])this.row 		= vargv[1];
  //     else if(vargv[2])this.table 	= vargv[2];
  //   }
  //   this.command = base.findall() + " WHERE "+ this.row +" = '"+ this.name+"'";
  //   debug("db",this.command);
  //   return base.query(this.command);
  // }
}

