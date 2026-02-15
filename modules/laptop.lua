return {
    description = "Laptop specific packages and services",
    packages = {
        "tlp",
        "tlp-rdw",
        "powertop",
        "acpi",
        "acpid",
    },
    services = {
        enabled = {
            "tlp.service",
            "acpid.service",
        },
        disabled = {},
    },
}
