import Foundation
import Observation


@Observable
class TaskManager {
    private(set) var tasks: [Task] = [
        Task(title: "Сдать отчёт", category: .work),
        Task(title: "Сделать ДЗ по Swift", category: .study),
        Task(title: "Купить продукты", category: .personal)
    ]

    func addTask(title: String, category: TaskCategory) {
        let task = Task(title: title, category: category)
        tasks.append(task)
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
        return tasks.filter { $0.category == category && !$0.isCompleted }
    }
}
