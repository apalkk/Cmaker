alias cjump="nvim $(mdfind -onlyin . -name 'main' | grep -A 1 /Users)"
alias clist="mdfind -onlyin . -interpret .cpp"

function cbuild(){
  mkdir $1
  cd $1
  touch CMakeLists.txt
  echo "cmake_minimum_required(VERSION 3.15)" >> CMakeLists.txt
  echo "project($1)" >> CMakeLists.txt 
  echo "cmake_minimum_required(VERSION 3.15)" >> CMakeLists.txt
  echo "add_executable(cpc $(pwd)/src/main.cpp)" >> CMakeLists.txt
  echo "#find_package()" >> CMakeLists.txt
  echo "#target_incldue_directories()" >> CMakeLists.txt
  echo "#target_link_directories()" >> CMakeLists.txt
  echo "#target_link_libraries()" >> CMakeLists.txt
  mkdir src
  cd src
  touch main.cpp
  cd ../..
}

function crun(){
  #VAR=${1:-.} 
  cd $1
  cmake .
  cmake --build .
}

function cbin(){
  cbuild CPP
  cat $1 >> CPP/src/main.cpp
  crun CPP
  mv cpc ../
  cd ..
  rm -r CPP
}

function cput(){
  mv $1/*(DN) $2/
}
