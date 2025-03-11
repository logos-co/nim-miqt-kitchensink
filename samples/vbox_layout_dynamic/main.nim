import ../../vendor/seaqt/seaqt/[
  qapplication
]
import mainwindow

proc main() =
  # Create application
  let app = QApplication.create()
  
  # Create and show main window
  var window = newMainWindow()
  window.setWindowTitle("Dynamic QVBoxLayout Example")
  window.resize(600, 400)
  window.show()
  
  # Run the application
  discard QApplication.exec()

when isMainModule:
  main() 