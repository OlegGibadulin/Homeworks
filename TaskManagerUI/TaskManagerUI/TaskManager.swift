import Foundation
import Observation

enum TaskCategory: String {
    case work = "💼 Работа"
    case study = "📚 Учеба"
    case personal = "🫡 Личное"
    case other = "📌 Другое"
}

struct Task: Identifiable {
    let id: UUID = UUID()
    let title: String
    var isCompleted: Bool = false
    let category: TaskCategory
}

@Observable
class TaskManager {
    private var tasks: [Task] = []

    init(initialTasks: [Task] = []) {
        tasks = initialTasks
    }

    func getTasks() -> [Task] {
        return tasks
    }

    func addTask(title: String, category: TaskCategory) -> UUID {
        let newTask = Task(title: title, category: category)
        tasks.append(newTask)
        return newTask.id
    }

    func showTasks() {
        for task in tasks {
            print("\(task.category.rawValue) - \(task.title) - \(task.isCompleted)")
        }
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
        return tasks.filter {
            $0.category == category && !$0.isCompleted
        }
    }
}
