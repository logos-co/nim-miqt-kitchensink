#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <QStackedWidget>
#include <QLabel>
#include <QFrame>
#include <QVector>
#include "sidebarbutton.h"

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void onSidebarButtonClicked();

private:
    void setupUi();
    void createSidebar();
    void createContentPages();
    
    QWidget *m_centralWidget;
    QHBoxLayout *m_mainLayout;
    
    // Sidebar
    QFrame *m_sidebar;
    QVBoxLayout *m_sidebarLayout;
    QVector<SidebarButton*> m_sidebarButtons;
    
    // Content area
    QStackedWidget *m_contentStack;
};

#endif // MAINWINDOW_H 