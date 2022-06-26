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

::system("cd /home/vcmp/extensions/app/Kernel/Database/Scripts && ./Begin.sh");
::system("cd /home/vcmp/extensions/app/Kernel/Database/Scripts && ./AutoloadGenerate.sh");



///**
//*LOADING REQUIRED IMPLEMENTATION SCRIPTS
//*
//*@LOADING DATABASE MODELS
//*/
//
//::dofile( "extensions/app/Kernel/DataBase/Interface/db.interface.nut" );
//::dofile( "extensions/app/Kernel/DataBase/dbDriver.nut" );
//::dofile( "extensions/app/Kernel/DataBase/mysqlDriver.nut" );
//::dofile( "extensions/app/Kernel/DataBase/sqlDriver.nut" );
//::dofile( "extensions/app/Kernel/DataBase/dbTypes.nut" );
//::dofile( "extensions/app/Kernel/DataBase/dbModel.nut" );
//
///**
//*@LOADING SERVER MODELS
//*/
//
//::dofile( "extensions/app/Models/Server/serverModel.nut" );
//
///**
//*@LOADING PLAYER FUNC MODELS
//*/
//
//::dofile( "extensions/app/Models/.cmdModel.nut" );
////player Interface
//::dofile( "extensions/app/Interfaces/player.Interface.nut" );
////model
//::dofile( "extensions/app/Models/playerModel.nut" );
////::dofile( "scripts/extensions/Models/Player/.playerModel.nut" );
////::dofile( "scripts/extensions/Models/Player/Player.nut" );
//
///**
//*@LOADING SERVER CONTROLLERS
//*/
//
//::dofile( "extensions/app/Controllers/dbController.nut" );
//::dofile( "extensions/app/Controllers/playerStaticController.nut" );
//
///**
//*@LOADING PLAYER CONTROLLERS
//*/
//
//::dofile( "extensions/app/Controllers/.cmdController.nut" );
//
//::print("--->ALL SCRIPTS LOADED<---");
//::print("[SERVER IS READY TO PLAY]");