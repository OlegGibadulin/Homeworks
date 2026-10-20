import Foundation

// 1. Категории задач
enum TaskCategory: String {
    case work = "💼 Работа"
    case study = "📚 Учёба"
    case personal = "🏠 Личное"
}

// 2. Модель задачи
struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted = false
    var category: TaskCategory
}

// 3. Менеджер задач
class TaskManager {
    private var tasks: [Task] = []

    // Добавить задачу
    @discardableResult
    func addTask(title: String, category: TaskCategory) -> UUID {
        let task = Task(title: title, category: category)
        tasks.append(task)
        return task.id
    }

    // Удалить задачу
    func removeTask(by id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks.remove(at: index)
        }
    }

    // Изменить статус задачи
    func toggleTaskCompletion(by id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    // Найти невыполненные задачи нужной категории
    func filterTasks(by category: TaskCategory) -> [Task] {
        return tasks.filter {
            $0.category == category && !$0.isCompleted
        }
    }
}

// 4. Проверка программы
let manager = TaskManager()

let taskID = manager.addTask(
    title: "Подготовить отчёт",
    category: .work
)

manager.addTask(title: "Изучить Swift", category: .study)
manager.addTask(title: "Купить продукты", category: .personal)
manager.addTask(title: "Отправить письмо", category: .work)

// Отмечаем первую задачу выполненной
manager.toggleTaskCompletion(by: taskID)

// Выводим невыполненные рабочие задачи
let result = manager.filterTasks(by: .work)

print("Невыполненные рабочие задачи:")

for task in result {
    print(task.title)
}
