find        <-null;
from        <-null;
string      <-null;
booleans    <-null;
float       <-null;
timestamp   <-null;
integer     <-null;
nullable    <-null;
unique      <-null;
defaul      <-null;
findall     <-null;
migration   <-null;




class dbController extends dbModel{
    static function migrate(tab = null, columns=[]) {
        foreach(a,column in columns){
            if(a+1==columns.len()) this.columns += column + "";
            else this.columns += column + ", ";
        }
        this.table = tab;
        debug("MIGRATION RESULT:",this.type,this.table,this.command);
        base.create();
    }
    static function create2(table=null,columns=[],values=[], atributes=[]) {
        local polecenie = "";
        foreach(a,column in columns){
               foreach(b,value in values){
                    if(a+1<columns.len()){
                       if(a==b)polecenie+= column + " " +value + ", ";
                    }if(a+1==columns.len()){
                       if(a==b)polecenie+= column + " " +value + "";
                    }
               }
           }
        if(atributes.len()>=0){
            foreach (atribute in atributes){
                polecenie += atribute;
            }
        }
        if(DEBUG)print("**CREATE** "+polecenie);
        switch(db.type){
            case "sql":
                ::QuerySQL(db.connect,"CREATE TABLE IF NOT EXISTS " + table + "("+polecenie+")");
            break;
            case "mysql":
                ::mysql_query(db.connect,"CREATE TABLE IF NOT EXISTS " + table + "("+polecenie+")");
            break;
        }
         
    }
    static function create() {
        
    }
    static function insert(table=null,columns=[],values=[]) {
        local polecenie = "";
        local wartosci  = "";
        foreach(a,column in columns){
            foreach(b,value in values){
                if(a+1<columns.len()){
                   if(a==b){
                       polecenie+= column + ", ";
                       wartosci+= "'" +value + "', ";
                   }
                }if(b+1==columns.len()){
                       if(a==b)wartosci+= "'" +value + "'";
                    }
                if(a+1==columns.len()){
                    if(a==b)polecenie+= "'"+column + "'";
                }
               }
           }
        if(DEBUG)print("**INSERT** "+polecenie + " " + wartosci);
        switch(db.type){
            case "sql":
                ::QuerySQL(db.connect,"INSERT OR REPLACE INTO " + table + "("+polecenie+") values("+wartosci+")");
            break;
            case "mysql":
                ::mysql_query(db.connect,"INSERT OR REPLACE INTO " + table + "("+polecenie+") values("+wartosci+")");
            break;
        }
         
    }
    static function select(columns=[],table=null,index=null,value=null,additionals=null,index2=null,value2=null) {
        local polecenie = "";
        if(DEBUG)print("**SELECT** NUMBER OF COLUMNS: "+columns.len() + " ");
        if(columns.len()>0 ){
            foreach(a,column in columns){
                if(a+1<columns.len()){
                    polecenie+= column + ", ";
                }if(a+1==columns.len()){
                    polecenie+= column;
                }
            }
        }else polecenie = "*";
        
        if(DEBUG)print("**SELECT** FIND COLUMNS: '"+polecenie + "' ");
        switch(db.type){
            case "sql":
                if(polecenie!="" && table!=null ){
                    if(index!=null && value!=null && additionals==null){
                        if(DEBUG)print("**SELECT** '"+polecenie + "' FROM "+ table + " WHERE " + index + " = '"+value+"'");
                        return ::QuerySQL(db.connect,"SELECT "+polecenie+" FROM " + table + " WHERE " + index + " = '"+value+"'");
                    }
                    else if(index!=null && value!=null && additionals!=null){
                        switch(additionals){
                            case "like":
                                if(DEBUG)print("**SELECT** '"+polecenie + "' FROM " +table + " WHERE " + index + " LIKE '%"+value+"%'");
                                return ::QuerySQL(db.connect,"SELECT "+polecenie+" FROM " + table + " WHERE " + index + " LIKE '%"+value+"%'");
                            break;
                            case "OR":
                                if(index2!=null && value2!=null){
                                    if(DEBUG)print("**SELECT** '"+polecenie + "' FROM " + table + " WHERE " + index + " = '"+value+"' OR "+ index2 +" = '" + value2 + "'" );
                                    return ::QuerySQL(db.connect,"SELECT "+polecenie+" FROM " + table + " WHERE " + index + " = '"+value+"' OR "+ index2 +" = '" + value2 + "'" );
                                }
                                else print("**~BAD SELECT SYTNAX~** IF YOU WAN'T USE 'OR' YOU MUST ADD ADDITIONAL PARAMETERS <WHERE> <VALUE_WHERE> - LIKE USAGE DOSN'T WORK");
                                
                            break;
                            case "AND":
                                if(index2!=null && value2!=null){
                                    if(DEBUG)print("**SELECT** '"+polecenie + "' FROM " + table + " WHERE " + index + " = '"+value+"' AND "+ index2 +" = '" + value2 + "'" );
                                    return ::QuerySQL(db.connect,"SELECT "+polecenie+" FROM " + table + " WHERE " + index + " = '"+value+"' AND "+ index2 +" = '" + value2 + "'" ); 
                                }
                                else print("**~BAD SELECT SYTNAX~** IF YOU WAN'T USE 'AND' YOU MUST ADD ADDITIONAL PARAMETERS <WHERE> <VALUE_WHERE> - LIKE USAGE DOSN'T WORK");
                            break;
                            
                        }
                    }else {
                        if(DEBUG)print("**SELECT** '"+polecenie + "' FROM " + table  );
                        return ::QuerySQL(db.connect,"SELECT "+polecenie+" FROM " + table + " "); 
                    }
                }else print("**~BAD SELECT SYTNAX~** IF YOU WAN'T USE 'SELECT' YOU MUST ADD DEFAULT PARAMETERS <COLUMNS> <TABLE> IF YOU WAN'T U CAN USE <WHERE> <VALUE> <ADDITIONAL PARAMETER /LIKE/OR/AND/>");
            break;
            case "mysql":
            if(polecenie!="" && table!=null ){
                if(index!=null && value!=null && additionals==null){
                    if(DEBUG)print("**SELECT** '"+polecenie + "' FROM "+ table + " WHERE " + index + " = '"+value+"'");
                    return ::mysql_query(db.connect,"SELECT "+polecenie+" FROM " + table + " WHERE " + index + " = '"+value+"'");
                }
                else if(index!=null && value!=null && additionals!=null){
                    switch(additionals){
                        case "like":
                            if(DEBUG)print("**SELECT** '"+polecenie + "' FROM " +table + " WHERE " + index + " LIKE '%"+value+"%'");
                            return ::mysql_query(db.connect,"SELECT "+polecenie+" FROM " + table + " WHERE " + index + " LIKE '%"+value+"%'");
                        break;
                        case "OR":
                            if(index2!=null && value2!=null){
                                if(DEBUG)print("**SELECT** '"+polecenie + "' FROM " + table + " WHERE " + index + " = '"+value+"' OR "+ index2 +" = '" + value2 + "'" );
                                return ::mysql_query(db.connect,"SELECT "+polecenie+" FROM " + table + " WHERE " + index + " = '"+value+"' OR "+ index2 +" = '" + value2 + "'" );
                            }
                            else print("**~BAD SELECT SYTNAX~** IF YOU WAN'T USE 'OR' YOU MUST ADD ADDITIONAL PARAMETERS <WHERE> <VALUE_WHERE> - LIKE USAGE DOSN'T WORK");
                            
                        break;
                        case "AND":
                            if(index2!=null && value2!=null){
                                if(DEBUG)print("**SELECT** '"+polecenie + "' FROM " + table + " WHERE " + index + " = '"+value+"' AND "+ index2 +" = '" + value2 + "'" );
                                return ::mysql_query(db.connect,"SELECT "+polecenie+" FROM " + table + " WHERE " + index + " = '"+value+"' AND "+ index2 +" = '" + value2 + "'" ); 
                            }
                            else print("**~BAD SELECT SYTNAX~** IF YOU WAN'T USE 'AND' YOU MUST ADD ADDITIONAL PARAMETERS <WHERE> <VALUE_WHERE> - LIKE USAGE DOSN'T WORK");
                        break;
                    }
                }else {
                    if(DEBUG)print("**SELECT** '"+polecenie + "' FROM " + table  );
                    return ::mysql_query(db.connect,"SELECT "+polecenie+" FROM " + table + " "); 
                }
            }else print("**~BAD SELECT SYTNAX~** IF YOU WAN'T USE 'SELECT' YOU MUST ADD DEFAULT PARAMETERS <COLUMNS> <TABLE> IF YOU WAN'T U CAN USE <WHERE> <VALUE> <ADDITIONAL PARAMETER /LIKE/OR/AND/>");
        break;
        }
         
    }
    
}

/*****************DATA TYPES*************************/
string=function(column) {
    column = "" + column + " VARCHAR(255) NOT NULL ";
    if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
    return column;
}
integer=function(column) {
    column = "" + column + " INT(255) NOT NULL ";
    if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
    return column;
}
timestamp=function(column) {
    column = "" + column + " TIMESTAMP NOT NULL ";
    if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
    return column;
}
booleans=function(column) {
    column = "" + column + " BOOL NOT NULL ";
    if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
    return column;
}
float =function(column) {
    column = "" + column + " FLOAT(255) NOT NULL ";
    if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
    return column;
}
/*****************NULLABLES******************/
nullable<-{
    string=function(column) {
        column = "" + column + " VARCHAR(255) ";
        if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
        return column;
    }
    integer=function(column) {
        column = "" + column + " INT(255) ";
        if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
        return column;
    }
    timestamp=function(column) {
        column = "" + column + " TIMESTAMP ";
        if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
        return column;
    }
    booleans=function(column) {
        column = "" + column + " BOOL ";
        if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
        return column;
    }
    float =function(column) {
        column = "" + column + " FLOAT(255) ";
        if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
        return column;
    }
    unique ={
        string=function(column) {
            column = "" + column + " VARCHAR(255) UNIQUE";
            if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
            return column;
        }
        integer=function(column) {
            column = "" + column + " INT(255) UNIQUE";
            if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
            return column;
        }
        timestamp=function(column) {
            column = "" + column + "TIMESTAMP UNIQUE";
            if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
            return column;
        }
        booleans=function(column) {
            column = "" + column + " BOOL UNIQUE";
            if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
            return column;
        }
        float =function(column) {
            column = "" + column + " FLOAT(255) UNIQUE";
            if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
            return column;
        }
    }
    /************DEFAULT*************/
    defaul = {
        string=function(column, value) {
            column = "" + column + " VARCHAR(255) DEFAULT '"+value+"'";
            if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
            return column;
        }
        integer=function(column, value) {
            column = "" + column + " INT(255) DEFAULT '"+value+"'";
            if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
            return column;
        }
        timestamp=function(column, value) {
            column = "" + column + "TIMESTAMP DEFAULT '"+value+"'";
            if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
            return column;
        }
        booleans=function(column, value) {
            column = "" + column + " BOOL DEFAULT '"+value+"'";
            if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
            return column;
        }
        float =function(column, value) {
            column = "" + column + " FLOAT(255) DEFAULT '"+value+"'";
            if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
            return column;
        }
    }
    
}
/*************UNIQUE**************/
unique <-{
    string=function(column) {
        column = "" + column + " VARCHAR(255) NOT NULL UNIQUE";
        if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
        return column;
    }
    integer=function(column) {
        column = "" + column + " INT(255) NOT NULL UNIQUE";
        if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
        return column;
    }
    timestamp=function(column) {
        column = "" + column + "TIMESTAMP NOT NULL UNIQUE";
        if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
        return column;
    }
    booleans=function(column) {
        column = "" + column + " BOOL NOT NULL UNIQUE";
        if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
        return column;
    }
    float =function(column) {
        column = "" + column + " FLOAT(255) NOT NULL UNIQUE";
        if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
        return column;
    }
}
/************DEFAULT*************/
defaul <- {
    string=function(column, value) {
        column = "" + column + " VARCHAR(255) NOT NULL DEFAULT '"+value+"'";
        if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
        return column;
    }
    integer=function(column, value) {
        column = "" + column + " INT(255) NOT NULL DEFAULT '"+value+"'";
        if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
        return column;
    }
    timestamp=function(column, value) {
        column = "" + column + "TIMESTAMP NOT NULL DEFAULT '"+value+"'";
        if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
        return column;
    }
    booleans=function(column, value) {
        column = "" + column + " BOOL NOT NULL DEFAULT '"+value+"'";
        if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
        return column;
    }
    float =function(column, value) {
        column = "" + column + " FLOAT(255) NOT NULL DEFAULT '"+value+"'";
        if(DEBUG)var.dump("***~~DATABASE~~*** RETURNED:",column);
        return column;
    }
}
    










dbManager <- dbController();

