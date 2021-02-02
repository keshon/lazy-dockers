After installation change http to https (if reverse proxy is used) in `/docker--nextcloud/data/nextcloud/config/config.php`:
```
  'overwrite.cli.url' => '<enter domain name including 'https://' part>',
  'overwriteprotocol' => 'https',
```