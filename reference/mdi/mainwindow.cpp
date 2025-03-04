#include "mainwindow.h"
#include "mdichild.h"
#include <QMdiSubWindow>
#include <QToolBar>
#include <QVBoxLayout>
#include <QLabel>
#include <QTabBar>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent), windowCounter(0)
{
    // Set up the MDI area
    setupMdiArea();
    
    // Create toolbar with buttons
    createToolBar();
    
    // Set central widget
    setCentralWidget(mdiArea);
    
    // Set initial size
    resize(800, 600);
}

MainWindow::~MainWindow()
{
}

void MainWindow::setupMdiArea()
{
    mdiArea = new QMdiArea(this);
    mdiArea->setHorizontalScrollBarPolicy(Qt::ScrollBarAsNeeded);
    mdiArea->setVerticalScrollBarPolicy(Qt::ScrollBarAsNeeded);
    mdiArea->setViewMode(QMdiArea::SubWindowView); // Start in windowed mode
    
    // Enable tab close buttons
    mdiArea->setTabsClosable(true);
    
    // Connect the tabCloseRequested signal to handle tab closing
    connect(mdiArea, &QMdiArea::subWindowActivated, this, &MainWindow::updateTabCloseButtons);
    
    // Add an initial MDI window
    addMdiWindow();
}

void MainWindow::createToolBar()
{
    mainToolBar = addToolBar(tr("Main"));
    
    // Add button
    addButton = new QPushButton(tr("Add Window"), this);
    connect(addButton, &QPushButton::clicked, this, &MainWindow::addMdiWindow);
    mainToolBar->addWidget(addButton);
    
    // Toggle button
    toggleButton = new QPushButton(tr("Toggle View Mode"), this);
    connect(toggleButton, &QPushButton::clicked, this, &MainWindow::toggleViewMode);
    mainToolBar->addWidget(toggleButton);
}

void MainWindow::addMdiWindow()
{
    // Create a new MDI child window
    MdiChild *child = new MdiChild;
    windowCounter++;
    child->setWindowTitle(tr("MDI Window %1").arg(windowCounter));
    
    // Add the child to the MDI area
    QMdiSubWindow *subWindow = mdiArea->addSubWindow(child);
    subWindow->setMinimumSize(200, 200);
    subWindow->show();
    
    // Connect the close event of the subwindow
    connect(subWindow, &QMdiSubWindow::windowStateChanged, this, &MainWindow::updateTabCloseButtons);
}

void MainWindow::toggleViewMode()
{
    // Toggle between tabbed and windowed mode
    if (mdiArea->viewMode() == QMdiArea::SubWindowView) {
        mdiArea->setViewMode(QMdiArea::TabbedView);
        toggleButton->setText(tr("Switch to Windowed"));
        
        // Make sure tab close buttons are visible
        updateTabCloseButtons();
    } else {
        mdiArea->setViewMode(QMdiArea::SubWindowView);
        toggleButton->setText(tr("Switch to Tabbed"));
    }
}

void MainWindow::updateTabCloseButtons()
{
    // This function ensures that tab close buttons are visible
    // It needs to be called when switching to tabbed mode and when windows change
    if (mdiArea->viewMode() == QMdiArea::TabbedView) {
        // Find the internal QTabBar
        QTabBar* tabBar = mdiArea->findChild<QTabBar*>();
        if (tabBar) {
            tabBar->setTabsClosable(true);
            
            // Disconnect any existing connections to avoid duplicates
            disconnect(tabBar, &QTabBar::tabCloseRequested, nullptr, nullptr);
            
            // Connect the tabCloseRequested signal
            connect(tabBar, &QTabBar::tabCloseRequested, [this](int index) {
                // Get the list of subwindows
                QList<QMdiSubWindow*> windows = mdiArea->subWindowList();
                
                // Make sure the index is valid
                if (index >= 0 && index < windows.size()) {
                    // Close the window at the specified index
                    windows.at(index)->close();
                }
            });
        }
    }
} 