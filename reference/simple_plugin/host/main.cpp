#include <QCoreApplication>
#include <QPluginLoader>
#include <QObject>
#include <QDebug>
#include <QDir>
#include <QMetaProperty>
#include <QMetaMethod>
#include "../interface.h"

// If PLUGIN_PATH is not defined by CMake, use a default path
#ifndef PLUGIN_PATH
    #ifdef Q_OS_WIN
        #define PLUGIN_PATH QDir::cleanPath(QCoreApplication::applicationDirPath() + "/../plugins/calculator_plugin.dll")
    #elif defined(Q_OS_MAC)
        #define PLUGIN_PATH QDir::cleanPath(QCoreApplication::applicationDirPath() + "/../plugins/libcalculator_plugin.dylib")
    #else
        #define PLUGIN_PATH QDir::cleanPath(QCoreApplication::applicationDirPath() + "/../plugins/libcalculator_plugin.so")
    #endif
#endif

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    qDebug() << "Simple Plugin Example";
    qDebug() << "Current directory:" << QDir::currentPath();
    
    // Use the plugin path defined by CMake
    QString pluginPath = PLUGIN_PATH;
    
    qDebug() << "Loading plugin from:" << pluginPath;

    // Load the plugin
    QPluginLoader loader(pluginPath);
    QObject *plugin = loader.instance();

    if (!plugin) {
        qWarning() << "Failed to load plugin:" << loader.errorString();
        return -1;
    }

    qDebug() << "Plugin loaded successfully.";

    // Cast to our interface
    CalculatorInterface *calculator = qobject_cast<CalculatorInterface *>(plugin);
    if (!calculator) {
        qWarning() << "Plugin does not implement CalculatorInterface";
        return -1;
    }

    // Use the plugin
    qDebug() << "Plugin name:" << calculator->name();
    qDebug() << "Plugin version:" << calculator->version();
    qDebug() << "5 + 3 =" << calculator->add(5, 3);
    qDebug() << "10 - 4 =" << calculator->subtract(10, 4);

    // Use QObject reflection (QMetaObject) for runtime inspection
    const QMetaObject *metaObject = plugin->metaObject();
    qDebug() << "\nPlugin class name:" << metaObject->className();

    // List properties
    qDebug() << "\nProperties:";
    for (int i = 0; i < metaObject->propertyCount(); ++i) {
        QMetaProperty property = metaObject->property(i);
        qDebug() << " -" << property.name() << "=" << plugin->property(property.name());
    }

    // List methods
    qDebug() << "\nMethods:";
    for (int i = 0; i < metaObject->methodCount(); ++i) {
        QMetaMethod method = metaObject->method(i);
        qDebug() << " -" << method.methodSignature();
    }

    return app.exec();
} 