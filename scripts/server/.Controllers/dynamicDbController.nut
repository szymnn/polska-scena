
class dynamicDbController{
    where = null;
    value = null;

    constructor(...){
        if(vargv[0]) where  = vargv[0];
        else if(vargv[1]) value  = vargv[1];
        print(vargv[0] + " " + vargv[1]);
    }
    function find() {
        this.where;
        this.value; 
        return(this.where,this.value);
        
    }
    

}

class abstractController extends dynamicDbController{
    select= null;
    from  = null;

    constructor(...){
        if(vargv[0]) select = vargv[0];
        else if(vargv[1]) from   = vargv[1];
    }
    function where() {
        this.select;
        this.value;
        if(find()!=null)select(this.select,this.from,this.where,this.value);
    }
}