class PlayerStaticController extends playerModel {
    constructor(){
        base.constructor();
        dbManager.table = "users";
        dbManager.row   = "nick";
    }
    static function checkStatus(p,...) {
        if(vargv[0].len()>0){
            switch(vargv[0]){
                case "login":
                    if(cache[p.ID].getRegister()==false) return show.info + show.must_register[cache[p.ID].Lang];
                    else if(cache[p.ID].getLogin()==false) return show.info + show.must_login[cache[p.ID].Lang];
                    else return show.info + show.auto_login[cache[p.ID].Lang];
                break;
            }
        }
    }
    static function updateStats(player){
        local gamer = cache[player.ID];
		if(gamer.getLogin()==true){
            gamer.save();
            ::MessagePlayer(show.info + show.update_stats[cache[player.ID].Lang],player);
            cache[ player.ID ] = null;
            gamer = cache[ player.ID ];
		}

	}
    static function downloadStats(player) {
        local p = FindPlayer(player.ID);
        cache[p.ID] = playerModel();
        //------------------------//
        local gamer = cache[p.ID];
        gamer.setName(p.Name);
        gamer.setID(p.ID);
        gamer.setIP(p.IP);
        gamer.setUID(p.UniqueID);
        gamer.setUID2(p.UniqueID2);
        gamer.setIP(p.IP);
        gamer.setRegister(false);
        gamer.setLogin(false);
        gamer.setLang(1);
        gamer.setKills(0);
        local q = dbManager.find(gamer.getName(),dbManager.row,dbManager.table);
        if(q && mysql_num_rows( q )>0 || q && GetSQLColumnCount( q )>0){
            gamer.setRegister(true);
            if(dbManager.type == "sql"){
    
                gamer.setPass(::base64_decode(::GetSQLColumnData( q, 1 )));
                gamer.setUID( ::GetSQLColumnData( q, 3 ));
                gamer.setUID2(::GetSQLColumnData( q, 4 ));

                if(gamer.getUID()==p.UniqueID || gamer.getUID2()==p.UniqueID2){
                    gamer.setLogin(true);
                    gamer.setLevel(::GetSQLColumnData( q, 5));                      
                    gamer.setKills(::GetSQLColumnData( q, 6 ));
                    gamer.setDead(::GetSQLColumnData( q, 7 ));
                    gamer.setJoins(::GetSQLColumnData( q, 8));
                    gamer.setCash(::GetSQLColumnData( q, 9 ));
                    gamer.setBank(::GetSQLColumnData( q, 10 ));
                    gamer.setMute(::GetSQLColumnData( q, 11 ));
                    gamer.setNogoto(::GetSQLColumnData( q, 12 ));
                    gamer.setJail(::GetSQLColumnData( q, 13 ));
                    gamer.setSkin(::GetSQLColumnData( q, 14 ));
                    gamer.setGang(::GetSQLColumnData( q, 15 ));
                    gamer.setAutospawn(::GetSQLColumnData( q, 16 ));

                }else gamer.setLogin(false);
                p.Cash  = gamer.getCash();
                p.Score = gamer.getKills();
            }
            else if(dbManager.type=="mysql"){
                
                local stats = mysql_fetch_row(q); 
    
                gamer.setPass(::base64_decode(stats[1]));
                gamer.setUID(stats[3]);
                gamer.setUID2(stats[4]);

                if(gamer.getUID()==p.UniqueID || gamer.getUID2()==p.UniqueID2){
                    gamer.setLogin(true);
                    gamer.setLevel(stats[5]);                      
                    gamer.setKills(stats[6]);
                    gamer.setDead(stats[7]);
                    gamer.setJoins(stats[8]);
                    gamer.setCash(stats[9]);
                    gamer.setBank(stats[10]);
                    gamer.setMute(stats[11]);
                    gamer.setNogoto(stats[12]);
                    gamer.setJail(stats[13]);
                    gamer.setSkin(stats[14]);
                    gamer.setGang(stats[15]);
                    gamer.setAutospawn(stats[16]);

                }else gamer.setLogin(false);
                p.Cash  = gamer.getCash();
                p.Score = gamer.getKills();
            }
        }
        return cache[p.ID];
    }
    static function auth(p, pass){
        local gamer = cache[p.ID];
        local q = dbManager.find(p.Name,dbManager.row,dbManager.table),c;
		if(gamer.getRegister()==false){
			if(q && mysql_num_rows( q )>0) return(show.info + show.busy[gamer.getLang()]);
			else{
                gamer.setPass(pass);
                gamer.save();
				if(gamer.getLang()==0) c = "Your password is: [#FF0000] "+ gamer.getPass() +" - don't forgot it :)";
                else c = "twoje hsalo to: [#FF0000] "+ gamer.getPass() +" - nie zapomnij go :)";
                return( MessagePlayer(show.info + show.reg_succes[gamer.getLang()] + c,p));
			}
		}
        else if(gamer.getLogin()==false){
            if(dbManager.type=="mysql"){
                if(q && mysql_num_rows( q )>0 ){
                    if(pass==gamer.getPass()) {
                        gamer.setLogin(true);
                        gamer.setUID(p.UniqueID);
                        gamer.setUID2(p.UniqueID2);
                    }
                }else return (show.info + show._wrongPass[gamer.getLang()]);
            }
            else if(dbManager.type=="mysql"){
                if(q && mysql_num_rows( q )>0 ){
                    if(pass== gamer.getPass())  {
                        gamer.setLogin(true);
                        gamer.setUID(p.UniqueID);
                        gamer.setUID2(p.UniqueID2);
                    }
                }else return (show.info + show._wrongPass[gamer.getLang()]);
            }
            
            return(show.info + show._login[gamer.getLang()]);
                
        }
        else return( show.info + show._alreadyLogged[gamer.getLang()]);
    }
    static function unjail( p ) {
      local p = ::FindPlayer(p);
		if( cache[ p.ID ].Jail == 1 ){
            cache[ p.ID ].Jail = 0;
            p.Frozen = false;
            //MessagePlayer( "[#ffffff][AUTO-UNJAIL][#00ff00] Zostales wypuszczony.", p );
	    }
    }
}