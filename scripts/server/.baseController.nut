class sql{
	table = ""; row=""; where=""; like="";
	constructor(db_table,db_row,db_where,db_like){
		if(db_like) 	  like = "'%"+db_like+"%'";
		else if(row !="") row  = db_row;
		else{
			row 	= "*";
			like 	= "";
		}
		table 	= db_table;
		where	= db_where;
	}
	function select(){
		if(where=="")local q = QuerySQL(db,"SELECT "+row+" FROM "+table);
		else{
			if(like!="") local q = QuerySQL(db,"SELECT "+row+" FROM "+table+" WHERE "+where+" LIKE "+like+"");
			else 		 local q = QuerySQL(db,"SELECT "+row+" FROM "+table+" WHERE "+where);
		}
		
	}
}
