#include "mdichild.h"
#include <QRandomGenerator>

MdiChild::MdiChild(QWidget *parent)
    : QWidget(parent)
{
    // Create a layout for the child window
    layout = new QVBoxLayout(this);
    
    // Create a label with some content
    contentLabel = new QLabel(this);
    
    // Generate a random color for the background
    int r = QRandomGenerator::global()->bounded(100, 240);
    int g = QRandomGenerator::global()->bounded(100, 240);
    int b = QRandomGenerator::global()->bounded(100, 240);
    
    // Set a colored background and some text
    QString styleSheet = QString("background-color: rgb(%1, %2, %3); "
                                "border: 1px solid black; "
                                "padding: 10px;").arg(r).arg(g).arg(b);
    contentLabel->setStyleSheet(styleSheet);
    contentLabel->setAlignment(Qt::AlignCenter);
    contentLabel->setText("MDI Child Window Content\n\n"
                         "This is a sample MDI child window.\n"
                         "You can add more windows using the 'Add Window' button.\n"
                         "You can toggle between windowed and tabbed mode using the 'Toggle View Mode' button.");
    
    // Add the label to the layout
    layout->addWidget(contentLabel);
    
    // Set the layout for this widget
    setLayout(layout);
    
    // Set minimum size
    setMinimumSize(300, 200);
}

MdiChild::~MdiChild()
{
} 