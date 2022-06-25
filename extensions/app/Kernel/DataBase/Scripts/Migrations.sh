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

declare -a columns;

setTableName(){
  echo -e "$green Add Table name$clear"
  read table_name
  table_name=${table_name// /_}
  if test -z "$table_name"
  then
       setTableName
  else
    clear;
    echo -e "Successfully created $cyan $table_name $clear. table"
    setColumnName
  fi
}

setColumnName(){
  echo -e "Add column name to $cyan $table_name $clear. table"
  read column_name
  column_name=${column_name// /_}
    if test -z "$column_name"
    then
         setColumnName
    else
      clear;
      echo -e "Successfully added colum $cyan $column_name $clear. to $yellow $table_name $clear.  table"
      setColumnType
    fi
}

setColumnType(){
  echo -e "Add column type. Default $yellow string $clear (VARCHAR)\nAvilable: $magenta boolean, string, timestamp, float, integer $clear "
    read column_type

    case $column_type in

      *"st"* | *"St" | * )
        column_type = "string";
        ;;

       *"bo"* | *"Bo"*)
        column_type = "booleans";
        ;;

      *"fl"* | *"Fl"*)
        column_type = "float";
        ;;

      *"in"* | *"In"*)
        column_type = "integer";
        ;;

     *"ti"* | *"Ti"*)
        column_type = "integer";
        ;;
    esac
    echo -e "Successfully Added $blue $column_type $clear type for $cyan $column_name $clear."
    setColumnLength

}
setColumnLength(){
  echo -e "Add column length. Default is$yellow 255$clear"
  read column_length
  if [ test -z  "$column_length" ]
    then
      column_length = 255;
    else
      while [[ ! $column_length =~ ^[0-9]+$ ]]; do
          echo -e "Enter a numeric value "
          read column_length
      done
  fi


}

arrayPush(){
  $count_col = 0;
      cols[$count_col]="$2('"$1"'),"
        if [[ $3 == "true" ]];then
          cols[$count_col]="unique.$2('"$1"'),"
          else cols[$count_col]="$2('"$1"'),"
        fi
        if [[ -z ${4+x} ]];then
          return;
          else
          cols[$count_col]="defaul.$2('"$1"','"$4"'),"
          if [[ $4 =~ ^[0-9]+$ ]] ; then
             cols[$count_col]="defaul.$2('"$1"',$4),"
          fi
          if [ $4 == "true" ] || [ $4 == "false" ];then
            cols[$count_col]="defaul.$2('"$1"',$4),"
          fi
        fi
        if [[ $5 == "true" ]];then
          cols[$count_col]="nullable.$2('"$1"'),"
        fi
        if [[ $5 == "true" && $4 == "true" ]];then
           if [[ -z ${4+x} ]];then
            return;
            else
              cols[$count_col]="nullable.defaul.$2('"$1"','"$4"'),"
            if [[ $4 =~ ^[0-9]+$ ]] ; then
               cols[$count_col]="nullable.defaul.$2('"$1"',$4),"
            fi
            if [ $4 == "true" ] || [ $4 == "false" ];then
              cols[$count_col]="nullable.defaul.$2('"$1"',$4),"
            fi
          fi
        fi
        if [[ $5 == "true" && $3 == "true" ]];then
          cols[$count_col]="nullable.unique.$2('"$1"'),"
        fi
        if [[$4 == "true" && $3 == "true" ]];
        then
            cols[$count_col]="nullable.$2('"$1"'),"
        fi
       count_col=$count_col+1
       echo ${cols[@]}
       echo $count_col
}
#dupa(){
#  cols[$count_col]="$2('"$1"'),"
#          if [[ $3 == "true" ]];
#            then
#              cols[$count_col]="unique.$2('"$1"'),"
#          fi
#          if [[ $4 == "true" ]];
#            then
#              cols[$count_col]="defaul.$2('"$1"'),"
#              if[[ $5 == "true" ]];
#                then
#                  cols[$count_col]="nullable.defaul.$2('"$1"'),"
#              fi
#          fi
#          if [[ $5 == "true" ]];
#            then
#              cols[$count_col]="nullable.$2('"$1"'),"
#              if[[ $4 == "true" ]];
#                then
#                  cols[$count_col]="nullable.defaul.$2('"$1"'),"
#              fi
#              if[[ $3 == "true" ]];
#                then
#                  cols[$count_col]="nullable.unique.$2('"$1"'),"
#              fi
#          fi
#}
createMigrationFile(){
  for i in "${columns[@]}"
  do
     :
     # do whatever on "$i" here
  done
}
# column_name, column_type, nullable, default, unique array_id
arrayPush "test" "string" "false" "chuj" "false"
#setTableName


