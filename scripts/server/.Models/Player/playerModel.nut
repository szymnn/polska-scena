class playerModel extends playerInterface {
    constructor(){
        base.constructor();
        this.table = "users";
    }
    static function getName(){
        return this.Name;
    }

    static function setName(name){
        return this.Name = name;
    }
	/*
     @ Kills
     */
    static function getKills(){
        return this.Kills;
    }

    static function setKills(value){
        return this.Kills = value;
    }
	/*
        @Dead 		
    */
    static function getDead(){
        return this.Dead;
    }

    static function setDead(value){
        return this.Dead = value;
    }
	// Bank 		= 0;
    static function getBank(){
        return this.Bank;
    }

    static function setBank(value){
        return this.Bank = value;
    }
	// Level 		= 0;
    static function getLevel(){
        return this.Level;
    }

    static function setLevel(value){
        return this.Level = value;
    }
	// MuteTime 		= 0;
    static function getMuteTime(){
        return this.MuteTime;
    }

    static function setMuteTime(value){
        return this.MuteTime = value;
    }
	//Nogoto 		= 0;
    static function getNogoto(){
        return this.Nogoto;
    }

    static function setNogoto(value){
        return this.Nogoto = value;
    }
	//Pass 		= null;

	// Register	= false;
    static function getRegister(){
        return this.Register;
    }

    static function setRegister(value){
        return this.Register = value;
    }
	//Login 		= false;
    static function getLogin(){
        return this.Login;
    }

    static function setLogin(value){
        return this.Login = value;
    }
	//Mute 		= false;
    static function getMute(){
        return this.Mute;
    }

    static function setMute(value){
        return this.Mute = value;
    }
	//Fuel 		= 0;
    static function getFuel(){
        return this.Fuel;
    }

    static function setFuel(value){
        return this.Fuel = value;
    }
	//Spree 		= 0;
    static function getSpree(){
        return this.Spree;
    }

    static function setSpree(value){
        return this.Spree = value;
    }
	//Jail		= 0;
    static function getJail(){
        return this.Jail;
    }

    static function setJail(value){
        return this.Jail = value;
    }
    //Joins		= 0;
    static function getJoins(){
        return this.Joins;
    }

    static function setJoins(value){
        return this.Joins = value;
    }
	//Lang 		= -1;
    static function getLang(){
        return this.Lang;
    }

    static function setLang(value){
        return this.Lang = value;
    }
    //Name        = null;
    static function getName(){
        return this.Name;
    }

    static function setName(value){
        return this.Name = value;
    } 
    //Armour      = null; 
    static function getArmour(){
        return this.Armour;
    }

    static function setArmour(value){
        return this.Armour = value;
    }
   // Away        = null;
    static function getAway(){
    return this.Away;
    }

    static function setAway(value){
        return this.Away = value;
    } 
   // CameraLocked= null; 
   static function getCameraLocked(){
    return this.CameraLocked;
    }

    static function setCameraLocked(value){
        return this.CameraLocked = value;
    }
    //CanAttack   = null; 
    static function getCanAttack(){
        return this.CanAttack;
    }

    static function setCanAttack(value){
        return this.CanAttack = value;
    }
    //CanDriveby  = null; 
    static function getCanDriveby(){
        return this.CanDriveby;
    }

    static function setCanDriveby(value){
        return this.CanDriveby = value;
    }
    //Cash        = null; 
    static function getCash(){
        return this.Cash;
    }

    static function setCash(value){
        return this.Cash = value;
    }
    /// Class       = null; 
    static function getClass(){
        return this.Class;
    }

    static function setClass(value){
        return this.Class = value;
    }
   // Colour      = null; 
   static function getColour(){
    return this.Colour;
    }

    static function setColour(value){
        return this.Colour = value;
    }
    // Disarm      = null; 
    static function setDisarm(value){
        return this.Disarm = value;
    }
   // Eject       = null; 
    static function setEject(value){
        return this.Eject = value;
    }
    //Frozen      = null; 
    static function getFrozen(){
        return this.Frozen;
    }

    static function setFrozen(value){
        return this.Frozen = value;
    }
    //GiveMoney       = null; 
    static function setGiveMoney(value){
        return this.GiveMoney = value;
    }
    // GiveWeapon      = null; 
    static function setGiveWeapon(value,ammo=100){
        return this.GiveWeapon = array(value,ammo);
    }
    //GreenScanlines  = null; 
    static function getGreenScanlines(){
        return this.GreenScanlines;
    }

    static function setGreenScanline(value){
        return this.GreenScanlines = value;
    }

   // ID              = null; 
    static function getID(){
        return this.ID;
    }

    static function setID(value){
        return this.ID = value;
    }
    
    //password
    static function getPass(){
        return base64_encode(this.Pass);
    }

    static function setPass(value){
        return this.Pass = base64_encode(value);
    }
    //IP              
    static function getIP(){
        return this.IP;
    }

    static function setIP(value){
        return this.IP = value;
    }
    //UniqueID
     static function getUID(){
        return this.UniqueID;
    }

    static function setUID(value){
        return this.UniqueID = value;
    }
    //UniqueID2
    static function getUID2(){
        return this.UniqueID2;
    }

    static function setUID2(value){
        return this.UniqueID2 = value;
    }
    //Autospawn
    static function getAutospawn(){
        return this.Autospawn;
    }

    static function setAutospawn(value){
        return this.Autospawn = value;
    }
    //GangID
    static function getGang(){
        return this.GangID;
    }

    static function setGang(value){
        return this.GangID = value;
    }
   

    static function get(pid = "", field = "nick"){
        db = dbManager();
        db.table = "users";
        local users = null;
        if(pid == "") users = db.findall();
        else users =  db.find(pid,filed);

        return users;
    }

    static function save(gamer)
    {
        db = dbManager();
        db.table = this.table;
        db.row   = "nick";
        db.name  = gamer.getName();
        local cols = ["nick","pass","ip","uid","uid2","level","kills","dead","joins","cash","bank","mute","nogoto","jail","skin","gangID","autospawn"];
        local vals = [gamer.getName(),gamer.getPass(),gamer.getIP(),gamer.getUID(),gamer.GetUID2(),gamer.getLevel(),gamer.getCash(),gamer.getBank,gamer.getMute(),
            gamer.getNogoto(),gamer.getJail(),gamer.getSkin(),gamer.getGang(),gamer.getAutospawn()];
        db.update(cols,vals);
        return true;
    }


}