import ../../vendor/seaqt/seaqt/[
  qmainwindow, qpushbutton, qlabel, qvboxlayout, qwidget
]

type
  MainWindow* = ref object
    window: QMainWindow
    centralWidget: QWidget
    vboxLayout: QBoxLayout
    button1: QPushButton
    button2: QPushButton
    button3: QPushButton
    label: QLabel

proc newMainWindow*(): MainWindow =
  new result
  
  # Create QMainWindow
  result.window = QMainWindow.create()
  
  # Create central widget
  result.centralWidget = QWidget.create()
  result.window.setCentralWidget(result.centralWidget)
  
  # Create QVBoxLayout
  result.vboxLayout = QBoxLayout.create(QBoxLayoutDirectionEnum.TopToBottom, result.centralWidget)
  
  # Create widgets to add to the layout
  result.button1 = QPushButton.create("Button 1")
  result.button2 = QPushButton.create("Button 2")
  result.button3 = QPushButton.create("Button 3")
  result.label = QLabel.create("QVBoxLayout arranges widgets vertically from top to bottom")
  
  # Add widgets to the layout
  result.vboxLayout.addWidget(result.button1)
  result.vboxLayout.addWidget(result.button2)
  result.vboxLayout.addWidget(result.button3)
  result.vboxLayout.addWidget(result.label)
  
  # Set stretch factors (optional)
  # This makes the label take up more space than the buttons
  discard result.vboxLayout.setStretchFactor(result.button1, 1)
  discard result.vboxLayout.setStretchFactor(result.button2, 1)
  discard result.vboxLayout.setStretchFactor(result.button3, 1)
  discard result.vboxLayout.setStretchFactor(result.label, 3)
  
  # Set spacing between widgets
  result.vboxLayout.setSpacing(10)
  
  # Set margins around the layout
  result.vboxLayout.setContentsMargins(10, 10, 10, 10)

# Forward QMainWindow methods to the underlying QMainWindow instance
proc setWindowTitle*(self: MainWindow, title: string) =
  self.window.setWindowTitle(title)

proc resize*(self: MainWindow, width: int, height: int) =
  self.window.resize(width.cint, height.cint)

proc show*(self: MainWindow) =
  self.window.show()

converter toQMainWindow*(self: MainWindow): QMainWindow =
  self.window 