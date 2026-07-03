#!/usr/bin/env bash

echo "Recargando servicios..."

systemctl --user daemon-reload

systemctl --user restart wireplumber

systemctl --user restart Volume-Master.service

echo
echo "Listo."
