import ../../vendor/seaqt/seaqt/[qcoreapplication, qpluginloader, qobject, qdebug, qdir, qmetaobject, qmetaproperty, qmetamethod]

type
  CalculatorInterface* = ref object of QObject
    # Pure virtual methods will be defined in the implementing class
    add*: proc(a: int, b: int): int {.cdecl.}
    subtract*: proc(a: int, b: int): int {.cdecl.}
    name*: proc(): string {.cdecl.}
    version*: proc(): string {.cdecl.}

const CalculatorInterface_iid* = "com.example.CalculatorInterface"

# Register interface with Qt's plugin system
#{.emit: """
#Q_DECLARE_INTERFACE(CalculatorInterface, CalculatorInterface_iid)
#""".}
