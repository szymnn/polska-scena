class vehicleInterface extends dbModel{
    fuel        = 0;
    owner       = null;
    sowner      = null;
    ID          = null;
    spawnPos    = "0.0.0";
    spawnAngle  = "0.0.0";
    pos         = "0.0.0";
    angle       = "0.0.0";
    health      = 100;
    color1      = 0;
    color2      = 0;
    tune        = [];
    tuneVal     = [];
    cost        = 0;
    lock        = 0;
    model       = 0;
    tax         = 0;
    color       =[];
    
    constructor(){
		base.constructor();
		this.name	 = "PCJ-600";
		this.row	 = "name";
		this.table   = "vehicles";
    }
}