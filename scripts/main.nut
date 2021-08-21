player <- null;
// stats <- array( 100 , null );
function onServerStart(){
	
}

cache <-array(200,null);

/*
create_actor( ... )
set_actor_angle( ... )
kill_actor(...)
spawn_actor(...)
set_port("..")
PlayFile("filename",actorid)
GetPlayerIDActor( actorid )
IsActor( int playerid )
GetActorID( int playerid )
correct_actor_pos
set_actor_health( int actorid, int newhealth )
onPlayingCompleted( recordedFileName, actor id )
*/



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
	SetSpawnPlayerPos(-924.16, 1057.98, 15.6029);
	SetSpawnCameraPos( -925.6366, 1039.8380, 13.0848 );
	SetSpawnCameraLook( -925.1487, 1048.4241, 13.2005 );  
	db<-ConnectSQL("PS_DB.sqlite");
	QuerySQL( db, "CREATE TABLE users ( nick VARCHAR(32), pass VARCHAR(255), IP VARCHAR(255), UID VARCHAR(255), UID2 VARCHAR(255), level VARCHAR(255), kills VARCHAR(255), dead VARCHAR(255), joins VARCHAR(255), cash VARCHAR(255), bank VARCHAR(255), mute VARCHAR(255), nogoto VARCHAR(255), jail VARCHAR(255), skin VARCHAR(255), gangID VARCHAR(255), autospawn VARCHAR(32) )" );
    QuerySQL( db, "CREATE TABLE IF NOT EXISTS vehicle ( name VARCHAR(32), cost VARCHAR(25), owner TEXT, sowner TEXT, model VARCHAR(32), pos VARCHAR(32), lock VARCHAR(32), fuel VARCHAR(32), tax VARCHAR(32), color1 VARCHAR(32), color2 VARCHAR(32), tune VARCHAR(32)  )" );
	QuerySQL(db,"CREATE IF NOT EXISTS scenes( id int, start_pos varchar(255), stop_pos varchar(255), cam_pos VARCHAR(255), angle_cam varchar(255) time varchar(255), enter_pos varchar(255), exit_pos varchar(255), sound varchar(255))");
}

function onScriptUnload(){

}

// =========================================== P L A Y E R   E V E N T S ==============================================

function onPlayerJoin( player ){

	local temp = PlayerStaticController.downloadStats(player);
	cache[player.ID] = temp;
	::print(cache[player.ID].player.Cash);
	::print(cache[player.ID].player.IP);
	PlayerStaticController.check(player,"login");

	/*if(!cache[player.ID].Login) ::MessagePlayer( show.info(cache[player.ID].Lang) + show.must_login(cache[player.ID].Lang) ,player);
    else if(!cache[player.ID].Register)::MessagePlayer(show.info(cache[player.ID].Lang)+ show.must_register(cache[player.ID].Lang) ,player);
    else ::MessagePlayer( show.succes[cache[player.ID].Lang]+ show.auto_login[cache[player.ID].Lang],player);
	*/

}



function onPlayerPart( player, reason ){
	print(player.ID);

	//playerStats().update();
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
	else if(cmd == "t")
	{
		local x = 390.21;
		create_actor( "lance", 5, 405.954, -459.039, 10.1126, 1.5 ); 
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
		if(text)playerStats(player).auth("lr",text);
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
					MessagePlayer(admin(player,target).edit("money",value),player);

				}
			}
			
		}else MessagePlayer("skladnia: <gracz> <wartosc>",player);
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
function onConsoleInput(cmd, text)
{
	if ( cmd == "reload" ){
	ReloadScripts();
	}
	
}