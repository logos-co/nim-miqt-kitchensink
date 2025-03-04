import ../../vendor/nim_miqt_poc/seeqt/[
  qwidget, qlabel, qboxlayout, qcolor, qpalette, qsize
]
import random

type
  MdiChild* = ref object
    widget*: QWidget
    contentLabel*: QLabel
    layout*: QVBoxLayout

proc newMdiChild*(): MdiChild =
  ## Create a new MDI child widget
  result = MdiChild()
  
  # Create the widget
  result.widget = QWidget.create()
  result.widget.setMinimumSize(QSize.create(200, 150))
  
  # Create a label for content
  result.contentLabel = QLabel.create("MDI Child Window")
  
  # Create layout
  result.layout = QVBoxLayout.create()
  result.widget.setLayout(result.layout)
  
  # Add label to layout
  result.layout.addWidget(result.contentLabel, 0)
  
  # Generate a random background color
  let r = rand(100..200).cint
  let g = rand(100..200).cint
  let b = rand(100..200).cint
  
  let palette = QPalette.create()
  palette.setColor(0, QColor.create(r, g, b)) # 0 = QPalette::Window
  result.widget.setPalette(palette)
  result.widget.setAutoFillBackground(true)
  
  # Center the text
  result.contentLabel.setAlignment(0x0084) # Qt::AlignCenter

# Forward methods to the underlying QWidget
proc setWindowTitle*(self: MdiChild, title: string) =
  self.widget.setWindowTitle(title)

proc show*(self: MdiChild) =
  self.widget.show()

proc close*(self: MdiChild): bool =
  result = self.widget.close() 