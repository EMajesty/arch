return {
    description = "Containers/virtualization",
    packages = {
        "winboat",
        "docker",
        "docker-compose",
        "libvirt",
        "qemu-full",
        "virt-manager",
        "virt-viewer",
        "virtio-win",
        "swtpm",
    },
    services = {
        enabled = {
            "docker.service",
            "libvirtd.service",
        },
        disabled = {},
    },
}
