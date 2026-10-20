struct TaskPrinter: TaskPrinting {
    private let linePrinter: LinePrinter

    init(linePrinter: LinePrinter) {
        self.linePrinter = linePrinter
    }

    func print(_ title: String, _ tasks: [TaskItem]) {
        guard !tasks.isEmpty else {
            linePrinter.printLine("\(title): отсутствуют.")
            return
        }

        linePrinter.printLine("\(title):")

        for task in tasks {
            linePrinter.printLine("  [\(task.isCompleted ? "V" : " ")] \(task.title) (\(task.category.rawValue))")
        }
    }
}
