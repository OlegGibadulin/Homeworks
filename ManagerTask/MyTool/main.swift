import Foundation

enum TaskCategory: String {
    case work = "💼 Работа"
    case study = "📚 Учеба"
    case personal = "🫡 Личное"
}

struct Task: Identifiable {
    let id: UUID = UUID()
    let title: String
    var isCompleted: Bool = false
    let category: TaskCategory
}

class TaskManager {
    private var tasks: [Task] = []

    func addTask(title: String, category: TaskCategory) -> UUID {
        let newTask = Task(
            title: title,
            category: category
        )

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

let manager = TaskManager()

let task1_id = manager.addTask(title: "DZ", category: .study)
let task2_id = manager.addTask(title: "Zadacha 12.1", category: .work)
let task3_id = manager.addTask(title: "Заправить кровать", category: .personal)

manager.showTasks()

manager.toggleTaskCompletion(by: task1_id)

print("-------------------------")

manager.showTasks()

manager.removeTask(by: task2_id)

print("-------------------------")

manager.showTasks()

print("-------------------------")

var filtered_manager = manager.filterTasks(by: .study)

print(filtered_manager)

print("-------------------------")

filtered_manager = manager.filterTasks(by: .personal)

print("\(filtered_manager[0].category.rawValue) - \(filtered_manager[0].title) - \(filtered_manager[0].isCompleted)")

