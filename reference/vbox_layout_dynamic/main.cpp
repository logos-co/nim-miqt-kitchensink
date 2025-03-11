#include "mainwindow.h"

#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    
    MainWindow window;
    window.setWindowTitle("Dynamic QHBoxLayout Example");
    window.resize(800, 200);
    window.show();
    
    return app.exec();
} 