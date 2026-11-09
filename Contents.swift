import Foundation

// 1. Категории задач
enum TaskCategory: String {
    case work = "💼 Работа"
    case study = "📚 Учёба"
    case personal = "🌸 Личное"
}

// 2. Модель задачи
struct Task: Identifiable {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
    var category: TaskCategory
}

// 3. Менеджер задач
class TaskManager {
    private var tasks: [Task] = []

    // Добавление задачи
    @discardableResult
    func addTask(title: String, category: TaskCategory) -> UUID {
        let task = Task(title: title, category: category)
        tasks.append(task)
        return task.id
    }

    // Удаление задачи по ID
    func removeTask(by id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks.remove(at: index)
        }
    }

    // Изменение статуса выполнения
    func toggleTaskCompletion(by id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    // Фильтрация невыполненных задач по категории
    func filterTasks(by category: TaskCategory) -> [Task] {
        return tasks.filter {
            $0.category == category && !$0.isCompleted
        }
    }
}

// 4. Проверка работы программы
let manager = TaskManager()

manager.addTask(title: "Сделать домашнее задание", category: .study)
let studyTaskID = manager.addTask(title: "Повторить Swift", category: .study)
manager.addTask(title: "Подготовить проект", category: .work)
manager.addTask(title: "Посмотреть фильм", category: .personal)

// Отмечаем одну задачу выполненной
manager.toggleTaskCompletion(by: studyTaskID)

// Выводим невыполненные задачи по учёбе
let studyTasks = manager.filterTasks(by: .study)

print("Невыполненные задачи по учёбе:")

for task in studyTasks {
    print("- \(task.title) | \(task.category.rawValue)")
}
