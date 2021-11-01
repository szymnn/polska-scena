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
      //this.command = "CREATE TABLE IF NOT EXISTS "+this.table+"( "+this.columns+" )";
      this.command = "CREATE TABLE STATS ( Name VARCHAR(32), Kills INT, Dead INT, Joins INT, Cash INT, Bank INT, Level INT, Mute INT, Nogoto INT, Cela INT, Walizki INT, KeyCard INT , Skin INT, GangID INT, IP VARCHAR(32), Pass VARCHAR(32), UnikalneID VARCHAR(32), AutoSpawn VARCHAR(32), Kody VARCHAR(32) )";
      query(this.command);
      return this.command;
    }


}