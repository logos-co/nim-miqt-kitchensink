QT += core
QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

TARGET = plugin_host
TEMPLATE = app

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
    main.cpp

HEADERS += \
    ../interface.h

# Default rules for deployment
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

# Output directory
DESTDIR = ../bin 