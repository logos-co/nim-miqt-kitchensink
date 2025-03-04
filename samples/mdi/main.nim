import ../../vendor/seaqt/seaqt/[
  qapplication
]
import ./mainwindow

proc main() =
  let app = QApplication.create()
  
  let mainWindow = newMainWindow()
  mainWindow.setWindowTitle("MDI Example")
  mainWindow.show()
  
  discard QApplication.exec()

when isMainModule:
  main() 