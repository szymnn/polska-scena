// 
function onServerStart(){
}

function onServerStop(){
}

function onScriptLoad(){
}

function onScriptUnload(){
}

// =========================================== P L A Y E R   E V E N T S ==============================================

function onPlayerJoin( player ){
}

function onPlayerPart( player, reason ){
}

function onPlayerRequestClass( player, classID, team, skin ){
	return 1;
}

function onPlayerRequestSpawn( player ){
	return 1;
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