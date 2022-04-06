# guestwifi-generator for openwrt
**rotate_guest_ssid_wifi_password.sh:** an ASH script that should be placed on a openwrt router to generate random wifi credentials. SSID and password are then applied to a 'guest' network in the router ('guest' network should be created manually on the router). Outputs (insecurely) a json file that must be served to an linux machine on your network that can be used to generate a QRCode for easy client configuration.
.example: an example of a crontab that periodically executes the .sh script.
