#!/bin/bash
mix deps.get
mix release.init
export MIX_ENV=prod
mix phx.digest
mix release --env=prod
scp _build/prod/rel/microblog/releases/0.0.1/microblog.tar.gz catperson@45.63.4.26:
Gooj9heiSauw
ssh catperson@45.63.4.26
Gooj9heiSauw
rm -r microblog
mkdir microblog
cd microblog
tar xzvf ../microblog.tar.gz
cd ..
rm microblog.tar.gz
exit
cd ..
tar zcvf microblog.tar.gz microblog
scp microblog.tar.gz catperson@45.63.4.26:
Gooj9heiSauw
ssh catperson@45.63.4.26
Gooj9heiSauw
cd src
rm -rf microblog
tar xzvf ../microblog.tar.gz
mix ecto.migrate
cd ../../microblog
pkill -f erl
PORT=8000 ./bin/microblog start
exit
