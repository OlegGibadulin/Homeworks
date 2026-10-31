import Foundation
import Observation

// Менеджер задач

@Observable
final class TaskManager {
    private var tasks: [Task]

    init(tasks: [Task] = TaskManager.samples) {
        self.tasks = tasks
    }

    static let samples: [Task] = [
        Task(title: "Помыть посуду", isCompleted: true, category: .personal),
        Task(title: "Сделать ДЗ по матстатистике", category: .study),
        Task(title: "Написать тесты для формы регистрации", category: .work),
    ]

    // Доступ только для чтения: сам массив изменить снаружи нельзя.
    var allTasks: [Task] {
        tasks
    }

    @discardableResult
    func addTask(title: String, category: TaskCategory) -> Task {
        let task = Task(title: title, category: category)
        tasks.append(task)
        return task
    }

    func removeTask(by id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks.remove(at: index)
        }
    }

    func toggleTaskCompletion(by id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    func filterTasks(by category: TaskCategory) -> [Task] {
        tasks.filter { $0.category == category && !$0.isCompleted }
    }
}
