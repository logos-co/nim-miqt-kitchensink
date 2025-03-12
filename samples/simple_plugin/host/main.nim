import ../../../vendor/seaqt/seaqt/[qcoreapplication, qpluginloader, qobject, qdebug, qdir, qmetaobject, qmetaproperty, qmetamethod]
import "../interface"

# If PLUGIN_PATH is not defined, use a default path
when not defined(PLUGIN_PATH):
  when defined(windows):
    const PLUGIN_PATH = "../plugins/calculator_plugin.dll"
  elif defined(macosx):
    const PLUGIN_PATH = "../plugins/libcalculator_plugin.dylib"
  else:
    const PLUGIN_PATH = "../plugins/libcalculator_plugin.so"

proc main() =
  var app = QCoreApplication.create()

  echo "Simple Plugin Example"
  echo "Current directory: " & QDir.currentPath()
  
  # Use the plugin path defined
  var pluginPath = QDir.cleanPath(QCoreApplication.applicationDirPath() & "/" & PLUGIN_PATH)
  
  echo "Loading plugin from: " & pluginPath

  # Load the plugin
  var loader = QPluginLoader.create(pluginPath)
  var plugin = loader.instance()

  # Check if plugin loaded successfully
  if not loader.isLoaded():
   echo "Failed to load plugin: " & loader.errorString()
   return

  echo "Plugin loaded successfully."

  var calculatorPtr = plugin.metacast("CalculatorInterface")
  var calculator: CalculatorInterface = nil
  calculator = cast[CalculatorInterface](calculatorPtr)

  if calculator == nil:
    echo "Plugin does not implement CalculatorInterface"
    return

  # Get the meta object and print class name
  var metaObject = plugin.metaObject()
  echo metaObject.type
  echo "\nPlugin class name: "
  echo metaObject.className()
  echo "\n--------------------------------"

  # Use the plugin
  echo "Plugin name: " & calculator.name()
  echo "Plugin version: " & calculator.version()
  echo "5 + 3 = " & $calculator.add(5, 3)
  echo "10 - 4 = " & $calculator.subtract(10, 4)

  # discard app.exec()

when isMainModule:
  main() 