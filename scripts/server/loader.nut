::print("Load Blades");	
	::dofile( "scripts/server/translation.nut" );
::print("Load Models");	
	::dofile( "scripts/server/.Models/serverModel.nut" );
	::dofile( "scripts/server/.Models/.playerModel.nut" );
	::dofile( "scripts/server/.Models/.cmdModel.nut" );
	::dofile( "scripts/server/.Models/dbModel.nut" );
::print("Load Controllers");
	::dofile( "scripts/server/.Controllers/serverController.nut" );
	::dofile( "scripts/server/.Controllers/.playerStaticController.nut" );
	//::dofile( "scripts/server/.Controllers/.baseController.nut" );
	::dofile( "scripts/server/.Controllers/.cmdController.nut" );
	
::print("--->ALL SCRIPTS LOADED<---");
::print("[SERVER IS READY TO PLAY]");



	
