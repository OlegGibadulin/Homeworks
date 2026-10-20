import Foundation

let manager = TaskManager()
let linePrinter = ConsoleLinePrinter()
let printer = TaskPrinter(linePrinter: linePrinter)

let app = App(taskManager: manager, taskPrinter: printer, linePrinter: linePrinter)

app.run()
