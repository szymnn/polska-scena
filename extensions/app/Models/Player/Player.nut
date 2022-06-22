class Player extends playerModel{
    static function test(p){
        local plModel = playerModel();
        this.player = p;
        this.Lang = 1;
        local q = find(p.Name,"nick","users");
        if(!q){
            this.Register = false;
        }else{
            if(p.UniqueID  	== ::GetSQLColumnData( q, 3 ) ){
                this.Login 	    = true;
                this.Register	= true;	
                this.Level 		= ::GetSQLColumnData( q, 5 ).tointeger();
                this.Kills 		= ::GetSQLColumnData( q, 6 ).tointeger();
                this.Dead 		= ::GetSQLColumnData( q, 7 ).tointeger();
                this.Bank 		= ::GetSQLColumnData( q, 10).tointeger();
                this.Mute 		= ::GetSQLColumnData( q, 11).tointeger();
                this.Nogoto  	= ::GetSQLColumnData( q, 12).tointeger();
                this.Jail 		= ::GetSQLColumnData( q, 13).tointeger();
                p.Cash 		    = ::GetSQLColumnData( q, 9 ).tointeger();
                p.Skin 		    = ::GetSQLColumnData( q, 14).tointeger();
                this.Lang       = 1;
                this.Fuel 		= 0;
                this.Spree 		= 0;
			}else this.Register = true;
		}
        this.player = p;
        return plModel;
    }
}