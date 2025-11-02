export PATH=$PATH:/usr/share/sway-contrib
export PATH=$PATH:~/go/bin

export XDG_CONFIG_HOME=~/.config
export GDK_DPI_SCALE=2
export QT_SCALE_FACTOR=2



if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec sway --unsupported-gpu
fi
