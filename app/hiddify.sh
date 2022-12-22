#! /bin/bash

# commented because it's handled by calling CF API directly in setup.sh
#sudo snap install certbot-dns-cloudflare

git clone https://github.com/hiddify/hiddify-config

cp app/hiddify-config.env hiddify-config/config.env

mv hiddify-config /opt/

sed -i "s/_DOMAIN_/${DOMAIN}/g" /opt/hiddify-config/config.env
sed -i "s/_SECRET_/${HIDDIFY_SECRET}/g" /opt/hiddify-config/config.env

#sed -i "/certbot/c\certbot --nginx -d ${DOMAIN} --non-interactive --agree-tos --dns-cloudflare --dns-cloudflare-credentials /etc/cf.ini  --https-port 444 --no-redirect" /opt/hiddify-config/nginx/run.sh

sed -i "s/1004/1400/g" /opt/hiddify-config/nginx/common.conf.template

cd /opt/hiddify-config || exit 1

sudo bash install.sh

cp /opt/hiddify-config/nginx/use-link ~/