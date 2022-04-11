class vehicleModel extends vehicleInterface(){
    constructor(){
        base.constructor();
    }
    
    //fuel        = 0;
    static function getFuel(){
        return this.fuel;
    }
    static function setFuel(val){
        return this.fuel = val;
    }
    //owner       = null;
    static function getOwner(){
        return this.owner;
    }
    static function setOwner(val){
        return this.owner = val;
    }
    //sowner      = null;
    static function getSowener(){
        return this.sowner;
    }
    static function setSowner(val){
        return this.sowner = val;
    }
    //id          = null;
    static function getID(){
        return this.id;
    }
    static function setID(val){
        return this.id = val;
    }
    //spawnPos    = "0.0.0";
    static function getSpawnPos(){
        return this.spawnPos;
    }
    static function setSpawnPos(val){
        return this.spawnPos = val;
    }
    //spawnAngle  = "0.0.0";
    static function getSpawnAngle(){
        return this.spawnAngle;
    }
    static function setSpawnAngle(val){
        return this.spawnAngle = val;
    }
    //pos         = "0.0.0";
    static function getPos(){
        return this.pos;
    }
    static function setPos(val){
        return this.pos = val;
    }
    //angle       = "0.0.0";
    static function getAngle(){
        return this.angle;
    }
    static function setAngle(val){
        return this.angle = val;
    }
    //health      = 100;
    static function getHealth(){
        return this.health;
    }
    static function setHealth(val){
        return this.health = val;
    }
    //color1      = 0;
    static function getColor1(){
        return this.color1;
    }
    static function setColor1(val){
        return this.color1 = val;
    }
    //color2      = 0;
    static function getColor1(){
        return this.color2;
    }
    static function setColor1(val){
        return this.color2 = val;
    }
        //SET COLOR
        static function setColor(){
            return this.color = dbManager.serialize(getColor1(),getColor2());
        }
        //GET COLOR
        static function setColor(){
            return this.color = dbManager.unserialize(getColor1(),getColor2());
        }
    //tune        = [];
    static function getTune(){
        return this.tune;
    }
    static function setTune(val){
        return this.tune = val;
    }
    //tuneVal     = [];
    static function getTuneVal(){
        return this.tuneVal;
    }
    static function setTuneVal(val){
        return this.tuneVal = val;
    }
    //cost        = 0;
    static function getCost(){
        return this.cost;
    }
    static function setCost(val){
        return this.cost = val;
    }
    //lock        = 0;
    static function getLock(){
        return this.lock;
    }
    static function setLock(val){
        return this.lock = val;
    }
    //model       = 0;
    static function getModel(){
        return this.model;
    }
    static function setModel(val){
        return this.model = val;
    }
    //tax       = 0;
    static function getModel(){
        return this.tax;
    }
    static function setModel(val){
        return this.tax = val;
    }

    static function get(pid = "", field = "name"){
        local db = dbManager;
        db.table = "vehicles";
        local vehicles = null;
        if(pid == "") users = db.findall();
        else vehicles =  db.find(pid,filed);

        return vehicles;
    }

    static function save()
    {
        local db = dbManager;
        db.table = this.table;
        db.row   = "name";
        db.name  = this.getName();
        print(db.name);
        local cols = ["name","model","cost","owner","sowner","lock","tax","tune","color","fuel"];
        local vals = [this.getName(),::base64_encode(this.getPass()),this.getIP(),this.getUID(),this.getUID2(),this.getLevel(),this.getKills(),this.getDead(),this.getJoins(),
            this.getCash(),this.getBank(),this.getMute(),this.getNogoto(),this.getJail(),this.getSkin(),this.getGang(),this.getAutospawn()];
        db.update(cols,vals);
        return true;
    }

}