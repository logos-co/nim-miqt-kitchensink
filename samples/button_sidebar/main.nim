import ../../vendor/seaqt/seaqt/[
  qapplication
]
import mainwindow

proc main() =
  # Create application
  var app = QApplication.create()
  
  # Create and show main window
  var mainWindow = newMainWindow()
  mainWindow.show()
  
  # Run the application
  discard QApplication.exec()

when isMainModule:
  main() 