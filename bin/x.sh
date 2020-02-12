X='"xxx","yyy"'


echo $X



Y=X
function get(){
  echo ${!Y}
}

echo $(get)

