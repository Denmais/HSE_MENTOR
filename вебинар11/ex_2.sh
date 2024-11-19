#!/bin/bash


REMOTE_USER="user"
REMOTE_HOST="localhost"
EMAIL="1@1.ru"

ssh "$REMOTE_USER@$REMOTE_HOST" << EOF
UPDATES=$(apt list --upgradable 2>/dev/null | grep -c upgradable)

if [ $UPDATES -gt 0 ]; then
    
    sudo apt update && sudo apt upgrade -y

    if [ -f /var/run/reboot-required ]; then
        sudo reboot
        REBOOT=true
    else
        REBOOT=false
    fi
else
    REBOOT=false
fi
EOF

if [ "$REBOOT_REQUIRED" = "true" ]; then
    echo "Сервер был перезагружен." | mail -s "1" "$EMAIL"
    echo "Письмо отправлено $EMAIL."
else
    echo "Перезагрузки не было."
fi
