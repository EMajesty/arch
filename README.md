## Bootstrap from a minimal Arch install

Note: This is my personal configuration repo. Please use it for inspiration only and do not apply it as-is.

This repo is designed to be applied with `dcli` for both packages and dotfiles.
The flow below assumes you already have a working network connection and a
sudo-capable user.

### 0) Install Arch (archinstall + Btrfs + snapper)

Use `archinstall` and choose:

- Filesystem: **Btrfs**
- Partitioning: **EFI + root**
  - EFI: ~512MB, FAT32, mount `/boot` (or `/boot/efi`)
  - Root: Btrfs
- Subvolumes (flat layout):
  - `@` -> `/`
  - `@home` -> `/home`
  - `@snapshots` -> `/.snapshots`
  - `@var_log` -> `/var/log`
  - `@var_cache` -> `/var/cache`
  - `@swap` -> `/swap`
- Enable **multilib** (in archinstall profile/settings)

After first boot:

### 1) Run the script

```bash
sh <(curl -fsSL "https://dev.electri.cc")
```

### 2) Reboot

```bash
sudo reboot
```

### 3) Start user services

dcli does not manage user services yet, so user-level services won’t
auto-start until enabled or started manually (e.g. `mpd`). Start/enable
them with:

```bash
systemctl --user enable --now mpd.service
```
