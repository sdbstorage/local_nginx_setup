#!/usr/bin/zsh
# running this script weekly as a (root) cronjob

dt=$(date '+%Y-%m-%dT%H:%M:%S %z')
docker compose -f /opt/nginx/docker-compose.yml run --rm certbot renew --deploy-hook "docker compose -f /opt/nginx/docker-compose.yml exec nginx nginx -s reload; echo '[$dt] Certificate renewed & server reloaded' >> /opt/nginx/certificate.log"
