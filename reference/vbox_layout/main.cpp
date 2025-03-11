#include "mainwindow.h"

#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    
    MainWindow window;
    window.setWindowTitle("QHBoxLayout Example");
    window.resize(600, 200);
    window.show();
    
    return app.exec();
} 