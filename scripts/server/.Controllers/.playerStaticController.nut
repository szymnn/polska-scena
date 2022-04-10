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
        if(q && mysql_num_rows( q )>0){
            if(dbManager.type == "sql"){
                gamer.setRegister(true);
                gamer.setLogin(false);
                print("sql");
            }
            else if(dbManager.type=="mysql"){
                gamer.setRegister(true);

                local stats = mysql_fetch_row(q); 
    
                gamer.setPass(::base64_decode(stats[1]));
                gamer.setUID(stats[3]);
                gamer.setUID2(stats[4]);

                if(gamer.getUID()==p.UniqueID || gamer.getUID2()==p.UniqueID2){
                    gamer.setLogin(true);
                    gamer.setLevel(stats[5]);                      
                    gamer.setCash(stats[6]);
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
                
            }
        }
            /*
            if(player.UniqueID  	== ::GetSQLColumnData( q, 3 ) ){
                cache[player.ID].Login 	    = true;
                cache[player.ID].Register	= true;
                cache[player.ID].Level 		= ::GetSQLColumnData( q, 5 ).tointeger();
                cache[player.ID].Kills 		= ::GetSQLColumnData( q, 6 ).tointeger();
                cache[player.ID].Dead 		= ::GetSQLColumnData( q, 7 ).tointeger();
                cache[player.ID].Bank 		= ::GetSQLColumnData( q, 10).tointeger();
                cache[player.ID].Mute 		= ::GetSQLColumnData( q, 11).tointeger();
                cache[player.ID].Nogoto  	= ::GetSQLColumnData( q, 12).tointeger();
                cache[player.ID].Jail 		= ::GetSQLColumnData( q, 13).tointeger();
                cache[player.ID].Cash        = ::GetSQLColumnData( q, 9 ).tointeger();
                cache[player.ID].Skin 	    = ::GetSQLColumnData( q, 14).tointeger();
                cache[player.ID].Lang       = 1;
                cache[player.ID].Fuel 		= 0;
                cache[player.ID].Spree 		= 0;
			}else cache[player.ID].Register = true;
            */

        return cache[p.ID];
    }
    static function auth(p, pass){
        local gamer = cache[p.ID];
        local q = dbManager.find(p.Name,dbManager.row,dbManager.table),c;
		if(gamer.getRegister()==false){
			if(q) return(show.info + show.busy[gamer.getLang()]);
			else{
                gamer.setPass(pass);
                gamer.save();
                
				// ::QuerySQL(db,"INSERT INTO users( nick, pass, secure, IP, UID, UID2, level, kills, dead, joins, cash, bank, mute, nogoto, jail, skin, gangID, autospawn ) values('"+p.Name+"', '"+::base64_encode(pass)+"','','"+p.IP+"','"+p.UniqueID+"','"+p.UniqueID2+"','0','0','0','0','0','0','0','0','0','1','0','0')");
				if(gamer.getLang()==0) c = "Your password is: [#FF0000] "+ gamer.getPass() +" - don't forgot it :)";
                else c = "twoje hsalo to: [#FF0000] "+ gamer.getPass() +" - nie zapomnij go :)";
                return( show.info + show.reg_succes[gamer.getLang()] + c);
			}
		}
        else if(gamer.getLogin()==false){
            if(dbManager.type=="mysql"){
                if(q && mysql_num_rows( q )>0 ){
                    if(pass==gamer.getPass()) gamer.setLogin(true);
                }else return (show.info + show._wrongPass[gamer.getLang()]);
            }
            else if(dbManager.type=="mysql"){
                if(q && mysql_num_rows( q )>0 ){
                    if(pass== gamer.getPass())  gamer.setLogin(true);
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