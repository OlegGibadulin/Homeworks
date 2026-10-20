final class App {
    private let taskManager: TaskManager
    private let taskPrinter: TaskPrinting
    private let linePrinter: LinePrinter

    init(taskManager: TaskManager, taskPrinter: TaskPrinting, linePrinter: LinePrinter) {
        self.taskManager = taskManager
        self.taskPrinter = taskPrinter
        self.linePrinter = linePrinter
    }

    func run() {
        do {
            try runMainScenario()
        } catch TaskManagerError.elementNotFound {
            linePrinter.printLine("Ошибка: задача с указанным идентификатором не найдена.")
        } catch {
            linePrinter.printLine("Неожиданная ошибка: \(error).")
        }
    }

    private func addSamples() {
        taskManager.addTask(title: "Отнести велосипед на ТО", category: .personal)
        taskManager.addTask(title: "Сдать ДЗ по Swift", category: .study)
        taskManager.addTask(title: "Выполнить НИР", category: .study)
        taskManager.addTask(title: "Передвинуть таску в редмайне", category: .work)
    }

    private func runMainScenario() throws {
        addSamples()

        taskPrinter.print("Текущие учебные задачи", taskManager.filterTasks(by: .study))

        guard let homework = manager.filterTasks(by: .study).first else {
            fatalError("Не найдено ни одной учебной задачи.")
        }

        try taskManager.toggleTaskCompletion(by: homework.id)

        taskPrinter.print("Учебные задачи после выполнения '\(homework.title)'", taskManager.filterTasks(by: .study))
        taskPrinter.print("Рабочие задачи", taskManager.filterTasks(by: .work))
        taskPrinter.print("Личные задачи", taskManager.filterTasks(by: .personal))

        if let report = taskManager.filterTasks(by: .work).first {
            try taskManager.removeTask(by: report.id)
        }

        taskPrinter.print("Рабочие задачи после удаления первой", taskManager.filterTasks(by: .work))
    }
}
