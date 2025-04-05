#!/usr/bin/env bash

CWD=$(pwd)

if [ -e "$CWD/venv" ]; then
    rm -rf "$CWD/venv"
fi

crt_ssl() {
    if [ -e "$CWD/app/ssl" ]; then
        rm -rf "$CWD/app/ssl"
    fi

    mkdir -p "$CWD/app/ssl"
    openssl req -x509 -nodes -days 3650 -newkey rsa:2048 \
        -keyout "$CWD/app/ssl/key.pem" \
        -out "$CWD/app/ssl/cert.pem" \
        -subj "/C=US/ST=Illinois/L=Chicago/O=MaxPayne/OU=IT Department/CN=localhost"
}

crt_ssl

python3 -m venv venv
. ./venv/bin/activate
pip3 install --upgrade pip
pip3 install -r requirements.txt
cd "$CWD/app"
python manage.py migrate
python manage.py runserver_plus --cert-file ./ssl/cert.pem --key-file ./ssl/key.pem
