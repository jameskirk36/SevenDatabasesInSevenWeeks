#!/usr/bin/env bash

main(){
  apt-get update

  install_erlang
  install_riak_deps
  install_riak
}

install_erlang(){
  curl -O http://s3.amazonaws.com/downloads.basho.com/erlang/otp_src_R16B02-basho5.tar.gz
  tar -xvf otp_src_R16B02-basho5.tar.gz
  cd otp_src_R16B02-basho5
  ./configure && make && sudo make install
}

install_riak_deps(){
  apt-get install build-essential libc6-dev-i386 git
}

install_riak(){
  wget http://s3.amazonaws.com/downloads.basho.com/riak/2.0/2.0.5/riak-2.0.5.tar.gz
  tar zxvf riak-2.0.5.tar.gz
  cd riak-2.0.5
  make rel
}

main
