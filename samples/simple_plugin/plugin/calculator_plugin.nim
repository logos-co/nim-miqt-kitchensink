import ../../../vendor/seaqt/seaqt/qobject
import "../interface"

type
  CalculatorPlugin* = ref object of QObject
    m_name: string
    m_version: string

proc newCalculatorPlugin*(): CalculatorPlugin =
  var plugin = CalculatorPlugin()
  plugin.m_name = "Simple Calculator Plugin"
  plugin.m_version = "1.0.0"
  return plugin

# Implement CalculatorInterface methods
proc add*(self: CalculatorPlugin, a: int, b: int): int {.cdecl.} =
  return a + b

proc subtract*(self: CalculatorPlugin, a: int, b: int): int {.cdecl.} =
  return a - b

proc name*(self: CalculatorPlugin): string {.cdecl.} =
  return self.m_name

proc version*(self: CalculatorPlugin): string {.cdecl.} =
  return self.m_version 