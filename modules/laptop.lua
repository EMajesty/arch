return {
    description = "Laptop specific packages and services",
    packages = {
        "tlp",
        "tlp-rdw",
        "powertop",
        "acpi",
        "acpid",
        "brightnessctl",
    },
    services = {
        enabled = {
            "tlp.service",
            "acpid.service",
        },
        disabled = {},
    },
}
