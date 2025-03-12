#ifndef PLUGIN_INTERFACE_H
#define PLUGIN_INTERFACE_H

#include <QtPlugin>
#include <QString>

// Define the interface for our plugin
class CalculatorInterface
{
public:
    virtual ~CalculatorInterface() {}
    
    // Plugin methods
    virtual int add(int a, int b) = 0;
    virtual int subtract(int a, int b) = 0;
    virtual QString name() const = 0;
    virtual QString version() const = 0;
};

// Define the interface ID used by Qt's plugin system
#define CalculatorInterface_iid "com.example.CalculatorInterface"
Q_DECLARE_INTERFACE(CalculatorInterface, CalculatorInterface_iid)

#endif // PLUGIN_INTERFACE_H 