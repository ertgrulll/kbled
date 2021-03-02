# kbled

##### Ubuntu için klavye arka ışık denetleyicisi

Ubuntu'da Scroll Lock tuşu ile klavye ışıklandırmasının etkinleştirilemediği için bu scripti oluşturdum.
Sadece, Scroll Lock tuşu ile aydınlatması açılabilen klavyeler için yapıldı.
Ayrıca, sadece arka ışığını açıp kapatma işlevi olan bir klavyeye sahipseniz, klavyenize 5 farklı efekt uygulayabilirsiniz.

---

##### Keyboard backlight controller for Ubuntu

Scroll Lock key is not activating keyboard backlights on Ubuntu, so i created this script.
Made for keyboards that enable backlighting with the scroll lock key.
Also you can apply 5 different effects to an ordinary backlit led keyboard.

---

### Setting Up

    - Download the file and place it desired location.(eg: ~/kbled.sh)
    - Open terminal(ctrl+alt+t) and type: chmod +x path/to/file
    - Add this to end of ~/.bashrc file as a new line: alias kbled='pkill -f "kbled.sh"; setsid path/to/file'
        - In terminal: sudo nano ~/.bashrc
        - source ~/.bashrc or . ~/.bashrc
    - Now it's ready to use with one of theese commands:
        - kbled help
        - kbled on
        - kbled off
        - kbled heartbeat or kbled hb
        - kbled reverseheartbeat or rhb
        - kbled flash or kbled flash {speed} (you can set any number instead of {speed})
        - kbled notice or kbled ntc
        - kbled sine or kbled sn
