#!/usr/bin/env bash

clear

echo "=============================="
echo " Streams de audio activos"
echo "=============================="
echo

pactl list sink-inputs | awk '
/^Sink Input/ {
    if (n++) print ""
    print $0
}
/application.process.binary =/ ||
/application.name =/ ||
/media.name =/ ||
/module-stream-restore.id =/ {
    print "   " $0
}
'

echo
echo "=================================="
echo " Manteniendo escucha de eventos..."
echo " (Ctrl+C para salir)"
echo "=================================="
echo

pactl subscribe
