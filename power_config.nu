# This configures my power configs

def "main" [] {
  help main
}
def "main install" [] {
    print "→ Installing power profile policy files"
    sudo install -m 755 ($env.FILE_PWD | path join "power/power-profile-policy.sh") /usr/local/bin/
    sudo install -m 644 ($env.FILE_PWD | path join "power/power-profile-boot.service") /etc/systemd/system/
    sudo install -m 644 ($env.FILE_PWD | path join "power/99-power-profile.rules") /etc/udev/rules.d/

    print "→ Reloading systemd and udev"
    sudo systemctl daemon-reload
    sudo systemctl enable power-profile-boot.service
    sudo udevadm control --reload
}

def "main uninstall" [] {
    try { sudo systemctl disable --now power-profile-boot.service }
    sudo rm -f /usr/local/bin/power-profile-policy.sh /etc/systemd/system/power-profile-boot.service /etc/udev/rules.d/99-power-profile.rules
    sudo systemctl daemon-reload
    sudo udevadm control --reload
}
