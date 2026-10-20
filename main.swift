import Foundation

enum TaskCategory: String {
    case work = "Работа"
    case study = "Учеба"
    case personal = "Личное"
}

struct Task: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool = false
    let category: TaskCategory
}

class TaskManager {
    private var tasks: [Task] = []
    
    func addTask(title: String, category: TaskCategory) {
        let newTask = Task(title: title, category: category)
        tasks.append(newTask)
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
        return tasks.filter { $0.category == category && !$0.isCompleted }
    }
    
    // Этот метод добавлен только для того, чтобы можно было выполнить пункт 3 задания.
    // Без него мы не можем получить id задачи для изменения статуса.
    func getAllTasks() -> [Task] {
        return tasks
    }
}

let taskManager = TaskManager()

taskManager.addTask(title: "Написать курсовую работу", category: .study)
taskManager.addTask(title: "Сделать отчет для руководителя", category: .work)
taskManager.addTask(title: "Купить продукты на неделю", category: .personal)
taskManager.addTask(title: "Оплатить коммунальные услуги", category: .personal)

// Меняем статус одной из задач на "выполнено"
if let firstTask = taskManager.getAllTasks().first {
    taskManager.toggleTaskCompletion(by: firstTask.id)
}

// Вызываем метод фильтрации и распечатываем результат
let filteredTasks = taskManager.filterTasks(by: .personal)

for task in filteredTasks {
    print("- \(task.title)")
}
