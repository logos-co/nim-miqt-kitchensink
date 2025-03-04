#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QMdiArea>
#include <QMdiSubWindow>
#include <QAction>
#include <QMenu>
#include <QToolBar>
#include <QPushButton>

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void addMdiWindow();
    void toggleViewMode();
    void updateTabCloseButtons();

private:
    void createActions();
    void createToolBar();
    void setupMdiArea();

    QMdiArea *mdiArea;
    QPushButton *addButton;
    QPushButton *toggleButton;
    QToolBar *mainToolBar;
    
    int windowCounter;
};

#endif // MAINWINDOW_H 