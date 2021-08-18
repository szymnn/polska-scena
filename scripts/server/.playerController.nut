class playerStats {
	Kills 		= 0;
	Dead 		= 0;
	Joins 		= 0;
	Cash 		= 0;
	Bank 		= 0;
	Level 		= 0;
	Mute 		= 0;
	Nogoto 		= 0;
	Skin 		= 0;
	IP 			= null;
	UID 		= null;
	UID2 		= null;
	Pass 		= null;
	Register	= false;
	Login 		= false;
	Mute 		= false;
	Fuel 		= 0;
	Spree 		= 0;
	Jail		= 0;
	name 		= null;
	player	 	= false; 
	lang 		= -1;
	
	constructor(p,...){
		this.name 	= p.Name;
		this.player = p;
		local q= ::QuerySQL(db, "SELECT * FROM users WHERE nick='"+this.name+"'");
		if(!q) this.Register = false;
		else{
			if(p.UniqueID  		== ::GetSQLColumnData( q, 3 ) ){
				this.Login 		= true;
				this.Register	= true;
				
				if(this.Joins <= ::GetSQLColumnData( q, 8 ).tointeger()){				
					this.Cash 		= ::GetSQLColumnData( q, 9 ).tointeger();
					this.Level 		= ::GetSQLColumnData( q, 5 ).tointeger();
					this.Kills 		= ::GetSQLColumnData( q, 6 ).tointeger();
					this.Dead 		= ::GetSQLColumnData( q, 7 ).tointeger();
					this.Joins 		= ::GetSQLColumnData( q, 8 ).tointeger();
					this.Bank 		= ::GetSQLColumnData( q, 10).tointeger();
					this.Mute 		= ::GetSQLColumnData( q, 11).tointeger();
					this.Nogoto 	= ::GetSQLColumnData( q, 12).tointeger();
					this.Jail 		= ::GetSQLColumnData( q, 13).tointeger();
					this.Skin 		= ::GetSQLColumnData( q, 14).tointeger();
					p.Cash 			= this.Cash;
					p.Score			= this.Kills;
					p.Skin 			= this.Skin;
					this.lang = 1;
					this.Fuel 		= 0;
					this.Spree 		= 0;
					this.IP 		= ::GetSQLColumnData( q, 2 );
					this.UID 		= ::GetSQLColumnData( q, 3 );
					this.UID2 		= ::GetSQLColumnData( q, 4 );
					print(this.name+" "+login_succes[this.lang]);
				}
				this.Joins 		+=1;
				// }else{
					// this.Cash 		= this.Cash;
					// this.Level 		= this.Level;
					// this.Kills 		= this.Kills;
					// this.Dead 		= this.Dead;
					// this.Joins 		= this.Joins;
					// this.Bank 		= this.Bank;
					// this.Mute 		= this.Mute;
					// this.Nogoto 	= this.Nogoto;
					// this.Jail 		= this.Jail;
					// this.Skin 		= this.Skin;
				// }
			}else this.Register = true;
		}
		
		
		
		
	}
	auth = function(...){
		type = vargv[0];
		val  = vargv[1];
		switch (type){
			case("lr"):
				local q= ::QuerySQL(db, "SELECT * FROM users WHERE nick='"+this.name+"'");
				if(!this.Register){
					if(q) message("Wybrana przez ciebie nzawa uzytkownika istnieje w bazie");
					else{
						::QuerySQL(db,"INSERT INTO users( nick, pass, IP, UID, UID2, level, kills, dead, joins, cash, bank, mute, nogoto, jail, skin, gangID, autospawn ) values('"+this.name+"', '"+::base64_encode(val)+"','"+this.player.IP+"','"+this.player.UniqueID+"','"+this.player.UniqueID2+"','0','0','0','0','0','0','0','0','0','1','0','0')");
						message("Utworzono konto! twoje hsalo to: [#FF0000] "+ val +" - nie zapomnij go :)");
					}
				}
				else if(!this.Login){
					if(q){
						if(this.Login==false){
							if(::base64_encode(val)==::GetSQLColumnData(q,1)){
								::QuerySQL(db,"UPDATE users SET IP = '"+this.player.IP+"', UID = '"+this.player.UniqueID+"', UID2 = '" +this.player.UniqueID2+"' WHERE nick = '"+this.name+"'");
								this.Login = true;
								message("Logowanie przebieglo pomyslnie :)");
							}else message("podane haslo jest bledne");
						}else message("Jestes juz zalogowany");
					}
				}
			break;
		}
	}
	
	edit = function(...){
		type = vargv[0];
		value = vargv[1];
		switch (type){
			case "password":
				if(this.Login){
					::QuerySQL(db,"UPDATE users SET pass = '"+::base64_encode(value)+"' WHERE nick = '"+this.name+"'");
					message("Twoje haslo zostalo zmienione, nowe haslo to: [#FF0000] "+ value +" - nie zapomnij go :)");
				}else message("Zaloguj sie na swoje konto lub popros administratora o zresetowanie hasla");
			break;
		}
	}
	check = function(){
		//print(" login " + this.Login +" register " + this.Register +" name " + this.name);
		message(" Has joined [#FF0000]" +this.Joins+"[#66CC00] times");
		if(!this.Register)::MessagePlayer("[#FFFFFF][INFO][#66CC00] Zarejestruj swoje konto",this.player);
		else if(!this.Login)::MessagePlayer("[#FFFFFF][INFO][#66CC00] Zaloguj sie na swoje konto",this.player);
		else ::MessagePlayer("[#FFFFFF][INFO][#66CC00] Zostales automatycznie zalogowany",this.player);
	}
	message = function(text){
		//print(text);
		::MessagePlayer("[#FFFFFF][INFO][#66CC00] "+text ,this.player);
	}
	update = function(){
		 //local q = format("UPDATE users SET level=%i, kills=%i, dead=%i, joins=%i, cash=%i, bank=%i, mute=%i, nogoto=%i, jail=%i, skin=%i WHERE nick='%s'",
			//this.Level, this.Kills, this.Dead, this.Joins, this.Cash, this.Bank, this.Mute, this.Nogoto, this.Jail, this.Skin, this.name);
		//::QuerySQL( db,q );
		if(this.Login){
			::QuerySQL(db,"UPDATE users SET level = '"+this.Level+"', kills= '"+this.Kills+"', dead = '"+this.Dead+"', joins = '"+this.Joins+"', cash= '"+this.Cash+"', bank = '"+this.Bank+"', mute= '"+this.Mute+"', nogoto = '"+this.Nogoto+"', jail = '"+this.Jail+"', skin = '"+this.Skin+"' WHERE nick = '"+this.name+"'");
			print(this.name+" HAS UPDATED STATS");
		}
		
	}

	// cutscene = function(...){
		// local type = vargv[0];
		// if(vargv.len()>=1)value = vargv[1];
		// switch(type){
			// case "create":
				// lcocal up 		= BindKey(true, 0x4C, 0, 0);
				// lcocal back 	= BindKey(true, 0x4C, 0, 0);
				// lcocal left 	= BindKey(true, 0x4C, 0, 0);
				// lcocal right	= BindKey(true, 0x4C, 0, 0);
				// local plr		= ::FindPlayer(this.name);
				// plr.freeze		= true;
			// break;
		// }
	// }
}

