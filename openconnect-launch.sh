#!/bin/bash

interactive_answers()
{
    echo $VPN_REALM
    echo $VPN_USER_NAME
    stoken --rcfile=$STOKEN_FILE --pin=$PIN
}

if ! `stoken show --rcfile=$STOKEN_FILE 1>/dev/null`; then
    echo "Token file $STOKEN_FILE not found or invalid. Exiting..."
    exit 1
fi

VPN_SERVER="$(shuf -e $VPN_SERVERS | head -n 1)"

interactive_answers | openconnect --background \
                       --script=$VPNC_SCRIPT_PATH \
                       --protocol=$VPN_PROTOCOL \
		               --servercert=$VPN_SERVER_CERT \
		               https://$VPN_SERVER
