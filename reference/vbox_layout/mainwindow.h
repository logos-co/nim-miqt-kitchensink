#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QPushButton>
#include <QLabel>
#include <QHBoxLayout>
#include <QWidget>

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private:
    QWidget *centralWidget;
    QHBoxLayout *hboxLayout;
    QPushButton *button1;
    QPushButton *button2;
    QPushButton *button3;
    QLabel *label;
};

#endif // MAINWINDOW_H 