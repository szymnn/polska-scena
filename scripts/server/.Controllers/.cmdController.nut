class cmdController {
    static function can(p,cmd){
        local canModel = cmdModel();
        local q= ::QuerySQL(db, "SELECT * FROM cmds WHERE cmd='"+cmd+"'");
		if(q){
            canModel.need  = ::GetSQLColumnData(q,1).tointeger();
            if(::GetSQLColumnData(q,2)!="")canModel.secure = ::GetSQLColumnData(q,2);
            else canModel.secure = "";
            if(cache[p.ID].Level>=canModel.need)canModel.can = true;
            else canModel.can = false;
        }
        else canModel.can = false;
        return canModel;
    }
    static function add(...){
        local cmd=vargv[0], lvl=vargv[1];
        if(vargv[2]!="")local secure=vargv[2];
        if(cmd){
            local q = dbController();
            if(secure) q.insert("cmds", ["cmd", "lvl", "secure"], [cmd,lvl,::base64_encode(secure)]);
            else q.insert("cmds", ["cmd", "lvl"], [cmd,lvl]);
            return show.succes[0] + " command added succesfully";
        }return show.sytnax[0] + " must add command name ";
    }
    static function cmdList(p){
        local lvl = cache[p.ID].Level, cmds= [""], list = [], q= ::QuerySQL(db, "SELECT * FROM cmds ");
            while( ::GetSQLColumnData(q,0) ){
                if(::GetSQLColumnData(q,1).tointeger() <= lvl ){
                    //cmds += ("" + ::GetSQLColumnData(q,0)+ ", ");
                    cmds[lvl] += (::GetSQLColumnData(q,0) + ", ");
                    //list[lvl] = split( cmds[lvl]);
                }
                ::GetSQLNextRow( q );
            }
        return cmds[lvl];
    }
    static function useCommand(use,...){
        if(use.can){
            if(use.secure){
                Announce("Press T and type secure code...",vargv[0]);
            }
        }
    }
}