#!/bin/bash
clear;

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

clear='\033[0m'

count_col=0
name_tab=""
type_col=""
name_col=""
len_col=""
uni_col=""
nul_col=""
def_col=""
next_col=""

model_name=""
interface_name=""

saverModelCols=""
saverModelVals=""

declare -a columns;
declare -a modelMiddle;
declare -a modelGetters;
declare -a modelColumns;
declare -a interfaceColumns;


setMiddleSequenceModel(){
  modelMiddle[$count_col]="
    static function get"${name_col^}"(){
      return this."$name_col";
    }
    static function set"${name_col^}"(val){
      return this."$name_col"=val;
    }"
    modelGetters[$count_col]="this.get"${name_col^}"()"
    modelColumns[$count_col]=$name_col
    model_name=$name_tab"Model.nut";

}
buildModelSaver(){
len=${#modelColumns[@]}
len2=${#modelGetters[@]}

for (( i=1; i<=$len; i++ ));
do
  loc=$(($i+1))
  if [ $i == 1 ];then
    saverModelCols='"'${modelColumns[$i]}'"';
    else
      saverModelCols=$saverModelCols', "'${modelColumns[$i]}'"';

  fi
done

for (( i=1; i<=$len2; i++ ));
do
  loc=$(($i+1))
  if [ $i == 1 ];then
    saverModelVals='"'${modelGetters[$i]}'"';
    else
      saverModelVals=$saverModelVals', "'${modelGetters[$i]}'"';

  fi

done

}

buildModel(){
  buildModelSaver
  cd /home/vcmp/scripts/Server/Model
  start_syntax="class "$name_tab"Model extends "$name_tab"Interface {
  constructor(){
          base.constructor();
      }"
 get_syntax='
 static function get(pid = "", field = "name"){
    local db = dbManager;
    db.table = "'$name_tab'";
    local '$name_tab' = null;
    if(pid == "") '$name_tab' = db.findall();
    else '$name_tab' =  db.find(pid,filed);
    return '$name_tab';
}'
  save_syntax='
  static function save(){
     local db = dbManager;
     db.table = this.table;
     db.row   = "name";
     db.name  = this.getName();
     print(db.name);
     local cols = ['$saverModelCols'];
     local vals = ['$saverModelVals'];
     db.update(cols,vals);
     return true;
 }'
  end_syntax="}"

  echo "$start_syntax" >> $model_name

  for i in "${modelMiddle[@]}"
    do
       echo "$i" >> $model_name
  done
 echo "$get_syntax" >> $model_name
 echo "$save_syntax" >> $model_name
 echo "$end_syntax" >> $model_name
 cd /home/vcmp
}
setInterface(){
  interfaceColumns[$count_col]="$name_col = null"
  if [[ type_col == "booleans" ]]; then
    interfaceColumns[$count_col]="$name_col       = false"
  fi
  if [[ type_col == "integer" ]]; then
    interfaceColumns[$count_col]="$name_col      = 0"
  fi
  if [[ type_col == "float" ]]; then
    interfaceColumns[$count_col]="$name_col      = 0"
  fi
  interface_name=$name_tab".interface.nut"
}
buildInterface(){
  cd /home/vcmp/scripts/Server/Interface
  start_syntax="class "$name_tab"Interface extends DbModel {"
  end_syntax='
    constructor(){
  		base.constructor();
  		this.name	 = "lorem";//example dafault value [like 0/"Malina"/"test"]
  		this.row	 = "ipsum";//main row[like id/name]
  		this.table   = "'$name_tab'";//table name
      }
  }'
  echo "$start_syntax" >> $interface_name
    for i in "${interfaceColumns[@]}"
      do
         echo "$i" >> $interface_name
    done

    echo "$end_syntax" >> $interface_name
    cd /home/vcmp
}

buildController(){
   cd /home/vcmp/scripts/Server/Controller
   syntax='class '$name_tab'Controller extends '$name_tab'Model {
   constructor(){
     	base.constructor();
  }
}';
   echo "$syntax" >> $name_tab'Controller.nut'
   cd /home/vcmp
}

setTableName(){
  echo -e "$green Add Table name$clear"
  read table_name
  name_tab=${table_name// /_}
  if test -z "$table_name"
  then
       setTableName
  else
    clear;
    echo -e "Successfully created$cyan $name_tab $clear. table"
    setColumnName
  fi
}

increment(){
  return $(($1 + 1))
  }



setColumnName(){
  if [ -z "$1" ];
  then
    echo -e "Add column name to$cyan $table_name $clear.table"
    read column_name
    column_name=${column_name// /_}
      if test -z "$column_name"
      then
           setColumnName
      else
        clear;
        echo -e "Successfully added colum$cyan $column_name $clear.to $yellow $table_name $clear.table"
        name_col=$column_name
        setColumnType
      fi
    else
      name_col=$1
      echo -e "Successfully added colum$cyan $name_col $clear.to $yellow $table_name $clear.table"
      setColumnType
  fi
}

setColumnType(){
  echo -e "Add column type. Default$yellow string$clear (VARCHAR)\nAvilable:$magenta boolean, string, timestamp, float, integer$clear "
    read column_type

    case $column_type in

      *"s"* | *"S" )
        type_col="string";
        ;;

       *"b"* | *"B"*)
        type_col="booleans";
        ;;

      *"f"* | *"F"*)
        type_col="float";
        ;;

      *"i"* | *"I"*)
        type_col="integer";
        ;;

     *"t"* | *"T"*)
        type_col="integer";
        ;;
     * )
       type_col="string";
       ;;
    esac
    echo -e "Successfully Added$blue $type_col$clear type for$cyan $column_name$clear."
    setUnique

}

setUnique(){
  echo -e "This column is unique vaLue? Default$yellow no$clear"
  read unique
  case $unique in

        *"y"* | *"Y" )
          uni_col="true";
          ;;
        * )
          uni_col="false";
          ;;
  esac
  setDefault
}

setDefault(){
  echo -e "This column has a default vaLue? If$yellow yes$clear type$green yes$clear and next paste default value."
  read def
  case $def in

        *"y"* | *"Y" )
          echo -e "$cyan Input a$yellow default value$clear"
          read value;
          def_col="$value";
          ;;
        * )
          def_col="null";
          ;;
  esac
  setNullable
}
setNullable(){
    echo -e "This column can be a nullable? Default$yellow yes$clear."
    read nullable
    case $nullable in

          *"n"* | *"N" )
            nul_col="false";
            ;;
          * )
            nul_col="true";
            ;;
    esac
    arrayPush "$name_col" "$type_col" "$uni_col" "$def_col" "$nul_col"
}
setColumnLength(){
  echo -e "Add column length. Default is$yellow 255$clear"
  read column_length
  if [ test -z  "$column_length" ]
    then
      len_col=255;
    else
      while [[ ! $column_length =~ ^[0-9]+$ ]]; do
          echo -e "Enter a numeric value "
          read column_length
      done
      len_col=column_length
  fi
arrayPush "$name_col" "$type_col" "$uni_col" "$def_col" "$nul_col"
}
createMigrationFile(){
  cd /home/vcmp/scripts/Server/Migrations
  file="`date +%Y%m%d%H%M%S`.nut";
  syntax='function onScriptLoad(){
  ::print("Migration $file has loaded successfully");
  dbManager.migrate("'$name_tab'",['
  echo $syntax >> $file

  for i in "${cols[@]}"
  do
     echo "$i" >> $file
  done
  echo "]
  );
  }" >> $file
}

AddNextColumn(){
  echo -e "If you wanna add next column type$yellow name$clear.If you wanna exit edit mode press$red <return>$clear"
  read var
  if [ ${#var} -eq 0 ]; then
    createMigrationFile
    buildModel
    buildInterface
    buildController
    #clear

    echo -e "$magenta\nMigration was created successfully.$clear\nType$green migrations migrate$clear to build this table."
    else
      setColumnName $var
  fi
}

arrayPush(){
  #echo -e 1: $1 2: $2 3: $3 4: $4 5: $5
  # column_name, column_type, nullable, default, unique array_id
  #arrayPush "$name_col" "$type_col" "$uni_col" "$def_col" "$nul_col"
  cols[$count_col]=$2'("'$1'"),'
  if [[ $3 == true ]];
   then
     cols[$count_col]='unique.'$2'("'$1'"),'
     if [[ $4 != null ]];
      then
        cols[$count_col]='unique.defaul.'$2'("'$1'","'$4'"),'
        if [[ $4 =~ ^[0-9]+$ ]] ;
         then
          cols[$count_col]='unique.defaul.'$2'("'$1'",'$4'),'
        fi
        if [ $4 == true ] || [ $4 == false ];
         then
          cols[$count_col]='unique.defaul.'$2'("'$1'",'$4'),'
        fi
     fi
  fi

  if [[ $4 != null ]];
    then
      cols[$count_col]='defaul.'$2'("'$1'","'$4'"),'
      if [[ $4 =~ ^[0-9]+$ ]] ;
       then
        cols[$count_col]='defaul.'$2'("'$1'",'$4'),'
      fi
      if [ $4 == true ] || [ $4 == false ];
       then
        cols[$count_col]='defaul.'$2'("'$1'",'$4'),'
      fi
  fi


   if [[ $5 == true ]];then
    cols[$count_col]='nullable.'$2'("'$1'"),'
    if [[ $4 != null ]];
      then
        cols[$count_col]='nullable.defaul.'$2'("'$1'","'$4'"),'
        if [[ $4 =~ ^[0-9]+$ ]] ;
         then
          cols[$count_col]='nullable.defaul.'$2'("'$1'",'$4'),'
        fi
        if [ $4 == true ] || [ $4 == false ];
         then
          cols[$count_col]='nullable.defaul.'$2'("'$1'",'$4'),'
        fi
    fi
    if [[ $3 == true ]];
     then
      cols[$count_col]='nullable.unique.'$2'("'$1'"),'
    fi
  fi
       count_col=$(($count_col + 1))
       echo ${cols[@]}
      # echo $count_col
      setMiddleSequenceModel
      setInterface
      AddNextColumn
}


setTableName
# column_name, column_type, nullable, default, unique array_id
#arrayPush "$name_col" "$type_col" "$uni_col" "$def_col" "$nul_col"
#setTableName


