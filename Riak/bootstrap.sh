#!/usr/bin/env bash

main(){
  apt-get update
  install_deps
  install_riak
}


install_deps(){
  apt-get install -y build-essential libc6-dev-i386 git g++ libncurses5-dev openssl libssl-dev fop xsltproc unixodbc-dev erlang libpam0g-dev
}

install_riak(){
  wget http://s3.amazonaws.com/downloads.basho.com/riak/2.0/2.0.5/riak-2.0.5.tar.gz
  tar zxf riak-2.0.5.tar.gz
  cd riak-2.0.5
  make all
  make devrel DEVNODES=3
}

main
