class PlayerStaticController {
    static function check (p,...) {
        if(vargv[0].len()>0){
            switch(vargv[0]){
                case "login":
                    if(!cache[p.ID].Login) ::MessagePlayer( show.info + show.must_login[cache[p.ID].Lang] ,p);
                    else if(!cache[p.ID].Register)::MessagePlayer(show.info + show.must_register[cache[p.ID].Lang] ,p);
                    else ::MessagePlayer( show.info + show.auto_login[cache[p.ID].Lang],p);
                break
            }
        }
    }

    static function downloadStats(player) {
        local plModel = PlayerModel();
        local q= ::QuerySQL(db, "SELECT * FROM users WHERE nick='"+player.Name+"'");
		if(!q) plModel.Register = false;
		else{
			if(player.UniqueID  		== ::GetSQLColumnData( q, 3 ) ){
                plModel.Login 	    = true;
                plModel.Register	= true;	
                player.Cash 		= ::GetSQLColumnData( q, 9 ).tointeger();
                plModel.Level 		= ::GetSQLColumnData( q, 5 ).tointeger();
                plModel.Kills 		= ::GetSQLColumnData( q, 6 ).tointeger();
                plModel.Dead 		= ::GetSQLColumnData( q, 7 ).tointeger();
                plModel.Bank 		= ::GetSQLColumnData( q, 10).tointeger();
                plModel.Mute 		= ::GetSQLColumnData( q, 11).tointeger();
                plModel.Nogoto  	= ::GetSQLColumnData( q, 12).tointeger();
                plModel.Jail 		= ::GetSQLColumnData( q, 13).tointeger();
                player.Skin 		= ::GetSQLColumnData( q, 14).tointeger();
                plModel.Lang        = 1;
                plModel.Fuel 		= 0;
                plModel.Spree 		= 0;
			}else plModel.Register = true;

            plModel.player = player;
            return plModel;
		}
    }
}