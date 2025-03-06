# {.passL: "-lstdc++".}
# {.passL: "-L" & "/nix/store/bpq1s72cw9qb2fs8mnmlw6hn2c7iy0ss-gcc-14-20241116-lib/lib".}
# The above was required to build, replaced with config.nims and flake.nix setting LIBRARAY_PATH

# import liblogos
import ../../vendor/seaqt/seaqt/[qapplication, qpushbutton, qwidget, qmainwindow]

import strformat
import logging

var counter = 0
var btn: QPushButton

proc buttonCallback() =
  counter += 1
  btn.setText(&"You have clicked the button {counter} time(s)")

addHandler(newConsoleLogger())
setLogFilter(lvlDebug)

proc main() =
  let app = QApplication.create()
  # let window = QMainWindow.create()

  btn = QPushButton.create("Hello world!")  # , window
  btn.setFixedWidth(320)

  btn.onPressed(buttonCallback)

  btn.show()
  # window.show()

  discard QApplication.exec()

when isMainModule:
  main()