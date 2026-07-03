# Volume Configuration - PikaOS

Configuraciones personales de audio para PikaOS (PipeWire + WirePlumber + KDE).

## Incluye

- Renombrado de dispositivos de audio.
- Volumen inicial del navegador Zen al 20%.
- Volumen inicial de las notificaciones de Discord al 30%.
- Servicio `Volume-Master` para ajustar automáticamente el volumen de streams específicos.
- Servicios de BeatDock y Lavalink.

## Instalación

Copiar:

- `wireplumber/` → `~/.config/wireplumber/wireplumber.conf.d/`
- `systemd/` → `~/.config/systemd/user/`
- `scripts/` → `~/.local/bin/`

Después ejecutar:

```bash
chmod +x ~/.local/bin/Volume-Master.sh
systemctl --user daemon-reload
systemctl --user enable Volume-Master.service
systemctl --user start Volume-Master.service
systemctl --user restart wireplumber
