#!/bin/bash
# =====================================================================
# ALL-IN-ONE CONKY DRACULA-THEME INSTALLATIONSSKRIPT-V2
# =====================================================================

# 1. ERFASSE DYNAMISCH DEN BENUTZERNAMEN (Für krisensichere Pfade)
CURRENT_USER=$(whoami)
echo "Starte Installation für Benutzer: $CURRENT_USER"

# 2. VERZEICHNISSE ERSTELLEN
mkdir -p ~/.conky
mkdir -p ~/.config/autostart
mkdir -p ~/.local/share/applications

# 3. TO-DO-TEXTDATEI ERSTELLEN (Nur wenn sie nicht schon existiert)
if [ ! -f ~/Dokumente/.conkytodo.txt ]; then
cat << 'EOF' > ~/Dokumente/.conkytodo.txt
[ ] Bluetooth-Verbindung testen

[ ] Akku-Warnfarbe ausprobieren

[ ] Kaffee genießen
EOF
echo "Versteckte To-Do-Datei unter ~/Dokumente/.conkytodo.txt angelegt."
fi

# 4. LINKE CONFIG (TO-DO-LISTE IN DRACULA-FARBEN)
cat << 'EOF' > ~/.conky/todo-left.conf
conky.config = {
    alignment = 'top_left',
    gap_x = 25,
    gap_y = 50,
    minimum_width = 280,
    maximum_width = 280,
    background = true,
    own_window = true,
    own_window_type = 'normal',
    own_window_transparent = false,
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    own_window_argb_visual = true,
    own_window_argb_value = 45,
    own_window_colour = '282a36',
    double_buffer = true,
    update_interval = 2.0,
    draw_shades = false,
    draw_outline = false,
    draw_borders = false,
    use_xft = true,
    font = 'DejaVu Sans:size=10',
    uppercase = false,
    default_color = 'f8f8f2',
    color1 = 'ff79c6',             -- Dracula Pink
    color2 = '8be9fd',             -- Dracula Cyan
};

conky.text = [[
${color1}${font DejaVu Sans:bold:size=12}MEINE AUFGABEN${font}${color}
${color1}${hr 1}${color}
${execp cat ~/Dokumente/.conkytodo.txt | sed 's/^/  /'}
]];
EOF

# 5. RECHTE CONFIG (SCHMALES 310PX DOPPELSPALTEN-LAYOUT)
cat << 'EOF' > ~/.conky/clean-all-in-one.conf
conky.config = {
    alignment = 'top_right',
    gap_x = 25,
    gap_y = 50,
    minimum_width = 310,
    maximum_width = 310,
    minimum_height = 850,
    background = true,
    own_window = true,
    own_window_type = 'normal',
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    own_window_argb_visual = true,
    own_window_argb_value = 45,
    own_window_colour = '282a36',
    double_buffer = true,
    update_interval = 2.0,
    draw_shades = false,
    draw_outline = false,
    draw_borders = false,
    use_xft = true,
    font = 'DejaVu Sans:size=9',
    uppercase = false,
    default_color = 'f8f8f2',
    color1 = 'ff79c6',             -- Dracula Pink
    color2 = '8be9fd',             -- Dracula Cyan
    color3 = 'ff5555',             -- Dracula Red
    color5 = 'bd93f9',             -- Dracula Purple
};

conky.text = [[
${color2}${font DejaVu Sans:bold:size=20}${time %H:%M}${font} ${color1}${font DejaVu Sans:bold:size=10}${time %d. %B %Y}${font}
${color}OS: ${color2}$sysname $machine ${alignr}${color}Kernel: ${color2}$kernel
${color}Uptime: ${color2}$uptime
${color1}${hr 1}${color}

${color1}${font DejaVu Sans:bold:size=8}STATUS & MESSUNG${font}${color}
${color}Bluetooth Funk: ${alignr}${color2}${execi 5 bluetoothctl show | grep -q "Powered: yes" && (bluetoothctl info | grep "Name:" | cut -d' ' -f2- || echo "Aktiviert") || echo "Ausgeschaltet" | cut -c1-18}
${color}Lautstärke: ${alignr}${color2}${execi 1 pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1}
${color}Ping (Google): ${alignr}${color2}${execi 60 ping -c 1 8.8.8.8 2>/dev/null | grep -oP 'time=\K[\d.]+' | head -1} ms
${color}Meldungen: ${alignr}${color2}${execi 5 qdbus org.kde.NotificationArea /NotificationArea org.kde.NotificationArea.activeNotifications 2>/dev/null | wc -l}
${color}Updates (Apt): ${alignr}${color2}${execi 3600 apt list --upgradable 2>/dev/null | grep -c upgradable} ausstehend
${color1}${hr 1}${color}

${color1}${font DejaVu Sans:bold:size=10}PROZESSOR (CPU)${font}${color}
${color2}${execi 600 lscpu | grep 'Modellname\|Model name' | cut -d':' -f2 | sed -e 's/^[ \t]*//' | cut -c1-32}${color}
${color}CPU Last:${color2} ${cpu cpu0}% ${alignr}${color}Temp: ${if_match ${acpitemp} >= 65}${color3}${else}${color2}${endif}${acpitemp}°C${color}
${color2}${cpubar cpu0 4}${color}

${color}Kerne:${color2}
  C1: ${cpu cpu1}% ${alignr}${cpubar cpu1 4,110}
  C2: ${cpu cpu2}% ${alignr}${cpubar cpu2 4,110}
  C3: ${cpu cpu3}% ${alignr}${cpubar cpu3 4,110}
  C4: ${cpu cpu4}% ${alignr}${cpubar cpu4 4,110}

${color}Top-Prozesse (CPU 1-5):${goto 165}Top-Prozesse (CPU 6-10):${color5}
  1. ${top name 1 7}${goto 100}${top cpu 1}%${goto 165} 6. ${top name 6 7}${goto 265}${top cpu 6}%
  2. ${top name 2 7}${goto 100}${top cpu 2}%${goto 165} 7. ${top name 7 7}${goto 265}${top cpu 7}%
  3. ${top name 3 7}${goto 100}${top cpu 3}%${goto 165} 8. ${top name 8 7}${goto 265}${top cpu 8}%
  4. ${top name 4 7}${goto 100}${top cpu 4}%${goto 165} 9. ${top name 9 7}${goto 265}${top cpu 9}%
  5. ${top name 5 7}${goto 100}${top cpu 5}%${goto 165}10. ${top name 10 7}${goto 265}${top cpu 10}%

${color1}${font DejaVu Sans:bold:size=10}ARBEITSSPEICHER (RAM)${font}${color}
${color}RAM:${color2} $mem / $memmax ${alignr}$memperc%
${color2}${membar 4}${color}
${color}Cache: ${color2}${cached} ${alignr}${color}Buffer: ${color2}${buffers}
${color}Zwischenablage: ${alignr}${color2}${execi 2 xclip -selection clipboard -o 2>/dev/null | wc -c | awk '{print $1" Bytes"}'}

${color}Top-Prozesse (RAM 1-5):${goto 165}Top-Prozesse (RAM 6-10):${color5}
  1. ${top_mem name 1 7}${goto 100}${top_mem mem_res 1}${goto 165} 6. ${top_mem name 6 7}${goto 265}${top_mem mem_res 6}
  2. ${top_mem name 2 7}${goto 100}${top_mem mem_res 2}${goto 165} 7. ${top_mem name 7 7}${goto 265}${top_mem mem_res 7}
  3. ${top_mem name 3 7}${goto 100}${top_mem mem_res 3}${goto 165} 8. ${top_mem name 8 7}${goto 265}${top_mem mem_res 8}
  4. ${top_mem name 4 7}${goto 100}${top_mem mem_res 4}${goto 165} 9. ${top_mem name 9 7}${goto 265}${top_mem mem_res 9}
  5. ${top_mem name 5 7}${goto 100}${top_mem mem_res 5}${goto 165}10. ${top_mem name 10 7}${goto 265}${top_mem mem_res 10}

${color1}${font DejaVu Sans:bold:size=10}MEDIEN & SPEICHER${font}${color}
${color}System (/): ${color2}${fs_used /} / ${fs_size /}
${color2}${fs_bar 4 /}${color}
${execp upower -e | grep -E 'keyboard|mouse|gaming_input' | while read -r dev; do name=$(upower -i "$dev" | grep 'model:' | awk '{print substr($0, index($0,$2))}'); batt=$(upower -i "$dev" | grep 'percentage:' | awk '{print $2}'); if [ -n "$name" ]; then echo "${color}$name: ${alignr}${color2}$batt"; fi; done}
${execp mount | grep -E '/media/|/run/media/' | awk '{print "${color}Medien: ${color2}" $3 "\n${color2}${fs_bar 4 " $3 "}${color}"}' 2>/dev/null}

${color1}${font DejaVu Sans:bold:size=10}STROMVERSORGUNG (AKKU)${font}${color}
${if_existing /sys/class/power_supply/BAT0}${if_match ${battery_percent BAT0} < 20}${color3}${else}${color2}${endif}Akku 1: ${battery_percent BAT0}% ${alignr}${battery_bar 4,100 BAT0}${endif}${color}
${if_existing /sys/class/power_supply/BAT1}${if_match ${battery_percent BAT1} < 20}${color3}${else}${color2}${endif}Akku 2: ${battery_percent BAT1}% ${alignr}${battery_bar 4,100 BAT1}${endif}

${color1}${font DejaVu Sans:bold:size=10}NETZWERK & INFRASTRUKTUR${font}${color}
${if_existing /proc/net/route wlan0}${color}Lokal (WiFi): ${alignr}${color2}${addr wlan0}${endif}${if_existing /proc/net/route wlp2s0}${color}Lokal (WiFi): ${alignr}${color2}${addr wlp2s0}${endif}${if_existing /proc/net/route eth0}${color}Lokal (Lan): ${alignr}${color2}${addr eth0}${endif}${if_existing /proc/net/route enp3s0}${color}Lokal (Lan): ${alignr}${color2}${addr enp3s0}${endif}
${color}Externe IP: ${alignr}${color2}${execi 3600 curl -s -4 icanhazip.com || echo "Fehler"}
${if_existing /proc/net/route wlan0}${color}Download: ${alignr}${color2}${downspeed wlan0}
${color}Upload: ${alignr}${color2}${upspeed wlan0}${endif}${if_existing /proc/net/route wlp2s0}${color}Download: ${alignr}${color2}${downspeed wlp2s0}
${color}Upload: ${alignr}${color2}${upspeed wlp2s0}${endif}${if_existing /proc/net/route eth0}${color}Download: ${alignr}${color2}${downspeed eth0}
${color}Upload: ${alignr}${color2}${upspeed eth0}${endif}${if_existing /proc/net/route enp3s0}${color}Download: ${alignr}${color2}${downspeed enp3s0}
${color}Upload: ${alignr}${color2}${upspeed enp3s0}${endif}
]];
EOF

# 6. START-SKRIPT ERSTELLEN
cat << 'EOF' > ~/.conky/conky-startup.sh
#!/bin/bash
while ! pidof plasmashell >>/dev/null; do sleep 1; done
sleep 5
killall conky 2>/dev/null

conky -c ~/.conky/clean-all-in-one.conf &
conky -c ~/.conky/todo-left.conf &
exit 0
EOF
chmod +x ~/.conky/conky-startup.sh

# 7. KDE-ANWENDUNGSSTARTER GENERIEREN
cat << EOF > ~/.local/share/applications/conkytodo.desktop
[Desktop Entry]
Name=Conky ToDo Liste
Comment=Öffnet die versteckte Aufgabenliste
Exec=kate /home/$CURRENT_USER/Dokumente/.conkytodo.txt
Icon=korganizer
Terminal=false
Type=Application
Categories=Utility;
StartupNotify=true
EOF
chmod +x ~/.local/share/applications/conkytodo.desktop

# 8. SITZUNGS-CACHE BEREINIGEN & KMENÜ AKTUALISIEREN
rm -rf ~/.local/share/kate/
rm -f ~/.config/katerc
kbuildsycoca5 --noincremental 2>/dev/null || kbuildsycoca6 --noincremental 2>/dev/null

# 9. IN DEN KDE-AUTOSTART EINTRAGEN
cp ~/.local/share/applications/conkytodo.desktop ~/.config/autostart/ 2>/dev/null

cat << EOF > ~/.config/autostart/conky.desktop
[Desktop Entry]
Type=Application
Exec=/home/$CURRENT_USER/.conky/conky-startup.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Conky Widgets
EOF

# 10. CONKY FRISCH STARTEN
killall conky 2>/dev/null && sleep 2 && nohup ~/.conky/conky-startup.sh >/dev/null 2>&1 & disown

echo "====================================================================="
echo "=== DRACULA ALL-IN-ONE SYSTEM ERFOLGREICH EINGERICHTET! ==="
echo "====================================================================="
