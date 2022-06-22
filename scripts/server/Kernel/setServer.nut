/**
*DEFAULT SERVER VIRABLES YOU CAN ADD OWN VIRABLE
*PLEASE DON'T TOUCH STANDARD VARIABLES
*
*@SERVER VIRABLES
*/

string      <-null;
booleans    <-null;
float       <-null;
timestamp   <-null;
integer     <-null;
nullable    <-null;
unique      <-null;
defaul      <-null;
cache       <-array(200,null);
Vehcache    <-array( 10000, null );
Propcache   <-array( 999, null );
dbManager   <-null;


/**
*LOADING REQUIRED IMPLEMENTATION SCRIPTS
*
*@LOADING DATABASE MODELS
*/

::dofile( "scripts/server/interfaces/db.interface.nut" );
::dofile( "scripts/server/.Models/DataBase/dbDriver.nut" );
::dofile( "scripts/server/.Models/DataBase/mysqlDriver.nut" );
::dofile( "scripts/server/.Models/DataBase/sqlDriver.nut" );
::dofile( "scripts/server/.Models/DataBase/dbTypes.nut" );
::dofile( "scripts/server/.Models/DataBase/dbModel.nut" );

/**
*@LOADING SERVER MODELS
*/

::dofile( "scripts/server/.Models/Server/serverModel.nut" );

/**
*@LOADING PLAYER FUNC MODELS
*/

::dofile( "scripts/server/.Models/.cmdModel.nut" );
//player interface
::dofile( "scripts/server/interfaces/player.interface.nut" );
//model
::dofile( "scripts/server/.Models/Player/playerModel.nut" );
//::dofile( "scripts/server/.Models/Player/.playerModel.nut" );
//::dofile( "scripts/server/.Models/Player/Player.nut" );

/**
*@LOADING SERVER CONTROLLERS
*/

::dofile( "scripts/server/.Controllers/dbController.nut" );
::dofile( "scripts/server/.Controllers/.playerStaticController.nut" );

/**
*@LOADING PLAYER CONTROLLERS
*/

::dofile( "scripts/server/.Controllers/.cmdController.nut" );

::print("--->ALL SCRIPTS LOADED<---");
::print("[SERVER IS READY TO PLAY]");