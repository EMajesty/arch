## Bootstrap from a minimal Arch install

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
curl -fsSL "https://dev.electri.cc" | sh
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
