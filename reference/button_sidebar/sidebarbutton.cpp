#include "sidebarbutton.h"
#include <QPainter>
#include <QPaintEvent>
#include <QStyleOption>

SidebarButton::SidebarButton(const QString &text, const QIcon &icon, QWidget *parent)
    : QPushButton(parent), m_active(false)
{
    setText(text);
    setIcon(icon);
    setIconSize(QSize(24, 24));
    setCheckable(true);
    setFlat(true);
    
    // Set fixed height for the button
    setFixedHeight(50);
    
    // Set minimum width
    setMinimumWidth(150);
    
    // Left align text with icon and make text color white for better visibility on dark background
    setStyleSheet("text-align: left; padding-left: 10px; color: white; font-weight: 500;");
}

void SidebarButton::setActive(bool active)
{
    m_active = active;
    setChecked(active);
    update();
}

bool SidebarButton::isActive() const
{
    return m_active;
}

void SidebarButton::paintEvent(QPaintEvent *event)
{
    QPainter painter(this);
    QStyleOption opt;
    opt.initFrom(this);
    
    // Draw the button background
    if (m_active) {
        // Active button has a different background - lighter for contrast against dark sidebar
        painter.fillRect(rect(), QColor(70, 130, 180, 100));  // Steel blue with more opacity
        
        // Draw a vertical indicator on the left side
        painter.fillRect(QRect(0, 0, 5, height()), QColor(52, 152, 219));  // Bright blue indicator
    } else if (underMouse()) {
        // Hover state - lighter for better visibility on dark background
        painter.fillRect(rect(), QColor(52, 73, 94, 180));  // Slightly lighter than sidebar
    }
    
    // Draw the icon and text
    QPushButton::paintEvent(event);
}

QSize SidebarButton::sizeHint() const
{
    return QSize(150, 50);
} 