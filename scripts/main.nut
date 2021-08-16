// 
function onServerStart(){
}

function onServerStop(){
}

function onScriptLoad(){
	db<-ConnectSQL("PS_DB.sqlite");
	QuerySQL( db, "CREATE TABLE users ( nick VARCHAR(32), pass VARCHAR(255), IP VARCHAR(255), UID VARCHAR(255), UID2 VARCHAR(255), level VARCHAR(255), kills VARCHAR(255), dead VARCHAR(255), joins VARCHAR(255), cash VARCHAR(255), bank VARCHAR(255), mute VARCHAR(255), nogoto VARCHAR(255), jail VARCHAR(255), skin VARCHAR(255), gangID VARCHAR(255), autospawn VARCHAR(32) )" );
    QuerySQL( db, "CREATE TABLE IF NOT EXISTS vehicle ( name VARCHAR(32), cost VARCHAR(25), owner TEXT, sowner TEXT, model VARCHAR(32), pos VARCHAR(32), lock VARCHAR(32), fuel VARCHAR(32), tax VARCHAR(32), color1 VARCHAR(32), color2 VARCHAR(32), tune VARCHAR(32)  )" );
	dofile( "scripts/server/.baseController.nut" );
	dofile( "scripts/server/.playerController.nut" );
	dofile( "scripts/server/.adminController.nut" );
	dofile( "scripts/server/.vehicle.nut" );
	Vehicle(1);
}

function onScriptUnload(){
}

// =========================================== P L A Y E R   E V E N T S ==============================================

function onPlayerJoin( player ){
	//if(playerStats(player).Register)MessagePlayer("[#FFFFFF][INFO][#66CC00] Zarejestruj swoje konto",player);
	//else if(playerStats(player).Login)MessagePlayer("[#FFFFFF][INFO][#66CC00] Zaloguj się na swoje konto",player);
	//else MessagePlayer("[#FFFFFF][INFO][#66CC00] Zostales automatycznie zalogowany",player);
	playerStats(player).check();
}

function onPlayerPart( player, reason ){
	playerStats(player).update();
}

function onPlayerRequestClass( player, classID, team, skin ){
	return 1;
}

function onPlayerRequestSpawn( player ){
	if(playerStats(player).Login==true)return 1;
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
	if(cmd == "test")
	{
		CreateCheckpoint(player, 0, false, Vector(405.954, -459.039,10.1126), ARGB(255, 255, 0, 0), 1);
		return 1;
	}
	else if (cmd=="spawn"){
		local veh = FindVehicle( text.tointeger() );
		if(Vehicle(veh).spawn()){
			veh.Pos = Vector( ( player.Pos.x + 2 ), player.Pos.y, ( player.Pos.z + 0.1 ) );
			MessagePlayer("Przywolano auto o id "+ veh, player);
		}else MessagePlayer("Operacaja nie dozwolona.", player);
	}
	else if (cmd == "login" || cmd =="register" || cmd =="reg") {
		if(text)playerStats(player).auth(text);
		else MessagePlayer("Podaj haslo",player);
	}
	else if (cmd =="spas"){
		if(text){
			playerStats(player).edit("password",text);
		}else MessagePlayer("podaj nowe haslo",player);
	}
	else if (cmd =="smon"){
		if(text){
			local target = GetTok( text, " ", 1); 
			local value  = GetTok( text, " ", 2, NumTok( text, " " ) );
			if(target ){
				if(value){
					target = FindPlayer(target);
					admin(player,target).edit("money",value);
				}
			}
			
		}else MessagePlayer("podaj nowe haslo",player);
	}
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
function GetTok(string, separator, n, ...)
{
	local m = vargv.len() > 0 ? vargv[0] : n,
		  tokenized = split(string, separator),
		  text = "";
	
	if (n > tokenized.len() || n < 1) return null;
	for (; n <= m; n++)
	{
		text += text == "" ? tokenized[n-1] : separator + tokenized[n-1];
	}
	return text;
}

function NumTok(string, separator)
{
	local tokenized = split(string, separator);
	return tokenized.len();
}