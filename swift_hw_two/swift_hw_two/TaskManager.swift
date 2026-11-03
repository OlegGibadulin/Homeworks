import Foundation
import Observation

enum TaskCategory: String, CaseIterable {
    case work = "💼 Работа"
    case study = "📚 Учеба"
    case personal = "🏠 Личное"
}

enum Priority: String {
    case norm = "Обычный приоритет"
    case crit = "Сделать срочно"
}

struct Task: Identifiable {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
    var category: TaskCategory
    var priority: Priority
}

@Observable
class TaskManager {
    private(set) var tasks: [Task] = []

    func addTask(title: String, category: TaskCategory, priority: Priority) {
        tasks.append(Task(title: title, category: category, priority: priority))
    }

    func removeTask(by id: UUID) {
        tasks.removeAll { $0.id == id }
    }

    func toggleTaskCompletion(by id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    func filterTasks(by category: TaskCategory) -> [Task] {
        tasks.filter { $0.category == category && !$0.isCompleted }
    }

    func getAllTasks() -> [Task] {
        tasks
    }
}
