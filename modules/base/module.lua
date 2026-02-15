return {
    description = "Core packages and base desktop stack",

    dotfiles_sync = true,

    dotfiles = {
        { source = "dotfiles-home/zshrc",                    target = "~/.zshrc" },
        { source = "dotfiles-home/gitconfig",                target = "~/.gitconfig" },
        { source = "dotfiles-local/bin/random-hyprpaper.sh", target = "~/.local/bin/random-hyprpaper.sh" },
    },

    packages = {
        -- Core system
        "base",
        "base-devel",
        "linux",
        "linux-firmware",
        "linux-headers",
        "zsh",
        "git",
        "snapper",
        "limine",
        "ly",

        -- Handling packages
        "dcli",
        "yay",
        "nix",

        -- Desktop/WM
        "hyprland",
        "waybar",
        "wofi",
        "wl-clipboard",
        "swaync",

        -- Terminal
        "kitty",
        "neovim",
        "tmux",
        "tree",

        -- Shell and UX
        "eza",
        "fastfetch",
        "starship",
        "zsh-autosuggestions",
        "zsh-syntax-highlighting",

        -- File management
        "nautilus",
        "udiskie",
        "udisks2",

        -- Portals/desktop integration
        "xdg-desktop-portal",
        "xdg-desktop-portal-hyprland",
        -- "xdg-desktop-portal-gtk",

        -- Hyprland extras
        "hypridle",
        "hyprlock",
        "hyprpaper",
        "hyprpicker",
        "hyprshot",

        -- Audio
        "pipewire",
        "pipewire-alsa",
        "pipewire-jack",
        "pipewire-pulse",
        "pavucontrol",
        "wiremix",
        "wireplumber",
        -- "mpd-discord-rpc",
        "mpdscribble-git",
        "mpd",
        "mpd-mpris",
        "rmpc",
        "mpc",
        "spotify",

        -- Bluetooth
        "bluez",
        "blueman",
        "blueberry",

        -- Dev tooling
        "clang",
        "cmake",
        "gdb",
        "jq",
        "openai-codex",
        "rustup",
        "gcc",
        "llvm",
        "make",
        "ninja",
        "meson",
        "python",
        "python-pip",
        "python-virtualenv",
        "jdk-openjdk",
        "lazygit",
        "lua",
        "luajit",

        -- Remote access
        "freerdp",
        "remmina",

        -- Networking/VPN
        "curl",
        "wget",
        "openssh",
        "mullvad-vpn",
        "wpa_supplicant",
        "networkmanager",
        "nm-connection-editor",
        "network-manager-applet",
        "smbclient",

        -- System tools
        "btop",
        "efibootmgr",
        "evtest",
        "ntfs-3g",
        "rtkit",
        "cifs-utils",
        "cups",
        "cups-pdf",
        "cups-filters",
        "cups-browsed",
        "system-config-printer",

        -- Archives/compression
        "7zip",
        "unzip",
        "xz",
        "zip",
        "ark",

        -- Media/graphics
        "feh",
        "ffmpegthumbnailer",
        "ffmpegthumbs",
        "tumbler",
        "zathura",
        "eom",
        "foliate",
        "calibre-bin",
        "mpc-qt",
        "obs-studio",

        -- Apps
        "discord",
        "qbittorrent",
        "rpi-imager",
        "telegram-desktop",
        "zen-browser-bin",
        "obsidian",
        "whatsdesk-bin",
        "irssi",
        "tuxguitar",

        -- Appearance
        "adwaita-icon-theme",
        "adwaita-icon-theme-legacy",
        "bibata-cursor-theme",
        "adw-gtk-theme",
        "nwg-look",
        "nwg-icon-picker",

        -- Misc
        "age",
        "cmatrix",
        "gvfs",
        "gnome-keyring",
        "swww",
        "xdg-utils",
        "man-db",
        "man-pages",
        "less",
        "fd",
        "hackrf",
        "yt-dlp",
        "wine",
        "winetricks",
        "bottles",
        "pokeget",
        "ventoy-bin",
        "vial-git",
        "meshtastic-python",
        "tldr",
        "plymouth",
        "fzf",

    },
    services = {
        enabled = {
            "mullvad-daemon.service",
            "bluetooth.service",
            "cups.service",
            "avahi-daemon.service",
            "ly.service",
        },
    },
}
