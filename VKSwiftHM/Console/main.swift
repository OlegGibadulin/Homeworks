import Foundation

enum TaskCategory: String {
    case work = "💼 work"
    case study = "📚 study"
    case personal = "👦 personal"
}

struct Task: Identifiable, CustomStringConvertible {
    let id = UUID()
    let title: String
    var isCompleted = false
    let category: TaskCategory

    var description: String {
        "\(String(describing: type(of: self)))<\nid=\(id)\ntitle=\(title)\nisCompleted=\(isCompleted)\ncategory=\(category.rawValue)\n>"
    }
}

final class TaskManager {
    private var tasks: [Task] = []

    func addTask(title: String, category: TaskCategory) {
        tasks.append(Task(title: title, category: category))
    }

    func removeTask(by id: UUID) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else {
            return
        }
        tasks.remove(at: index)

    }

    func toggleTaskCompletion(by id: UUID) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else {
            return
        }
        tasks[index].isCompleted.toggle()
    }

    func filterTasks(by category: TaskCategory) -> [Task] {
        tasks.filter { $0.category == category && !$0.isCompleted }
    }
}


let manager = TaskManager()

manager.addTask(title: "Закончить отчёт", category: .work)
manager.addTask(title: "Сдать домашку", category: .study)
manager.addTask(title: "Купить продукты", category: .personal)
manager.addTask(title: "Созвон с командой", category: .work)

let reportID = manager.filterTasks(by: .work).first!.id
manager.toggleTaskCompletion(by: reportID)

print("Невыполненные задачи (Работа):")
for task in manager.filterTasks(by: .work) {
    print(task)
}
