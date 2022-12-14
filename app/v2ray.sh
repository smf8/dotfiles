#!/bin/zsh

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # linux
        echo "installing v2ray linux"
        curl -s -o /tmp/install-release.sh -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh
        sudo bash /tmp/install-release.sh --version 4.45.2
        if [[ $? -ne 0 ]]; then
          echo "install v2ray failed"
          exit
        fi

        echo "enabling v2ray on boot"
        sudo systemctl enable v2ray

        echo "done installing v2ray. now modify config file in /usr/local/etc/v2ray/config.json"

        sudo cp config-foreign.yaml /usr/local/etc/v2ray/config.json

        sed "s/SS_PASSWORD/${SS_PASSWORD}/g" /usr/local/etc/v2ray/config.json
        sed "s/VMESS_UUID_NGINX/${VMESS_UUID_NGINX}/g" /usr/local/etc/v2ray/config.json
        sed "s/VMESS_UUID_WS_1/${VMESS_UUID_WS_1}/g" /usr/local/etc/v2ray/config.json
        sed "s/VMESS_UUID_WS_2/${VMESS_UUID_WS_2}/g" /usr/local/etc/v2ray/config.json
        sed "s/VMESS_UUID_TCP_1/${VMESS_UUID_TCP_1}/g" /usr/local/etc/v2ray/config.json
        sed "s/VMESS_UUID_TCP_2/${VMESS_UUID_TCP_2}/g" /usr/local/etc/v2ray/config.json

        sudo systemctl restart v2ray

elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "installing v2ray macOS"

        brew install v2ray
fi