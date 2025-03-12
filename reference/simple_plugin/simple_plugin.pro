TEMPLATE = subdirs

SUBDIRS += \
    plugin \
    host

# Create bin directory
system(mkdir -p bin)

# Build the plugin first, then the host application
host.depends = plugin 