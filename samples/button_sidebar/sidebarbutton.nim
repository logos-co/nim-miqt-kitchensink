import ../../vendor/nim_miqt_poc/seeqt/[
  qpushbutton, qicon, qsize, qwidget
]

type
  SidebarButton* = ref object
    button*: QPushButton
    active*: bool

proc newSidebarButton*(text: string, icon: QIcon, parent: QWidget): SidebarButton =
  ## Create a new sidebar button
  result = SidebarButton(
    button: QPushButton.create(text, parent),
    active: false
  )
  
  # Set default styling
  result.button.setFixedHeight(50)
  result.button.setMinimumWidth(150)
  result.button.setCheckable(true)
  result.button.setFlat(true)
  
  # Set initial style
  result.button.setStyleSheet("QPushButton { text-align: left; padding-left: 10px; color: white; font-weight: 500; border: none; } QPushButton:hover { background-color: rgba(52, 73, 94, 180); }")
  
  # Set icon if provided
  if not icon.isNull():
    result.button.setIcon(icon)
    result.button.setIconSize(QSize.create(24, 24))

proc setActive*(self: SidebarButton, active: bool) =
  ## Set the active state of the button
  if self.active == active:
    return  # No change needed
    
  self.active = active
  self.button.setChecked(active)
  
  # Update the style based on active state
  if active:
    # Active button has a different background - lighter for contrast against dark sidebar
    self.button.setStyleSheet("QPushButton { text-align: left; padding-left: 10px; color: white; font-weight: 500; border: none; background-color: rgba(70, 130, 180, 100); border-left: 5px solid #3498db; } QPushButton:hover { background-color: rgba(70, 130, 180, 120); }")
  else:
    # Normal state with hover effect
    self.button.setStyleSheet("QPushButton { text-align: left; padding-left: 10px; color: white; font-weight: 500; border: none; } QPushButton:hover { background-color: rgba(52, 73, 94, 180); }")

proc isActive*(self: SidebarButton): bool =
  ## Check if the button is active
  return self.active

proc sizeHint*(self: SidebarButton): QSize =
  ## Return the size hint for the button
  return self.button.sizeHint()
