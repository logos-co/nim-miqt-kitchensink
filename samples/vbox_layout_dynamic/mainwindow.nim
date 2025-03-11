import ../../vendor/seaqt/seaqt/[
  qmainwindow, qpushbutton, qlabel, qhboxlayout, qwidget
]

type
  MainWindow* = ref object
    window: QMainWindow
    centralWidget: QWidget
    hboxLayout: QHBoxLayout
    # hboxLayout: QBoxLayout
    button1: QPushButton
    button2: QPushButton
    button3: QPushButton
    addButton: QPushButton
    label: QLabel
    buttonCount: int

proc addNewButton(self: MainWindow) =
  echo "addNewButton"
  self.buttonCount += 1
  let newButton = QPushButton.create("Button " & $self.buttonCount)
  
  # Insert the new button before the "Add Button" button
  let addButtonIndex = self.hboxLayout.indexOf(self.addButton)
  self.hboxLayout.insertWidget(addButtonIndex, newButton)
  
  # Set the stretch factor for the new button
  discard self.hboxLayout.setStretchFactor(newButton, 1)

proc setupDynamicButton(self: MainWindow) =
  self.addButton.onclicked(proc() = self.addNewButton())

proc newMainWindow*(): MainWindow =
  new result
  
  # Initialize button count
  result.buttonCount = 3
  
  # Create QMainWindow
  result.window = QMainWindow.create()
  
  # Create central widget
  result.centralWidget = QWidget.create()
  result.window.setCentralWidget(result.centralWidget)
  
  # Create QhboxLayout
  result.hboxLayout = QHBoxLayout.create(result.centralWidget)
  # result.hboxLayout = QBoxLayout.create(QBoxLayoutDirectionEnum.TopToBottom, result.centralWidget)
  
  # Create widgets to add to the layout
  result.button1 = QPushButton.create("Button 1")
  result.button2 = QPushButton.create("Button 2")
  result.button3 = QPushButton.create("Button 3")
  result.addButton = QPushButton.create("Add Button")
  result.label = QLabel.create("QhboxLayout arranges widgets vertically from top to bottom")
  
  # Connect the Add Button to the callback
  # result.addButton.connect(SignalClicked, proc() = addNewButton(result))
  # result.addButton.onclicked(proc() = addNewButton(result))
  result.setupDynamicButton()
  
  # Add widgets to the layout
  result.hboxLayout.addWidget(result.button1)
  result.hboxLayout.addWidget(result.button2)
  result.hboxLayout.addWidget(result.button3)
  result.hboxLayout.addWidget(result.addButton)
  result.hboxLayout.addWidget(result.label)
  
  # Set stretch factors (optional)
  # This makes the label take up more space than the buttons
  discard result.hboxLayout.setStretchFactor(result.button1, 1)
  discard result.hboxLayout.setStretchFactor(result.button2, 1)
  discard result.hboxLayout.setStretchFactor(result.button3, 1)
  discard result.hboxLayout.setStretchFactor(result.addButton, 1)
  discard result.hboxLayout.setStretchFactor(result.label, 3)
  
  # Set spacing between widgets
  result.hboxLayout.setSpacing(10)
  
  # Set margins around the layout
  result.hboxLayout.setContentsMargins(10, 10, 10, 10)

# Forward QMainWindow methods to the underlying QMainWindow instance
proc setWindowTitle*(self: MainWindow, title: string) =
  self.window.setWindowTitle(title)

proc resize*(self: MainWindow, width: int, height: int) =
  self.window.resize(width.cint, height.cint)

proc show*(self: MainWindow) =
  self.window.show()

converter toQMainWindow*(self: MainWindow): QMainWindow =
  self.window 