import ../../vendor/seaqt/seaqt/[
  qmainwindow, qmdiarea, qmdisubwindow, qpushbutton, qtoolbar, qtabbar, qaction
]

import ./mdichild

type
  MainWindow* = ref object
    window*: QMainWindow
    mdiArea: QMdiArea
    addButton: QPushButton
    toggleButton: QPushButton
    mainToolBar: QToolBar
    windowCounter: int

proc addMdiWindow(self: MainWindow) =
  # # Create a new MDI child window
  let child = newMdiChild()
  self.windowCounter += 1
  child.setWindowTitle("MDI Window " & $self.windowCounter)
  
  # # Add the child to the MDI area
  let subWindow = self.mdiArea.addSubWindow(child.widget)
  # Reset the owner flag since addSubWindow takes ownership
  child.widget.owned = false
  subWindow.setMinimumSize(200, 200)
  subWindow.show()

proc toggleViewMode(self: MainWindow) =
  # Toggle between tabbed and windowed mode
  if self.mdiArea.viewMode() == 0: # SubWindowView = 0
    self.mdiArea.setViewMode(1)    # TabbedView = 1
    self.toggleButton.setText("Switch to Windowed")
  else:
    self.mdiArea.setViewMode(0)    # SubWindowView = 0
    self.toggleButton.setText("Switch to Tabbed")

proc setupMdiArea(self: MainWindow) =
  # Set up the MDI area
  self.mdiArea = QMdiArea.create(self.window)
  self.mdiArea.setHorizontalScrollBarPolicy(0) # ScrollBarAsNeeded = 0
  self.mdiArea.setVerticalScrollBarPolicy(0)   # ScrollBarAsNeeded = 0
  self.mdiArea.setViewMode(0) # SubWindowView = 0, start in windowed mode

  # Enable tab close buttons
  self.mdiArea.setTabsClosable(true)
  
  # ================================================
  # TODO: connect the tabCloseRequested signal to handle tab closing
  # ================================================

  # Add an initial MDI window
  self.addMdiWindow()

proc createToolBar(self: MainWindow) =
  # Create toolbar with buttons
  # self.mainToolBar = self.window.addToolBar("Main")
  self.mainToolBar = self.window.addToolBar("Main")
  # self.mainToolBar = self.addToolBar("Main")

  # Add button
  self.addButton = QPushButton.create("Add Window", self.window)
  self.addButton.onPressed(proc() = self.addMdiWindow())

  discard self.mainToolBar.addWidget(self.addButton)
  # Reset the owner flag since addWidget takes ownership
  self.addButton.owned = false

  # Toggle button
  self.toggleButton = QPushButton.create("Toggle View Mode", self.window)
  self.toggleButton.onPressed(proc() = self.toggleViewMode())

  discard self.mainToolBar.addWidget(self.toggleButton)
  # Reset the owner flag since addWidget takes ownership
  self.toggleButton.owned = false

proc newMainWindow*(): MainWindow =
  result = MainWindow(
    window: QMainWindow.create(),
    windowCounter: 0
  )
  
  # Set up the MDI area
  result.setupMdiArea()
  
  # Create toolbar with buttons
  result.createToolBar()
  
  # Set central widget
  result.window.setCentralWidget(result.mdiArea)
  
  # Set initial size
  result.window.resize(800, 600)

proc show*(self: MainWindow) =
  self.window.show()

proc setWindowTitle*(self: MainWindow, title: string) =
  self.window.setWindowTitle(title) 