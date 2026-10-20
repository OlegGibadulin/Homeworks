import Foundation

// Категории задач

enum TaskCategory: String {
    case work = "💼 Работа"
    case study = "📚 Учёба"
    case personal = "🏠 Личное"
}

// Модель задачи

struct Task: Identifiable {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
    var category: TaskCategory
}

// Менеджер задач

class TaskManager {
    private var tasks: [Task] = []

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

// Проверка работы

let manager = TaskManager()

manager.addTask(title: "Доделать домашнее задание", category: .study)
manager.addTask(title: "Отправить отчёт руководителю", category: .work)
let groceries = manager.addTask(title: "Купить продукты", category: .personal)
manager.addTask(title: "Позвонить маме", category: .personal)

// Отмечаем одну задачу выполненной.
manager.toggleTaskCompletion(by: groceries.id)

print("Все задачи:")
for task in manager.allTasks {
    let mark = task.isCompleted ? "✅" : "⬜️"
    print("\(mark) \(task.title) — \(task.category.rawValue)")
}

print("\nНевыполненные задачи в категории «Личное»:")
for task in manager.filterTasks(by: .personal) {
    print("• \(task.title)")
}

// Удаляем выполненную задачу и проверяем, что список уменьшился.
manager.removeTask(by: groceries.id)
print("\nПосле удаления задачи осталось задач: \(manager.allTasks.count)")
