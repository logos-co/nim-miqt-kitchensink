#include "mainwindow.h"

#include <QApplication>
#include <QStyleFactory>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    
    // Set application style to Fusion for a modern look
    app.setStyle(QStyleFactory::create("Fusion"));
    
    // Apply stylesheet for a more modern look
    // Removed style.qss loading since we don't have that file
    
    MainWindow mainWindow;
    mainWindow.setWindowTitle("Sidebar Demo");
    mainWindow.resize(800, 600);
    mainWindow.show();
    
    return app.exec();
} 