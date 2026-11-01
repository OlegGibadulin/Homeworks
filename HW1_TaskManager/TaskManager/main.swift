import Foundation

// MARK: - 1. Модели данных

// Категория задачи. RawValue = String, поэтому у каждого case есть строка с эмодзи.
enum TaskCategory: String {
    case work = "💼 Работа"
    case study = "📚 Учёба"
    case personal = "🏠 Личное"
}

// Задача — структура (тип-значение). Identifiable требует свойство id.
struct Task: Identifiable {
    let id = UUID()              // генерируется автоматически при создании
    var title: String
    var isCompleted = false      // по умолчанию задача не выполнена
    var category: TaskCategory
}

// MARK: - 2. Менеджер задач

// Менеджер — класс (ссылочный тип): один общий объект, который хранит и меняет состояние.
class TaskManager {
    private var tasks: [Task] = []   // приватный массив: снаружи менять напрямую нельзя

    // Создаём задачу и добавляем в конец массива
    func addTask(title: String, category: TaskCategory) {
        let task = Task(title: title, category: category)
        tasks.append(task)
    }

    // Ищем индекс задачи по id и удаляем. Если такой нет — firstIndex вернёт nil и ничего не произойдёт.
    func removeTask(by id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks.remove(at: index)
        }
    }

    // Task — struct, поэтому меняем элемент прямо в массиве по индексу
    func toggleTaskCompletion(by id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    // Только НЕвыполненные задачи нужной категории
    func filterTasks(by category: TaskCategory) -> [Task] {
        return tasks.filter { $0.category == category && !$0.isCompleted }
    }

    // Все задачи только для чтения (чтобы в тесте взять id и распечатать список)
    func allTasks() -> [Task] {
        return tasks
    }
}

// MARK: - 3. Тестирование логики

let manager = TaskManager()

manager.addTask(title: "Сдать отчёт", category: .work)
manager.addTask(title: "Подготовиться к созвону", category: .work)
manager.addTask(title: "Сделать ДЗ по Swift", category: .study)
manager.addTask(title: "Купить продукты", category: .personal)

print("Все задачи:")
for task in manager.allTasks() {
    print("  [\(task.isCompleted ? "x" : " ")] \(task.title) — \(task.category.rawValue)")
}

// Отмечаем первую задачу выполненной
let firstId = manager.allTasks()[0].id
manager.toggleTaskCompletion(by: firstId)
print("\nОтметили выполненной: \(manager.allTasks()[0].title)")

// Фильтр: невыполненные задачи категории «Работа»
let workTasks = manager.filterTasks(by: .work)
print("\nНевыполненные задачи \(TaskCategory.work.rawValue):")
for task in workTasks {
    print("  - \(task.title)")
}

// Удаление с несуществующим UUID — программа не падает
manager.removeTask(by: UUID())
print("\nУдаление несуществующего id: задач осталось \(manager.allTasks().count)")

// Удаление реальной задачи
manager.removeTask(by: firstId)
print("Удалили «Сдать отчёт»: задач осталось \(manager.allTasks().count)")
