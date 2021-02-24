#!/bin/bash
docker-compose exec postgres su - postgres -c "createuser root" &
docker-compose exec postgres su - postgres -c "createdb -T template0 -E UTF8 --owner root root" &
docker-compose exec postgres su - postgres -c "createdb -T template0 -E UTF8 --owner root zoudb" &
docker-compose exec cgwire /opt/zou/init_zou.sh