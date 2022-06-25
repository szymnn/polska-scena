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
type_col=""
name_col=""
len_col=""
uni_col=""
nul_col=""
def_col=""
next_col=""
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

increment(){
  return $(($1 + 1))
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
      name_col=$column_name
      setColumnType
    fi
}

setColumnType(){
  echo -e "Add column type. Default $yellow string $clear (VARCHAR)\nAvilable: $magenta boolean, string, timestamp, float, integer $clear "
    read column_type

    case $column_type in

      *"s"* | *"S" | * )
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
    esac
    echo -e "Successfully Added $blue $type_col $clear type for $cyan $column_name $clear."
    setUnique

}

setUnique(){
  clear;
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
  clear;
  echo -e "This column has a default vaLue? If$yellow yes $clear type$green yes$clear and next paste default value."
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
  clear;
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

arrayPush(){
  echo -e 1: $1 2: $2 3: $3 4: $4 5: $5
      cols[$count_col]="$2('"$1"'),"
        if [[ $3 == "true" ]];then
          cols[$count_col]="unique.$2('"$1"'),"
           if [[ $4 == "null" ]];then
            cols[$count_col]="unique.$2('"$1"'),"
            else
              cols[$count_col]="unique.defaul.$2('"$1"','"$4"'),"
            if [[ $4 =~ ^[0-9]+$ ]] ; then
               cols[$count_col]="unique.defaul.$2('"$1"',$4),"
            fi
            if [ $4 == "true" ] || [ $4 == "false" ];then
              cols[$count_col]="unique.defaul.$2('"$1"',$4),"
            fi
            fi
          cols[$count_col]="unique.$2('"$1"'),"
          else cols[$count_col]="$2('"$1"'),"
        fi
        if [[ $4 == "null" ]];then
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
          if [[ $4 == "null" ]];then
            cols[$count_col]="nullable.$2('"$1"'),"
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
       count_col=$(($count_col + 1))
       echo ${cols[@]}
       echo $count_col
       AddNextColumn
}

createMigrationFile(){
  for i in "${columns[@]}"
  do
     :
     # do whatever on "$i" here
  done
}

AddNextColumn(){
  echo -e "If you wanna add next column type $yellow name$clear.If you wanna exit edit mode press$red <return>"
  read var
  if [ ${#var} -eq 0 ]; then
    echo "Enter was hit"
  fi
}
# column_name, column_type, nullable, default, unique array_id
setTableName
#arrayPush "$name_col" "$type_col" "$uni_col" "$def_col" "$nul_col"
#setTableName


