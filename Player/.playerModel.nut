class playerModel extends dbModel{

    Kills 		= 0;
	Dead 		= 0;
	Bank 		= 0;
	Level 		= 0;
	Mute 		= 0;
	Nogoto 		= 0;
	Pass 		= null;
	Register	= false;
	Login 		= false;
	Mute 		= false;
	Fuel 		= 0;
	Spree 		= 0;
	Jail		= 0;
    Joins		= 0;
	Lang 		= -1;
    player      = null;
	u 			= null;
	name 		= null;

    constructor(){
		base.constructor();
		this.name	 = this.default_user_name;
		this.row	 = this.default_user_row;
		this.table   = this.default_user_table;
    }
	static function find(...) {
		if(vargv.len()>0){
			if(vargv[0])this.name 			= vargv[0];
			else if(vargv[1])this.row 		= vargv[1];
			else if(vargv[2])this.table 	= vargv[2];
		}
		this.command = base.findall() + " WHERE "+ this.row +" = '"+ this.name+"'";
		debug("db",this.command);
		return base.query(this.command);
    }
	// static function get(...){
	// 	if(vargv.len()){
	// 		if(vargv[0]){
	// 			local q = find(this.name,vargv[0],this.table);
	// 			debug(q);
	// 			return ::GetSQLColumnData(q,0);
	// 		}
	// 	}
	// }

}