#!/bin/bash

## Create virtual Python environment, as this is needed since Debian Bookworm
sudo apt install python3-full
python3 -m venv .
bin/pip install influxdb
bin/pip install dsmr-parser

## Install systemd service
sudo cp p1_to_influxdb.service /etc/systemd/system/.
sudo systemctl enable p1_to_influxdb
sudo systemctl daemon-reload
sudo systemctl start p1_to_influxdb
systemctl status p1_to_influxdb
