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
	name 		= null;
	player	 	= false; 
	
	constructor(p,...){
		this.name 	= p.Name;
		this.player = p;
		local q= ::QuerySQL(db, "SELECT * FROM users WHERE nick='"+this.name+"'");
		if(!q) this.Register = false;
		else{
			if(p.UniqueID  		== ::GetSQLColumnData( q, 3 )){
				this.IP 		= ::GetSQLColumnData( q, 2 );
				this.UID 		= ::GetSQLColumnData( q, 3 );
				this.UID2 		= ::GetSQLColumnData( q, 4 );
				this.Level 		= ::GetSQLColumnData( q, 5 );
				this.Kills 		= ::GetSQLColumnData( q, 6 );
				this.Dead 		= ::GetSQLColumnData( q, 7 );
				this.Joins 		= ::GetSQLColumnData( q, 8 );
				p.Cash 			= ::GetSQLColumnData( q, 9 );
				this.Bank 		= ::GetSQLColumnData( q, 10 );
				this.Mute 		= ::GetSQLColumnData( q, 11 );
				this.Nogoto 	= ::GetSQLColumnData( q, 12 );
				this.Skin 		= ::GetSQLColumnData( q, 13 );
				this.Register	= true;
				this.Login 		= true;
				this.Fuel 		= 0;
				this.Spree 		= 0;
				this.Joins 		+=1;
			}else this.Register = true;
		}
		
	}
	auth = function(pass){
		local q= ::QuerySQL(db, "SELECT * FROM users WHERE nick='"+this.name+"'");
		if(!this.Register){
			if(q) message("Wybrana przez ciebie nzawa uzytkownika istnieje w bazie");
			else{
				::QuerySQL(db,"INSERT INTO users( nick, pass, IP, UID, UID2, level, kills, dead, joins, cash, bank, mute, nogoto, jail, skin, gangID, autospawn ) values('"+this.name+"', '"+::base64_encode(pass)+"','"+this.player.IP+"','"+this.player.UniqueID+"','"+this.player.UniqueID2+"','0','0','0','0','0','0','0','0','0','1','0','0')");
				message("Utworzono konto! twoje hsalo to: [#FF0000] "+ pass +" - nie zapomnij go :)");
			}
		}
		else if(!this.Login){
			if(q){
				if(this.Login==false){
					if(::base64_encode(pass)==::GetSQLColumnData(q,1)){
						::QuerySQL(db,"UPDATE users SET IP = '"+this.player.IP+"', UID = '"+this.player.UniqueID+"', UID2 = '" +this.player.UniqueID2+"' WHERE nick = '"+this.name+"'");
						this.Login = true;
						message("Logowanie przebieglo pomyslnie :)");
					}else message("podane haslo jest bledne");
				}else message("Jestes juz zalogowany");
			}
		}
	}
	
	edit = function(type,value){
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
		if(!this.Register)::MessagePlayer("[#FFFFFF][INFO][#66CC00] Zarejestruj swoje konto",this.player);
		else if(!this.Login)::MessagePlayer("[#FFFFFF][INFO][#66CC00] Zaloguj sie na swoje konto",this.player);
		else ::MessagePlayer("[#FFFFFF][INFO][#66CC00] Zostales automatycznie zalogowany",this.player);
	}
	message = function(text){
		//print(text);
		::MessagePlayer("[#FFFFFF][INFO][#66CC00] "+text ,this.player);
	}
}

