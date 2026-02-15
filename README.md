## Bootstrap from a minimal Arch install

This repo is designed to be applied with `chezmoi` (dotfiles) and `dcli`
(package/system setup). The flow below assumes you already have a working
network connection and a sudo‑capable user.

### 0) Install Arch (archinstall + Btrfs + snapper)

Use `archinstall` and choose:

- Filesystem: **Btrfs**
- Partitioning: **EFI + root**
  - EFI: ~512MB, FAT32, mount `/boot` (or `/boot/efi`)
  - Root: Btrfs
- Subvolumes (flat layout):
  - `@` -> `/`
  - `@home` -> `/home`
  - `@snapshots` (or `@.snapshots`) -> `/.snapshots`
- Optional subvols: `@var_log` -> `/var/log`

After first boot:

```bash
sudo pacman -Sy --needed snapper
sudo snapper -c root create-config /
sudo mkdir -p /.snapshots
sudo chmod 750 /.snapshots
```

This enables `dcli` snapshots later.

### 1) Install base tools

```bash
sudo pacman -Sy --needed git chezmoi
```

Install `dcli` (AUR recommended):

```bash
yay -S dcli-arch-git
# or
paru -S dcli-arch-git
```

If you don’t use an AUR helper, build from source:

```bash
git clone https://gitlab.com/theblackdon/dcli.git
cd dcli
./install.sh
```

### 2) Clone this repo

```bash
git clone <your-repo-url-or-path> ~/arch
cd ~/arch
```

### 3) Pull and apply dotfiles with chezmoi

```bash
chezmoi init --apply ~/arch
```

If you prefer manual control:

```bash
chezmoi init ~/arch
chezmoi apply
```

### 4) Prepare arch-config for dcli

`dcli` expects configs in `~/.config/arch-config`. You have two options:

Option A: use dcli’s bootstrap (creates a starter config):

```bash
dcli init -b
```

Option B: use this repo’s `arch-config/`:

```bash
mkdir -p ~/.config
cp -r ./arch-config ~/.config/arch-config
```

Pick a host and make sure `~/.config/arch-config/config.yaml` has
`active_host` set correctly (e.g. `desktop` or `laptop`).

### 5) Apply Arch package set with dcli

Sync your system:

```bash
dcli sync
```

### 6) Reboot

```bash
sudo reboot
```

After reboot, you should have your dotfiles and the package stack from
`arch-config/` installed.
