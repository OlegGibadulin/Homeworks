import Foundation
import Playgrounds

enum TaskCategory: String {
    case cardio = "🏃‍♀️ Кардио"
    case strength = "💪 Силовые"
    case street = "🌳 Улица"
}

struct Task: Identifiable {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
    var category: TaskCategory
}

class TaskManager {
    private var tasks: [Task] = []
    
    func addTask(title: String, category: TaskCategory) {
        let newTask = Task(title: title, category: category)
        tasks.append(newTask)
        print("добавлена задача \(newTask.title) в категорию \(newTask.category.rawValue)")
    }
    
    func removeTask(by id: UUID) {
        tasks.removeAll { $0.id == id }
    }
    
    func toggleTaskCompletion(by id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted.toggle()
            let status = tasks[index].isCompleted ? "выполнено 👍" : "не выполнено 👎"
            print("статус задачи \"\(tasks[index].title)\" изменен на \(status)")
        } else {
            print("pадача с таким id не найдена")
        }
    }
    
    func filterTasks(by category: TaskCategory) -> [Task] {
        return tasks.filter { $0.category == category && !$0.isCompleted
        }
    }
    
    func getAllTasks() -> [Task] {
        return tasks
    }
}

#Playground {
    print("НВЧАЛО ТЕСТА")
    let manager = TaskManager()
    manager.addTask(title: "бегит", category: .cardio)
    manager.addTask(title: "анжуманя", category: .strength)
    manager.addTask(title: "пресс качат", category: .strength)
    manager.addTask(title: "турник", category: .street)

    if let firstTask = manager.getAllTasks().first {
        manager.toggleTaskCompletion(by: firstTask.id)
    }

    print("РЕЗУЛЬТАТ ФИЛЬТРАЦИИ")
    let uncompletedTasks = manager.filterTasks(by: .strength)

    for task in uncompletedTasks {
        print("\(task.category.rawValue): \(task.title) | выполнено: \(task.isCompleted)")
    }
}
