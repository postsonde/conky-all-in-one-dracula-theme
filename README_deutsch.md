# All-in-One Conky Dracula Theme 🧛‍♂️

Ein extrem schickes, modernes und vollautomatisches Doppel-Widget-Setup für **MX Linux KDE**, optimiert im weltbekannten **Dracula-Farbschema**.

Dieses Projekt verwaltet zwei Fenster parallel: eine kompakte Aufgabenliste auf der linken Seite und einen umfassenden, schmalen System-Monitor auf der rechten Seite.

---

## 📊 Features im Überblick

### ⬅️ Linke Seite: Meine Aufgaben (To-Do-Liste)
- **Unsichtbare Verwaltung:** Deine To-Do-Einträge liegen geschützt in einer versteckten Datei (`~/Dokumente/.conkytodo.txt`).
- **KDE-Menü-Starter:** Ein eigener, fehlerfreier Eintrag in deinen KDE-Anwendungen öffnet deine Aufgabenliste mit nur einem Klick direkt im Texteditor **Kate**.
- **Individuelles Layout:** Deine manuell gesetzten Leerzeilen und Abstände werden eins zu eins auf dem Desktop abgebildet.

### ➡️ Rechte Sektion: Der schmale System-Monitor (310px)
- **Ruckelfreies Doppelspalten-Layout:** Die Top 10 CPU- und RAM-Prozesse werden platzsparend nebeneinander (5 links, 5 rechts) dargestellt. Die Programmnamen werden automatisch nach 7 Zeichen gekürzt, damit nichts überlappt.
- **Dynamischer Medien-Finder:** Deine **Acer Maus & Tastatur** sowie angesteckte USB-Sticks tauchen vollautomatisch mit Klarnamen und Akkustand auf und verschwinden restlos beim Abziehen.
- **Erweiterte RAM-Messung:** Zeigt dir neben dem Arbeitsspeicher auch die aktuelle Größe deiner KDE-Zwischenablage (Klipper) live in Bytes an.
- **Überhitzungsschutz:** Sobald der Prozessor wärmer als 65°C wird, schaltet die Temperaturanzeige automatisch auf warnendes Dracula-Rot um.
- **Intelligenter Netz-Speed:** Ermittelt automatisch deine aktive Internetkarte und schaltet bei Last flüssig von Bytes auf **MiB/s** um.

---

## 🚀 Installation mit nur einem Klick

Dieses Skript ist so intelligent geschrieben, dass es sich vollautomatisch an jeden Benutzernamen auf deinem Computer anpasst.

1. Lade dir die Datei `ALL-IN-ONE CONKY DRACULA-THEME INSTALLATIONSSKRIPT-V2.sh` hier aus dem Repository herunter.
2. Öffne dein Terminal im selben Ordner und schalte die Datei frei:
   ```bash
   chmod +x "./ALL-IN-ONE CONKY DRACULA-THEME INSTALLATIONSSKRIPT-V2.sh"
   ```
3. Starte die automatische Einrichtung:
   ```bash
   "./ALL-IN-ONE CONKY DRACULA-THEME INSTALLATIONSSKRIPT-V2.sh"
   ```

*Das Skript erledigt ab hier alles für dich: Es bereinigt alte Sitzungs-Caches, baut die Widgets auf und trägt sie direkt in den **KDE-Autostart** ein, damit sie bei jedem PC-Start von alleine laden.*

