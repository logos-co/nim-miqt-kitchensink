#include "mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent), buttonCount(3)
{
    // Create central widget
    centralWidget = new QWidget(this);
    setCentralWidget(centralWidget);
    
    // Create QHBoxLayout
    hboxLayout = new QHBoxLayout(centralWidget);
    
    // Create widgets to add to the layout
    button1 = new QPushButton("Button 1", this);
    button2 = new QPushButton("Button 2", this);
    button3 = new QPushButton("Button 3", this);
    addButton = new QPushButton("Add Button", this);
    label = new QLabel("QHBoxLayout arranges widgets horizontally from left to right", this);
    
    // Connect the Add Button to the slot
    connect(addButton, &QPushButton::clicked, this, &MainWindow::addNewButton);
    
    // Add widgets to the layout
    hboxLayout->addWidget(button1);
    hboxLayout->addWidget(button2);
    hboxLayout->addWidget(button3);
    hboxLayout->addWidget(addButton);
    hboxLayout->addWidget(label);
    
    // Set stretch factors (optional)
    // This makes the label take up more space than the buttons
    hboxLayout->setStretchFactor(button1, 1);
    hboxLayout->setStretchFactor(button2, 1);
    hboxLayout->setStretchFactor(button3, 1);
    hboxLayout->setStretchFactor(addButton, 1);
    hboxLayout->setStretchFactor(label, 3);
    
    // Set spacing between widgets
    hboxLayout->setSpacing(10);
    
    // Set margins around the layout
    hboxLayout->setContentsMargins(10, 10, 10, 10);
}

void MainWindow::addNewButton()
{
    buttonCount++;
    QPushButton *newButton = new QPushButton(QString("Button %1").arg(buttonCount), this);
    
    // Insert the new button before the "Add Button" button
    hboxLayout->insertWidget(hboxLayout->indexOf(addButton), newButton);
    
    // Set the stretch factor for the new button
    hboxLayout->setStretchFactor(newButton, 1);
}

MainWindow::~MainWindow()
{
    // Qt will handle cleanup of child widgets
} 