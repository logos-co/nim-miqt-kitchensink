#ifndef CALCULATOR_PLUGIN_H
#define CALCULATOR_PLUGIN_H

#include <QObject>
#include "../interface.h"

class CalculatorPlugin : public QObject, public CalculatorInterface
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID CalculatorInterface_iid)
    Q_INTERFACES(CalculatorInterface)

public:
    explicit CalculatorPlugin(QObject *parent = nullptr);
    
    // Implementation of CalculatorInterface
    int add(int a, int b) override;
    int subtract(int a, int b) override;
    QString name() const override;
    QString version() const override;

private:
    QString m_name;
    QString m_version;
};

#endif // CALCULATOR_PLUGIN_H 