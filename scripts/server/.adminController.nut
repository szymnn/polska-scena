class admin extends playerStats{
	lvl  	= 0;
	plv 	= 0;
	secure 	= "";
	adm_name 	= null;
	plr_name	= null; 
	adm  		= null;
	plr			= null;
	constructor(admin,player)
	{
		this.plr 		= player;
		this.adm		= admin;
		this.adm_name 	= playerStats(admin).name;
		this.lvl 		= playerStats(admin).Level;
		this.plr_name	= playerStats(player).name;
		this.plv 		= playerStats(player).Level;
		print("Admin: "+this.adm_name +" lvl " + this.lvl + " Player: "+this.plr_name +" lvl " + this.plv);
	}
	edit = function(type,value){
		switch(type){
			case "money":
				playerStats(this.plr).money = value;
				//this.admin.Level = 10;
				playerStats(this.plr).message("Admin [#FF0000]"+this.adm_name+"[#66CC00] zmienil twoj bilans konta na [#FF0000]"+ value+" [#66CC00]$");
				playerStats(this.adm).message("Zmieniles stan konta gracza [#FF0000]"+this.plr_name+"[#66CC00] na [#FF0000]"+ value+" [#66CC00]$ " );
				playerStats(this.plr).update();
			break;
			}
	}
}