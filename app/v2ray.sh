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

elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "installing v2ray macOS"

        brew install v2ray
fi