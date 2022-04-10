class PlayerStaticController extends playerModel {
    static function checkStatus(p,...) {
        if(vargv[0].len()>0){
            switch(vargv[0]){
                case "login":
                    if(!cache[p.ID].Register) return show.info + show.must_register[cache[p.ID].Lang];
                    else if(!cache[p.ID].Login) return show.info + show.must_login[cache[p.ID].Lang];
                    else return show.info + show.auto_login[cache[p.ID].Lang];
                break;
            }
        }
    }
    static function updateStats(player){
        player = ::FindPlayer(player.Name);
		if(cache[player.ID].Login){
            print("UPDATE users SET level = '"+cache[player.ID].Level+"', kills= '"+cache[player.ID].Kills+"', dead = '"+cache[player.ID].Dead+"', joins = '"+cache[player.ID].Joins+"', cash= '"+cache[player.ID].player.Cash+"', bank = '"+cache[player.ID].Bank+"', mute= '"+cache[player.ID].Mute+"', nogoto = '"+cache[player.ID].Nogoto+"', jail = '"+cache[player.ID].Jail+"', skin = '"+cache[player.ID].player.Skin+"' WHERE nick = '"+player.Name+"'");
            //local q = ::QuerySQL(db,"INSERT OR REPLACE INTO users( nick, level, kills, dead, joins, cash, bank, mute, nogoto, jail, skin, gangID, autospawn ) ('"+player.Name+"', '"+cache[player.ID].Level+"', '"+cache[player.ID].Kills+"', '"+cache[player.ID].Dead+"', '"+cache[player.ID].Joins+"', '"+cache[player.ID].player.Cash+"', '"+cache[player.ID].Bank+"', '"+cache[player.ID].Mute+"', '"+cache[player.ID].Nogoto+"', '"+cache[player.ID].Jail+"', '"+cache[player.ID].player.Skin+"')");
            //local q = ::QuerySQL(db,"UPDATE users SET cash= '"+cache[player.ID].player.Cash+"' WHERE nick = '"+player.Name+"'");
            local q = format("UPDATE users SET ( level = '%i', kills= '%i', dead = '%i', joins = '%i', cash= '%i', bank = '%i', mute= '%i', nogoto = '%i', jail = '%i', skin = '%i' WHERE nick = '%s')"
            cache[player.ID].Level, cache[player.ID].Kills,cache[player.ID].Dead,cache[player.ID].Joins,cache[player.ID].player.Cash,cache[player.ID].Bank,cache[player.ID].Mute,cache[player.ID].Nogoto, cache[player.ID].Jail,cache[player.ID].player.Skin, cache[player.ID].player.Name);
            print(cache[player.ID].player.Name+" HAS UPDATED STATS");
            ::MessagePlayer(show.info + show.update_stats[cache[player.ID].Lang],player);
            cache[ player.ID ] = null;
            return ::QuerySQL(db,q);
		}

	}
    static function downloadStats(player) {
        local p = FindPlayer(player.ID);
        cache[p.ID] = playerModel();
        //------------------------//
        local plr = cache[p.ID];
        plr.setName(player.Name);
        print(  plr.getName());
        plr.setCash(1000);
        print(  plr.getCash());
        //cache[player.ID] = playerModel();
        //cache[player.ID].setName(player.Name)
        // cache[player.ID].Lang = 1;
        // local q = find(player.Name,"nick","users");
        // if(!q){
        //     cache[player.ID].Register = false;
        // }else{
        //     if(player.UniqueID  	== ::GetSQLColumnData( q, 3 ) ){
        //         cache[player.ID].Login 	    = true;
        //         cache[player.ID].Register	= true;
        //         cache[player.ID].Level 		= ::GetSQLColumnData( q, 5 ).tointeger();
        //         cache[player.ID].Kills 		= ::GetSQLColumnData( q, 6 ).tointeger();
        //         cache[player.ID].Dead 		= ::GetSQLColumnData( q, 7 ).tointeger();
        //         cache[player.ID].Bank 		= ::GetSQLColumnData( q, 10).tointeger();
        //         cache[player.ID].Mute 		= ::GetSQLColumnData( q, 11).tointeger();
        //         cache[player.ID].Nogoto  	= ::GetSQLColumnData( q, 12).tointeger();
        //         cache[player.ID].Jail 		= ::GetSQLColumnData( q, 13).tointeger();
        //         cache[player.ID].Cash        = ::GetSQLColumnData( q, 9 ).tointeger();
        //         cache[player.ID].Skin 	    = ::GetSQLColumnData( q, 14).tointeger();
        //         cache[player.ID].Lang       = 1;
        //         cache[player.ID].Fuel 		= 0;
        //         cache[player.ID].Spree 		= 0;
		// 	}else cache[player.ID].Register = true;
		// }
        // cache[player.ID].u = player;
        // return cache[player.ID];
    }
    static function auth(p, pass){
        local q = find(p.Name,"nick","users"),c;
		if(!cache[p.ID].Register==false){
			if(q) return(show.info + show.busy[cache[p.ID].Lang]);
			else{
				::QuerySQL(db,"INSERT INTO users( nick, pass, secure, IP, UID, UID2, level, kills, dead, joins, cash, bank, mute, nogoto, jail, skin, gangID, autospawn ) values('"+p.Name+"', '"+::base64_encode(pass)+"','','"+p.IP+"','"+p.UniqueID+"','"+p.UniqueID2+"','0','0','0','0','0','0','0','0','0','1','0','0')");
				if(cache[p.ID].Lang==0) c = "Your password is: [#FF0000] "+ pass +" - don't forgot it :)";
                else c = "twoje hsalo to: [#FF0000] "+ pass +" - nie zapomnij go :)";
                return( show.info + show.reg_succes[cache[p.ID].Lang] + c);
			}
		}
        else if(!cache[p.ID].Login){
            if(q){
                if(::base64_encode(pass)==::GetSQLColumnData(q,1)){
                    ::QuerySQL(db,"UPDATE users SET IP = '"+p.IP+"', UID = '"+p.UniqueID+"', UID2 = '" +p.UniqueID2+"' WHERE nick = '"+p.Name+"'");
                    cache[p.ID].Login = true;
                    return(show.info + show._login[cache[p.ID].Lang]);
                }else return (show.info + show._wrongPass[cache[p.ID].Lang]);
            }
        }
        else return( show.info + show._alreadyLogged[cache[p.ID].Lang]);
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