# Enhanced Arch Linux container

I made arch linux a bit easier to use inside of distrobox with this.

### Things added

- base-devel
- git
- links to podman, flatpak, and others that would be executed on the host if ran
- [Yay](https://github.com/Jguer/yay)

## Installation

### Distrobox

```bash
distrobox create -i ghcr.io/dnkmmr69420/enhanced-arch:latest -n enhanced-arch
```

### Toolbx

```bash
toolbox create -i ghcr.io/dnkmmr69420/enhanced-arch:latest -c enhanced-arch
```
