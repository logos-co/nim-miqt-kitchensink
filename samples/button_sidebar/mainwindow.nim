import ../../vendor/seaqt/seaqt/[
  qmainwindow, qwidget, qlabel, qframe, qboxlayout, 
  qspaceritem, qicon, qsize, qstackedwidget, qfont, qpushbutton
]
import os

type
  MainWindow* = ref object
    window: QMainWindow
    centralWidget: QWidget
    mainLayout: QBoxLayout
    sidebar: QFrame
    sidebarLayout: QBoxLayout
    contentArea: QWidget
    contentLayout: QBoxLayout
    contentTitle: QLabel
    contentText: QLabel
    buttons: seq[QPushButton]
    activeButtonIndex: int

proc updateButtonStyles(self: MainWindow) =
  ## Update button styles based on active index
  for i in 0..<self.buttons.len:
    if i == self.activeButtonIndex:
      self.buttons[i].setStyleSheet("QPushButton { text-align: left; padding-left: 15px; color: white; font-weight: 500; border: none; background-color: #34495e; } QPushButton:hover { background-color: #3e5771; }")
    else:
      self.buttons[i].setStyleSheet("QPushButton { text-align: left; padding-left: 15px; color: white; font-weight: 500; border: none; } QPushButton:hover { background-color: #3e5771; }")

proc updateContent(self: MainWindow, title: string, text: string) =
  ## Update the content area with new title and text
  self.contentTitle.setText(title)
  self.contentText.setText(text)

proc handleButton0Click(self: MainWindow) =
  self.activeButtonIndex = 0
  self.updateButtonStyles()
  self.updateContent("Home Page", "This is the Home Page content area.")
  echo "Switched to Home page"

proc handleButton1Click(self: MainWindow) =
  self.activeButtonIndex = 1
  self.updateButtonStyles()
  self.updateContent("Dashboard", "This is the Dashboard content area.")
  echo "Switched to Dashboard page"

proc handleButton2Click(self: MainWindow) =
  self.activeButtonIndex = 2
  self.updateButtonStyles()
  self.updateContent("User Profile", "This is the User Profile content area.")
  echo "Switched to Profile page"

proc handleButton3Click(self: MainWindow) =
  self.activeButtonIndex = 3
  self.updateButtonStyles()
  self.updateContent("Settings", "This is the Settings content area.")
  echo "Switched to Settings page"

proc createContentArea(self: MainWindow) =
  ## Create content area
  self.contentArea = QWidget.create()
  self.contentArea.setStyleSheet("background-color: #333333;")
  
  # Create content layout
  self.contentLayout = QBoxLayout.create(2) # QVBoxLayout
  self.contentLayout.setSpacing(0)
  self.contentLayout.setContentsMargins(20, 20, 20, 20)
  self.contentArea.setLayout(self.contentLayout)
  
  # Create content title
  self.contentTitle = QLabel.create("Home Page")
  self.contentTitle.setStyleSheet("font-size: 24px; font-weight: bold; color: white;")
  self.contentTitle.setAlignment(0x0004) # AlignHCenter
  
  # Create content text
  self.contentText = QLabel.create("This is the Home Page content area.")
  self.contentText.setStyleSheet("font-size: 16px; color: white;")
  self.contentText.setAlignment(0x0004) # AlignHCenter
  
  # Add content widgets to layout
  self.contentLayout.addWidget(self.contentTitle, 0)
  self.contentLayout.addWidget(self.contentText, 0)
  self.contentLayout.addStretch(1)
  
  echo "Content area created"

proc createSidebar(self: MainWindow) =
  ## Create sidebar with buttons
  let currentDir = getCurrentDir()
  let iconDir = currentDir & "/samples/button_sidebar/icons/"
  
  try:
    # Define button info
    let buttonInfos = [
      ("Home", iconDir & "home.png"),
      ("Dashboard", iconDir & "chart.png"),
      ("Profile", iconDir & "profile.png"),
      ("Settings", iconDir & "settings.png")
    ]
    
    # Create buttons
    for i, info in buttonInfos:
      let text = info[0]
      let iconPath = info[1]
      
      # Create button directly
      var btn = QPushButton.create(text, self.sidebar)
      btn.setFixedHeight(50)
      btn.setStyleSheet("QPushButton { text-align: left; padding-left: 15px; color: white; font-weight: 500; border: none; } QPushButton:hover { background-color: #3e5771; }")
      
      # Set icon
      var icon = QIcon.create(iconPath)
      btn.setIcon(icon)
      btn.setIconSize(QSize.create(24, 24))
      
      # Add the button to the sidebar layout
      self.sidebarLayout.addWidget(btn, 0)
      
      # Add to buttons list
      self.buttons.add(btn)
    
    # Connect button click signals
    if self.buttons.len >= 4:
      self.buttons[0].onclicked(proc() = self.handleButton0Click())
      self.buttons[1].onclicked(proc() = self.handleButton1Click())
      self.buttons[2].onclicked(proc() = self.handleButton2Click())
      self.buttons[3].onclicked(proc() = self.handleButton3Click())
    
    # Add spacer at the bottom
    self.sidebarLayout.addStretch(1)
    
    echo "Created ", self.buttons.len, " sidebar buttons"
  except Exception as e:
    echo "Failed to create sidebar buttons: " & e.msg

proc setupUi(self: MainWindow) =
  ## Set up the UI components
  # Create central widget and main layout
  self.centralWidget = QWidget.create()
  self.window.setCentralWidget(self.centralWidget)
  
  self.mainLayout = QBoxLayout.create(0) # QHBoxLayout
  self.mainLayout.setSpacing(0)
  self.mainLayout.setContentsMargins(0, 0, 0, 0)
  self.centralWidget.setLayout(self.mainLayout)
  
  # Create sidebar frame
  self.sidebar = QFrame.create()
  self.sidebar.setFixedWidth(200)
  self.sidebar.setStyleSheet("background-color: #2c3e50;")
  
  self.sidebarLayout = QBoxLayout.create(2) # QVBoxLayout
  self.sidebarLayout.setSpacing(0)
  self.sidebarLayout.setContentsMargins(0, 0, 0, 0)
  self.sidebar.setLayout(self.sidebarLayout)
  
  # Add widgets to main layout
  self.mainLayout.addWidget(self.sidebar, 0)
  
  echo "UI setup complete"

proc setInitialPage(self: MainWindow) =
  ## Set the initial active page
  if self.buttons.len > 0:
    self.handleButton0Click()
    echo "Initial page set to Home"

proc newMainWindow*(): MainWindow =
  ## Create a new main window
  result = MainWindow(
    activeButtonIndex: -1
  )
  
  # Create main window
  result.window = QMainWindow.create()
  result.window.resize(800, 600)
  result.window.setWindowTitle("Sidebar Demo")
  
  # Initialize UI
  result.setupUi()
  
  # Create content area
  result.createContentArea()
  
  # Add content area to main layout
  result.mainLayout.addWidget(result.contentArea, 1)
  
  # Create sidebar with buttons
  result.createSidebar()
  
  # Set initial page
  result.setInitialPage()
  
  echo "MainWindow created"

proc show*(self: MainWindow) =
  ## Show the main window
  self.window.show()
  echo "MainWindow shown" 