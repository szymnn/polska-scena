class cmdController {
    static function can(p,cmd){
        local canModel = cmdModel();
        local q= ::QuerySQL(db, "SELECT * FROM cmds WHERE cmd='"+cmd+"'");
		if(q){
            canModel.need  = ::GetSQLColumnData(q,1).tointeger();
            if(::GetSQLColumnData(q,2))canModel.secure = ::GetSQLColumnData(q,2);
            else canModel.secure = null;
            if(cache[p.ID].Level>=canModel.need)canModel.can = true;
            else canModel.can = false;
        }
        else canModel.can = false;
        return canModel;
    }
    static function add(cmd, lvl, secure){
        if(cmd){
            if(secure) QuerySQL(db,"INSERT INTO cmds( cmd, lvl, secure) values('"+cmd+"','"+lvl+"','"+secure+"')");
            else QuerySQL(db,"INSERT INTO cmds( cmd, lvl, secure) values('"+cmd+"','"+lvl+"','')");
            return show.succes + " command added succesfully";
        }return show.sytnax + " must add command name ";
    }
    static function useCommand(use,...){
        if(use.can){
            if(use.secure){
                Announce("Press T and type secure code...",vargv[0]);
            }
        }
    }
}