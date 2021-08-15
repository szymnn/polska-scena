class Vehicle extends playerStats{
	id 	= 0;	fuel = 0; tuning_id = 0; owner = ""; sowner = ""; stole = false; sold=false; price = 0; playerIn = false;
	constructor(car)
	{
		this.id 		= car;
		this.fuel 	  	= this.fuel;
		this.tuning_id 	= this.tuning_id;
		this.owner 		= this.owner;
		this.sowner 	= this.sowner;
		this.stole 		= this.stole;
		this.sold		= this.sold;
		this.price		= this.price;
		this.playerIn 	= this.playerIn;
	}
	setStats=function(){
		for(local i = 0; i<=99999; i++){

			fuel 		= 100000;
			tuning_id 	= 0;
			owner 		= "admin";
			sowner 		= "";
			stole 		= false;
			sold 		= false;
			price 		= 0;
			playerIn 	= false;
		}
	}
	buy=function(id){
		if(this.owner==""){
			return ::Message("You can buy this  type: /buy veh "+id);
		}
	}
	spawn=function(){
		if(!this.playerIn){
			print(this.playerIn);
			if(this.owner==""){
				print(this.owner);
				return true;
			}else{
				if(Level>=1)return true;
			}
		}
	}
}
function onScriptLoad(){
	print( "scripts/server/.vehicle.nut - loaded" );
	
}
function onPlayerEnteringVehicle( player, vehicle, door ){
	print(vehicle.ID);
	local veh=Vehicle(vehicle.ID);
	veh.buy();
	veh.playerIn=true;
	return 1;
}