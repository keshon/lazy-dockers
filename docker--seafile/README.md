Seafile.. 
>*..is an open source file sync&share solution designed for high reliability, performance and productivity. Sync, share and collaborate across devices and teams.*(SeaFile.com)
  
Here we have a powerful suite: service, desktop/mobile clients, cli and web interface. A good private alternative to public clouds. 

Features includes storage, sharing, security and LDAP integration.

Here's a video [review](https://www.youtube.com/watch?v=CdP_MTWBnE4) 

## Compose

For this configuration the host just need allow services using the web ports(80,443).

The [docker compose](https://gitlab.com/cedon/seafile/blob/master/docker-compose.yaml) sets 3 containers: mariadb, memcached and seafile. 

The seafile container responds to the service. It have a proxy nginx redirecting que request to internal service listen at port 8000. 

### Let's Encrypt
To use Let's Encrypt, you must set this parameters:

```
    ports:
      ...
      - "443:443" 
      ...
    environment:
      ...
      - SEAFILE_SERVER_LETSENCRYPT=true 
      - SEAFILE_SERVER_HOSTNAME=your.domain.com
```

The domain *your.domain.com* must be valid and internet reachable, or the LetsEncrypt handshakes wont work. 

### MariaDB Connection and SeaFile Authentication 

You must check the database connection. 

Change the value *db_secret* for your mysql connection password. 

*MYSQL_ROOT_PASSWORD=db_secret* must be the same value  of *DB_ROOT_PASSWD=db_secret*.

*DB_HOST=db* must be the same of the mariadb service name *db*.   

```...
services:
  db:
   ...
    environment:
      - MYSQL_ROOT_PASSWORD=db_secret 
  seafile:
  ...
    environment:
      - DB_HOST=db
      - DB_ROOT_PASSWD=db_secret 
```  

The SeaFile Authentication uses e-mail as login name. 

Change the value *a_secret* for your admin password. 

```...
services:
  ... 
  seafile:
  ...
    environment:
     - SEAFILE_ADMIN_EMAIL=me@example.com
     - SEAFILE_ADMIN_PASSWORD=a_secret 
```

### Deploy SeaFile

####Requirements 
- Docker(19.03+)
- Docker-Compose (2.0+)

####Deploy:

clone repository
```
git clone https://gitlab.com/cedon/seafile.git
```
here two ways to deploy:
- 1. official seafile sample docker-compose.yaml file.

a. edit compose file seafile/[docker-compose.yml](https://gitlab.com/cedon/seafile/blob/master/docker-compose.yaml)

b. deploy infrastructure
```
docker-compose -f seafile/docker-compose.yaml up -d
```
- 2. setting the parameters on [.env files](https://docs.docker.com/compose/compose-file/#env_file).

a. set the environment parameters on files: 
 - mariadb:[env/db.env](https://gitlab.com/cedon/seafile/blob/master/env/db.env)
 - seafile:[env/seafile.env](https://gitlab.com/cedon/seafile/blob/master/env/seafile.env)

b. deploy infrastructure
```
docker-compose -f seafile/docker-compose.sec.yaml up -d
```
## Setting Up the service

After the deploy you must access System Admin > Settings

Set the Service URL: `http://your.domain.com:8000`
Set the File Server Root: `http://your.domain.com/seafhttp`

## References

SeaFile Project - www.seafile.com