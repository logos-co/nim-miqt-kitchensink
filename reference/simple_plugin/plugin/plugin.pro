QT += core
CONFIG += plugin
TARGET = calculator_plugin
TEMPLATE = lib

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
    calculator_plugin.cpp

HEADERS += \
    calculator_plugin.h \
    ../interface.h

# Default rules for deployment
unix {
    target.path = /usr/lib
}
!isEmpty(target.path): INSTALLS += target

# Output directory
DESTDIR = ../bin 