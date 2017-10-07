#!/bin/bash
mix deps.get
mix release.init
export MIX_ENV=prod
mix phx.digest
mix release --env=prod
scp _build/prod/rel/microblog/releases/0.0.1/microblog.tar.gz catperson@45.63.4.26:
ssh catperson@45.63.4.26
