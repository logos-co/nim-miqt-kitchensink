QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = MdiApp
TEMPLATE = app

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    mdichild.cpp

HEADERS += \
    mainwindow.h \
    mdichild.h

FORMS += \
    mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target 