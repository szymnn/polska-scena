function onScriptLoad(){
    ::print("included framework commands");
}
function onConsoleInput( cmd, text )
{
    try{
        switch(cmd){
            case "vcmp:migrations:migrate":
                local a = 0, table, column, types, def;
                if(text){
                   while(text != "" || text!="done" ){
                       ::system("cls");
                       if(a==0){
                           ::print("Input table name");
                           table = text;
                           text = null;
                           a++;
                       }
                       if(a==1){
                           ::print("column name");
                           column = text;
                           text = null;
                           a++;
                       }
                       if(a==2){
                           ::print("types like: string / integer / boolean");
                           types = text;
                           text = null;
                           ::print("Default? - default `n` if you wanna give a default vaule type y");
                           if(text=="y"){
                               types = types+".defaul";
                               text = null;
                               ::print("put default value: ");
                               if(text){
                                   def = text.tointeger();
                                   text=null;
                               }else{
                                   ::print("default value is set to 255");
                                   def = 255;
                                   text=null;
                               }
                           }
                           ::print("Nullable? - default `n` if you wanna give a default vaule type y");
                           if(text=="y"){
                               types = types+".nullable";
                               text = null;
                           }
                           a=1;
                       }

                   }
                }else ::print("avilable commands: create, migrate");
        }
    }
    catch(e) print( "OnConsoleCommand Error: " + e );
}
function createMigrationsConsoleInput(){

}