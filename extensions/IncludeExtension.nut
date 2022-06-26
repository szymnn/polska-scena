

::print("Load server Kernel");
::dofile( "extensions/app/Kernel/setServer.nut" );
::dofile( "extensions/app/Kernel/serverController.nut" );

::print("Load database Kernel");
::dofile( "extensions/app/Kernel/DataBase/Interface/db.interface.nut" );
::dofile( "extensions/app/Kernel/DataBase/dbConfig.nut" );
::dofile( "extensions/app/Kernel/DataBase/dbDriver.nut" );
::dofile( "extensions/app/Kernel/DataBase/dbModel.nut" );
::dofile( "extensions/app/Kernel/DataBase/dbTypes.nut" );
::dofile( "extensions/app/Kernel/DataBase/mysqlDriver.nut" );
::dofile( "extensions/app/Kernel/DataBase/sqlDriver.nut" );
::dofile( "extensions/app/Kernel/DataBase/Controller/dbController.nut" );
::dofile( "extensions/app/Kernel/commands.nut" );

//AUTOLOAD
::dofile("extensions/app/Autoload/Autoload.nut");

//::print("Load Interfaces");
//::dofile( "extensions/app/Interfaces/player.interface.nut" );
//::dofile( "extensions/app/Interfaces/vehicle.interface.nut" );
//
//
//::print("Load Models");
//::dofile( "extensions/app/Models/playerModel.nut" );
//::dofile( "extensions/app/Models/vehicleModel.nut" );

//
//::print("Load Controllers");
//::dofile( "extensions/app/Controllers/playerStaticController.nut" );
//::dofile( "extensions/app/Controllers/vehicleController.nut" );
//
//::print("Load Services");


::print("Load main blade ~/scripts/main.nut~");
::dofile("scripts/main.nut");

