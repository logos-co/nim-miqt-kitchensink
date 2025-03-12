#include "calculator_plugin.h"

CalculatorPlugin::CalculatorPlugin(QObject *parent)
    : QObject(parent)
    , m_name("Simple Calculator Plugin")
    , m_version("1.0.0")
{
}

int CalculatorPlugin::add(int a, int b)
{
    return a + b;
}

int CalculatorPlugin::subtract(int a, int b)
{
    return a - b;
}

QString CalculatorPlugin::name() const
{
    return m_name;
}

QString CalculatorPlugin::version() const
{
    return m_version;
} 