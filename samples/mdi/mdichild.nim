import ../../vendor/seaqt/seaqt/[
  qwidget, qlabel, qboxlayout, qsize
]
import random

type
  MdiChild* = ref object
    widget*: QWidget  # This is the main widget that will be added to the MDI area
    contentLabel: QLabel
    layout: QVBoxLayout

proc newMdiChild*(): MdiChild =
  ## Create a new MDI child widget
  result = MdiChild()
  
  # Create the widget
  result.widget = QWidget.create()
  
  # Set minimum size first
  result.widget.setMinimumSize(QSize.create(300, 200))
  
  # Create the content label
  result.contentLabel = QLabel.create()
  result.contentLabel.owned = false
  
  # Generate a random background color
  let r = rand(100..240).cint
  let g = rand(100..240).cint
  let b = rand(100..240).cint
  
  # Set text first
  result.contentLabel.setText(
    "MDI Child Window Content\n\n" &
    "This is a sample MDI child window.\n" &
    "You can add more windows using the 'Add Window' button.\n" &
    "You can toggle between windowed and tabbed mode using the 'Toggle View Mode' button."
  )
  
  # Set alignment
  result.contentLabel.setAlignment(0x0084) # Qt::AlignCenter
  
  # Set style sheet with explicit colors
  let styleSheet = "QLabel { " &
                   "background-color: rgb(" & $r & ", " & $g & ", " & $b & "); " &
                   "border: 1px solid black; " &
                   "padding: 10px; " &
                   "font-size: 12pt; " &
                   "}"
  result.contentLabel.setStyleSheet(styleSheet)
  
  # Create layout
  result.layout = QVBoxLayout.create()
  result.layout.owned = false

  # Add label to layout with stretch
  result.layout.addWidget(result.contentLabel, 1)
  
  # Set the layout for the widget
  result.widget.setLayout(result.layout)

# Forward methods to the underlying QWidget
proc setWindowTitle*(self: MdiChild, title: string) =
  self.widget.setWindowTitle(title)

proc show*(self: MdiChild) =
  self.widget.show()

proc close*(self: MdiChild): bool =
  result = self.widget.close() 