/*****************DATA TYPES*************************/
string=function(column) {
    column = "" + column + " VARCHAR(255) NOT NULL";
    debug("db","RETURNED:",column);
    return column;
}
integer=function(column) {
    column = "" + column + " INT(255) NOT NULL";
    debug("db","RETURNED:",column);
    return column;
}
timestamp=function(column) {
    column = "" + column + " TIMESTAMP NOT NULL";
    debug("db","RETURNED:",column);
    return column;
}
booleans=function(column) {
    column = "" + column + " BOOLEAN NOT NULL";
    debug("db","RETURNED:",column);
    return column;
}
float =function(column) {
    column = "" + column + " FLOAT(255) NOT NULL";
    debug("db","RETURNED:",column);
    return column;
}
/*****************NULLABLES******************/
nullable<-{
    string=function(column) {
        column = "" + column + " VARCHAR(255)";
        debug("db","RETURNED:",column);
        return column;
    }
    integer=function(column) {
        column = "" + column + " INT(255)";
        debug("db","RETURNED:",column);
        return column;
    }
    timestamp=function(column) {
        column = "" + column + " TIMESTAMP";
        debug("db","RETURNED:",column);
        return column;
    }
    booleans=function(column) {
        column = "" + column + " BOOLEAN";
        debug("db","RETURNED:",column);
        return column;
    }
    float =function(column) {
        column = "" + column + " FLOAT(255)";
        debug("db","RETURNED:",column);
        return column;
    }
    unique ={
        string=function(column) {
            column = "" + column + " VARCHAR(255) UNIQUE";
            debug("db","RETURNED:",column);
            return column;
        }
        integer=function(column) {
            column = "" + column + " INT(255) UNIQUE";
            debug("db","RETURNED:",column);
            return column;
        }
        timestamp=function(column) {
            column = "" + column + "TIMESTAMP UNIQUE";
            debug("db","RETURNED:",column);
            return column;
        }
        booleans=function(column) {
            column = "" + column + " BOOLEAN UNIQUE";
            debug("db","RETURNED:",column);
            return column;
        }
        float =function(column) {
            column = "" + column + " FLOAT(255) UNIQUE";
            debug("db","RETURNED:",column);
            return column;
        }
    }
    /************DEFAULT*************/
    defaul = {
        string=function(column, value) {
            column = "" + column + " VARCHAR(255) DEFAULT '"+value+"'";
            debug("db","RETURNED:",column);
            return column;
        }
        integer=function(column, value) {
            column = "" + column + " INT(255) DEFAULT "+value+"";
            debug("db","RETURNED:",column);
            return column;
        }
        timestamp=function(column, value) {
            column = "" + column + "TIMESTAMP DEFAULT '"+value+"'";
            debug("db","RETURNED:",column);
            return column;
        }
        booleans=function(column, value) {
            column = "" + column + " BOOLEAN DEFAULT "+value+"";
            debug("db","RETURNED:",column);
            return column;
        }
        float =function(column, value) {
            column = "" + column + " FLOAT(255) DEFAULT "+value+"";
            debug("db","RETURNED:",column);
            return column;
        }
    }

}
/*************UNIQUE**************/
unique <-{
    string=function(column) {
        column = "" + column + " VARCHAR(255) NOT NULL UNIQUE";
        debug("db","RETURNED:",column);
        return column;
    }
    integer=function(column) {
        column = "" + column + " INT(255) NOT NULL UNIQUE";
        debug("db","RETURNED:",column);
        return column;
    }
    timestamp=function(column) {
        column = "" + column + "TIMESTAMP NOT NULL UNIQUE";
        debug("db","RETURNED:",column);
        return column;
    }
    booleans=function(column) {
        column = "" + column + " BOOLEAN NOT NULL UNIQUE";
        debug("db","RETURNED:",column);
        return column;
    }
    float =function(column) {
        column = "" + column + " FLOAT(255) NOT NULL UNIQUE";
        debug("db","RETURNED:",column);
        return column;
    }
}
/************DEFAULT*************/
defaul <- {
    string=function(column, value) {
        column = "" + column + " VARCHAR(255) NOT NULL DEFAULT '"+value+"'";
        debug("db","RETURNED:",column);
        return column;
    }
    integer=function(column, value) {
        column = "" + column + " INT(255) NOT NULL DEFAULT "+value+"";
        debug("db","RETURNED:",column);
        return column;
    }
    timestamp=function(column, value) {
        column = "" + column + "TIMESTAMP NOT NULL DEFAULT '"+value+"'";
        debug("db","RETURNED:",column);
        return column;
    }
    booleans=function(column, value) {
        column = "" + column + " BOOLEAN NOT NULL DEFAULT "+value+"";
        debug("db","RETURNED:",column);
        return column;
    }
    float =function(column, value) {
        column = "" + column + " FLOAT(255) NOT NULL DEFAULT "+value+"";
        debug("db","RETURNED:",column);
        return column;
    }
}
