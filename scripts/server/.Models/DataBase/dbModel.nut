class dbModel extends dbDriver{
    /*ABSTRACT*/
    table    = null;
    columns  = null;
    where    = null;
    row      = null;
    from     = null;
    atribute = null;
    driver   = null;
    command  = null;

    constructor(){
      this.driver = dbDriver().connect();
    }

    static function query(q){
      local  query = this.driver.query(q);
      return query;
    }

    static function findall() {
      this.command= "SELECT * FROM " + this.table;
      this.driver.query(this.command);
      return this.command;
    }

    static function create() {
      this.command = "CREATE TABLE IF NOT EXISTS "+this.table+"( "+this.columns+" )";
      query(this.command);
      return this.command;
    }


}