cd src
rm -rf microblog
tar xzvf ../microblog.tar.gz
cd microblog
mix ecto.migrate
cd ../../microblog
pkill -f erl
PORT=8000 ./bin/microblog start
exit

