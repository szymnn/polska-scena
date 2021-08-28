function onServerStart(){	
}
function onActorDeath( actorid )
{
 //spawn_actor( actorid );
}
 function onPlayingCompleted(file,actorid)
{
//PlayFile(file, actorid);
}
function onServerStop(){
}

function onScriptLoad(){
	
	dofile( "scripts/server/loader.nut" );
	serverController.StartServer();
	SetSpawnPlayerPos(-924.16, 1057.98, 15.6029);
	SetSpawnCameraPos( -925.6366, 1039.8380, 13.0848 );
	SetSpawnCameraLook( -925.1487, 1048.4241, 13.2005 );  
	//local test = dbController.create("test3", ["test", "test2", "test3"], [""], [",UNIQUE(test)"]);
	local q = dbController();
	q.create( "users", 
		["nick", "pass", "IP", "UID", "UID2", "level", "kills", "dead", "joins", "cash", "bank", "mute", "nogoto", "jail", "skin", "gangID", "autospawn"], 
		[ "VARCHAR(32)",  "VARCHAR(255)",  "VARCHAR(255)",  "VARCHAR(255)",  "VARCHAR(255)",  "VARCHAR(255)",  "VARCHAR(255)",  "VARCHAR(255)",  "VARCHAR(255)",  "VARCHAR(255)",  "VARCHAR(255)",  "VARCHAR(255)",  "VARCHAR(255)",  "VARCHAR(255)",  "VARCHAR(255)",  "VARCHAR(255)",  "VARCHAR(32)"], 
		[",UNIQUE(nick)"] 
	);
	q.create("vehicle",
		["name","cost","owner","sowner","model", "pos", "lock", "fuel", "tax", "color1", "color2", "tune"],
		["VARCHAR(32)",  "VARCHAR(25)",  "TEXT",  "TEXT",  "VARCHAR(32)",  "VARCHAR(32)",  "VARCHAR(32)",  "VARCHAR(32)",  "VARCHAR(32)",  "VARCHAR(32)",  "VARCHAR(32)",  "VARCHAR(32)"]
	);
	q.create("cmds",
		["cmd", "lvl", "secure"],
		["VARCHAR(255)" ,  "VARCHAR(255)",  "VARCHAR(255)"], 
		[",UNIQUE(cmd)"]
	);
	if(GetPlayers()>0){
		for( local n = 0; n < GetPlayers(); n++ ){
			local player = FindPlayer( n );
			local temp = PlayerStaticController.downloadStats(player);
			cache[player.ID] = temp;
			MessagePlayer(PlayerStaticController.checkStatus(player,"login"),player);
		}
	}
	AnnounceAll("",6);
	onAddCommand("reg","0","");
	onAddCommand("log","0","");
	onAddCommand("login","0","");
	onAddCommand("smon","10","test");
	onAddCommand("cmds","0","");
	onAddCommand("help","0","");
	onAddCommand("set","0","");
	onAddCommand("jail","0","");
}
function relo(){
	DisconnectSQL(db);
	ReloadScripts();
	}
function onScriptReload(){
	if(GetPlayers()>0){
		for( local n = 0; n < GetPlayers(); n++ ){
			local player = FindPlayer( n );
			if(cache[player.ID].Login){
				PlayerStaticController.updateStats(player);
				MessagePlayer(show.server + show.unload_script[cache[player.ID].Lang],player);
			}
		}
	}

	NewTimer("print", 1000, 1, "*****Restart will happen in 5 second");
	NewTimer("AnnounceAll", 1000, 1, "~g~Restart will happen in ~t~5 ~g~second",6);
	NewTimer("print", 2000, 1, "*****Restart will happen in 4 second");
	NewTimer("AnnounceAll", 2000, 1, "~g~Restart will happen in ~t~4 ~g~second",6);
	NewTimer("print", 3000, 1, "*****Restart will happen in 3 second");
	NewTimer("AnnounceAll", 3000, 1, "~g~Restart will happen in ~t~3 ~g~second",6);
	NewTimer("print", 4000, 1, "*****Restart will happen in 2 second");
	NewTimer("AnnounceAll", 4000, 1, "~g~Restart will happen in ~t~2 ~g~second",6);
	NewTimer("print", 5000, 1, "*****Restart will happen in 1 second");
	NewTimer("AnnounceAll", 5000, 1, "~g~Restart will happen in ~t~1 ~g~second",6);
	NewTimer("AnnounceAll", 6000, 1, "~g~.................................",6);
	NewTimer("relo", 6500, 1);
	//relo();
}

function onScriptUnload(){

}

// =========================================== P L A Y E R   E V E N T S ==============================================

function onPlayerJoin( player ){
	local temp = PlayerStaticController.downloadStats(player);
	print(temp.Login);
	cache[player.ID] = temp;
	MessagePlayer(PlayerStaticController.checkStatus(player,"login"),player);
}



function onPlayerPart( player, reason ){
	print(player.ID);
 	PlayerStaticController.updateStats(player);
	//playerStats().update();
}

function onPlayerRequestClass( player, classID, team, skin ){
	return 1;
}

function onPlayerRequestSpawn( player ){
	if(cache[player.ID].Login==true)return 1;
	else return 0;
}

function onPlayerSpawn( player ){
	player.Pos = Vector(405.954, -459.039,10.1126);
}

function onPlayerDeath( player, reason ){
}

function onPlayerKill( player, killer, reason, bodypart ){
}

function onPlayerTeamKill( player, killer, reason, bodypart ){
}

function onPlayerChat( player, text ){
	print( player.Name + ": " + text );
	return 1;
}

function onPlayerCommand( player, cmd, text ){
	local ucan = cmdController.can(player,cmd);
		if(ucan.can && cache[player.ID].Jail!=1 || cache[player.ID].Level>=10){
			if(cmd=="test"){
				AnnounceAll("dupa",3);
			}
			else if (cmd =="set"){
				if(text){
					local target = GetTok( text, " ", 2), value  = GetTok( text, " ", 3, NumTok( text, " " ) );
					print( target +" " + value);
					//local text = split( text, " " );
					if(target){
						if(value){
							local plr = FindPlayer( target );
							print(plr.ID);
							value = value.tointeger();
							//print(GetTok( text, " ", 1) + plr + value)
							switch(GetTok( text, " ", 1)){
								case "money":
									print(cache[plr.ID].Mute);
									cache[plr.ID].player.Cash += value;
								break;
								case "lvl":
									cache[plr.ID].plr = value;
								break;
								case "bank":
									cache[plr.ID].plr += value;
								break;	
								case "kills":
									cache[plr.ID].Kills = value;
									plr.Score = cache[plr.ID].Kills;
								break;	
								case "dead":
									cache[plr.ID].Dead = value;
								break;	
							}
						}else MessagePlayer(show.sytnax[cache[player.ID].Lang] + show.player_value[cache[player.ID].Lang],player);
					}else MessagePlayer(show.info + "money / lvl / bank / kills / dead",player);
				}else MessagePlayer(show.info + "money / lvl / bank / kills / dead",player);
			}
			else if (cmd == "jail"){
				if(text){
					local target = GetTok( text, " ", 1); 
					local value  = GetTok( text, " ", 2, NumTok( text, " " ) );
					if(target ){
						if(value){
							target = FindPlayer( target );
							cache[target.ID].Jail = 1;
							target.Pos = Vector(381.9696, -505.1464, 9.3956);
							target.Angle = 233.1529;
							target.Frozen = true;
							value =  value*1000;
							NewTimer( "PlayerStaticController.unjail",value, 1, target.Name );
						}else MessagePlayer(show.sytnax[cache[player.ID].Lang] + show.player_value[cache[player.ID].Lang],player);
					}else MessagePlayer(show.sytnax[cache[player.ID].Lang] + show.player_value[cache[player.ID].Lang],player);
				}else MessagePlayer(show.sytnax[cache[player.ID].Lang] + show.player_value[cache[player.ID].Lang],player);
			}
			else if (cmd == "login" || cmd =="register" || cmd =="reg") {
				if(text)MessagePlayer(PlayerStaticController.auth(player,text),player);
				else MessagePlayer(show.info + show._pass_empty[cache[player.ID].Lang],player);
			}
			else if (cmd == "cmds" || cmd == "cmd" || cmd == "commands" || cmd == "help"){
				local c = 0; if(cache[player.ID].Lang == 0 ) c = "Your command list";
				else c = "Lista dostępnych komend:";
				MessagePlayer(show.info + c,player);
				MessagePlayer("[#F0F0F0]"+cmdController.cmdList(player),player);
			}
		}
		else MessagePlayer(show.sytnax[cache[player.ID].Lang] + show.cmd_exists[cache[player.ID].Lang],player );

	// else{
	// 	if(cmd == "tests")
	// 	{
	// 		CreateCheckpoint(player, 0, false, Vector(405.954, -459.039,10.1126), ARGB(255, 255, 0, 0), 1);
	// 		return 1;
	// 	}
	// 	else if(cmd == "t")
	// 	{
	// 		local x = 390.21;
	// 		create_actor( "lance", 5, 405.954, -459.039, 10.1126, 1.5 ); 
	// 		return 1;
	// 	}
	// 	else if (cmd=="spawn"){
	// 		local veh = FindVehicle( text.tointeger() );
	// 		if(Vehicle(veh).spawn()){
	// 			veh.Pos = Vector( ( player.Pos.x + 2 ), player.Pos.y, ( player.Pos.z + 0.1 ) );
	// 			MessagePlayer("Przywolano auto o id "+ veh, player);
	// 		}else MessagePlayer("Operacaja nie dozwolona.", player);
	// 	}
	// 	else if (cmd == "login" || cmd =="register" || cmd =="reg") {
	// 		if(text)playerStats(player).auth("lr",text);
	// 		else MessagePlayer("Podaj haslo",player);
	// 	}
	// 	else if (cmd =="spas"){
	// 		if(text){
	// 			playerStats(player).edit("password",text);
	// 		}else MessagePlayer("podaj nowe haslo",player);
	// 	}
	// 	// else if(cmd=="set"){
	// 	// 	if(text){
	// 	// 		if(text == "mon"){
	// 	// 			local target = GetTok( text, " ", 2); 
	// 	// 			local value  = GetTok( text, " ", 3, NumTok( text, " " ) );
	// 	// 			if(target ){
	// 	// 				if(value){
	// 	// 				}
	// 	// 			}
	// 	// 		}
	// 	// 	}
	// 	// }
	// 	else if (cmd =="smon"){
	// 		if(text){
	// 			local target = GetTok( text, " ", 1); 
	// 			local value  = GetTok( text, " ", 2, NumTok( text, " " ) );
	// 			if(target ){
	// 				if(value){
	// 					target = FindPlayer(target);
	// 					MessagePlayer(admin(player,target).edit("money",value),player);

	// 				}
	// 			}
				
	// 		}else MessagePlayer("skladnia: <gracz> <wartosc>",player);
	// 	}
	// }
	
	return 1;
}

function onPlayerPM( player, playerTo, message ){
	return 1;
}

function onPlayerBeginTyping( player ){
}

function onPlayerEndTyping( player ){
}

/*
function onLoginAttempt( player ){
	return 1;
}
*/

function onNameChangeable( player ){
}

function onPlayerSpectate( player, target ){
}

function onPlayerCrashDump( player, crash ){
}

function onPlayerMove( player, lastX, lastY, lastZ, newX, newY, newZ ){
}

function onPlayerHealthChange( player, lastHP, newHP ){
}

function onPlayerArmourChange( player, lastArmour, newArmour ){
}

function onPlayerWeaponChange( player, oldWep, newWep ){
}

function onPlayerAwayChange( player, status ){
}

function onPlayerNameChange( player, oldName, newName ){
}

function onPlayerActionChange( player, oldAction, newAction ){
}

function onPlayerStateChange( player, oldState, newState ){
}

function onPlayerOnFireChange( player, IsOnFireNow ){
}

function onPlayerCrouchChange( player, IsCrouchingNow ){
}

function onPlayerGameKeysChange( player, oldKeys, newKeys ){
}

function onPlayerUpdate( player, update ){
}

function onClientScriptData( player ){
}

// ========================================== V E H I C L E   E V E N T S =============================================

function onPlayerEnteringVehicle( player, vehicle, door ){
	return 1;
}

function onPlayerEnterVehicle( player, vehicle, door ){
}

function onPlayerExitVehicle( player, vehicle ){
}

function onVehicleExplode( vehicle ){
}

function onVehicleRespawn( vehicle ){
}

function onVehicleHealthChange( vehicle, oldHP, newHP ){
}

function onVehicleMove( vehicle, lastX, lastY, lastZ, newX, newY, newZ ){
}

// =========================================== P I C K U P   E V E N T S ==============================================

function onPickupClaimPicked( player, pickup ){
	return 1;
}

function onPickupPickedUp( player, pickup ){
}

function onPickupRespawn( pickup ){
}

// ========================================== O B J E C T   E V E N T S ==============================================

function onObjectShot( object, player, weapon ){
}

function onObjectBump( object, player ){
}

// ====================================== C H E C K P O I N T   E V E N T S ==========================================

function onCheckpointEntered( player, checkpoint ){
}

function onCheckpointExited( player, checkpoint ){
}

// =========================================== B I N D   E V E N T S =================================================

function onKeyDown( player, key ){
}

function onKeyUp( player, key ){
}

// ================================== E N D   OF   O F F I C I A L   E V E N T S ======================================
function GetTok( string, separator, n, ... ){
 local m = ( vargv.len() > 0 ) ? vargv[ 0 ] : n, tokenized = split( string, separator ), text = "";
 if ( ( n > tokenized.len() ) || ( n < 1 ) ) return null;
 for ( ; n <= m; n++ ){
	 text += text == "" ? tokenized[ n - 1 ] : separator + tokenized[ n - 1 ];
 }
 return text;
}

function NumTok(string, separator){
	local tokenized = split(string, separator);
	return tokenized.len();
}
function onAddCommand(...){
	local cmd = null;
	if(!vargv[2])cmd =  cmdController.add(vargv[0], vargv[1], "");
	else if(vargv[2]) cmd = cmdController.add(vargv[0], vargv[1], vargv[2]);
	else print("...ERROR... YOU MUST ADD COMMAND NAME AND LEVEL, IF U WANT SECURE CODE ADD THIS TOO...");
	print(cmd);
}
function onConsoleInput(cmd, text)
{
	if ( cmd == "reload" ){
	onScriptReload();
	}
	
}
function msg(id,player){
	switch(id){
		case 1: 
			MessagePlayer(show.info   + cmd_exists, player);
		break;
		case 1.1:
			MessagePlayer(show.info   + cmd_low, player);
		break;
		case 1.2:
			MessagePlayer(show.info   + cmd_secure, player);
		break;
   
	}
} 
