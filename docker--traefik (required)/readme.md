1. Create network:
```bash
docker network create proxy
```

2. Clone fresh traefik-dockerized:
```bash
git clone https://github.com/cedrichopf/traefik-dockerized.git
```

3. Create `acme.json` file and set 600 permissions:
```bash
chmod 600 letsencrypt/acme.json
```

4. Set proper domain in .env file

5. Run compose:
```bash
docker-compose up -d
```