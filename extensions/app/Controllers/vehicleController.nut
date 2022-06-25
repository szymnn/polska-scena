class vehicleController extends vehicleModel{
    constructor(){
        base.constructor();
        this.table = base.table;
    }

    static function loadVehicleStatistic(){
        local q = dbManager.findall(this.table);
        if(q && mysql_num_rows( q )>0 || q && GetSQLColumnCount( q )>0){
            switch(dbManager.type ){
                case "sql":
                    while ( GetSQLColumnData( q, 0 ) )
                    {
                        pos 	= split( GetSQLColumnData( q, 5 ), ", " );
                        m	= GetSQLColumnData( q, 4 ).tointeger();
                        col	= GetSQLColumnData( q, 9 ).tointeger();
                        cold	= GetSQLColumnData( q, 10 ).tointeger();
                        x	= pos[ 0 ].tofloat();
                        y	= pos[ 1 ].tofloat();
                        z	= pos[ 2 ].tofloat();
                        angle	= pos[ 5 ].tofloat();
                        CreateVehicle( m, Vector( x, y, z ), angle, col, cold );	
                        GetSQLNextRow( q );	
                    }
                        local
                            vehCount = GetVehicleCount();
                    print( "-->Zaladowano " + vehCount + " modeli pojazdow." );
                    vehCount = null;
                    FreeSQLQuery( q );
                break;
                case "mysql":
                    while ( GetSQLColumnData( q, 0 ) )
                    {
                        pos 	= split( GetSQLColumnData( q, 5 ), ", " );
                        m	= GetSQLColumnData( q, 4 ).tointeger();
                        col	= GetSQLColumnData( q, 9 ).tointeger();
                        cold	= GetSQLColumnData( q, 10 ).tointeger();
                        x	= pos[ 0 ].tofloat();
                        y	= pos[ 1 ].tofloat();
                        z	= pos[ 2 ].tofloat();
                        angle	= pos[ 5 ].tofloat();
                        CreateVehicle( m, Vector( x, y, z ), angle, col, cold );
                        GetSQLNextRow( q );
                    }
                    local
                    vehCount = GetVehicleCount();
                    print( "-->Zaladowano " + vehCount + " modeli pojazdow." );
                    vehCount = null;
                    FreeSQLQuery( q );
                break;
            }

        }
    }

    static function savePostion(p,v){
        local p = FindPlayer(player.ID);
        cache[p.ID] = playerModel();
        cache[v.ID] = vehicleModel();
        //------------------------//
        local gamer = cache[p.ID];
        local car   = Vehcache[v.ID];
        if(p.Vehicle){
            car.setSpawnAngle(player.Vehicle.EulerAngle.x + ", " +  player.Vehicle.EulerAngle.y + ", " +  player.Vehicle.EulerAngle.z);
            car.setSpawnPos(player.Pos.x + ", " +  player.Vehicle.Pos.y + ", " +  player.Vehicle.Pos.z);
            car.save();
        }
    }
}