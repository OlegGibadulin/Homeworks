import Foundation

enum TaskCategory: String{
    case work = "Работа💼"
    case study = "Учёба📖"
    case personal = "Свои дела🫡"
}

struct Task: Identifiable{
    let id: UUID = UUID()
    let title: String
    var isCompleted: Bool = false
    let category: TaskCategory
}

class TaskManager {
    private var tasks: [Task] = []
    func addTask(title: String, category: TaskCategory){
        let t: Task = Task(title: title, category: category)
        tasks.append(t)
    }
    func removeTask(by id: UUID){
        tasks.removeAll(where: {(task: Task) -> Bool in
            return task.id == id
        })
    }
    func toggleTaskCompletion(by id: UUID) {
        guard let i = tasks.firstIndex(where: {(task: Task) -> Bool in
            task.id == id
        }) else{
            print("Нет такой задачи")
            return
        }
        tasks[i].isCompleted.toggle()
    }
    func filterTasks(by category: TaskCategory) -> [Task] {
        let ans = tasks.filter({ (task: Task) -> Bool in
            return !(task.isCompleted) && task.category == category
        })
        return ans
    }
    func getID(by title: String) -> UUID?{
        for task in tasks{
            if (task.title == title){
                return task.id
            }
        }
        return nil
    }
}

var manager: TaskManager = TaskManager()

manager.addTask(title: "Сделать ДЗ по iOS", category: .study)
manager.addTask(title: "Подготовиться к коллоквиуму", category: .study)
manager.addTask(title: "Отправить отчёт", category: .work)
manager.addTask(title: "Купить продукты", category: .personal)
print(manager.filterTasks(by: .study))
if let id = manager.getID(by: "Сделать ДЗ по iOS") {
    manager.toggleTaskCompletion(by: id)
} else {
    print("Задача не найдена")
}
print(manager.filterTasks(by: .study))
if let id = manager.getID(by: "Сделать ДЗ по iOS") {
    manager.toggleTaskCompletion(by: id)
} else {
    print("Задача не найдена")
}
print(manager.filterTasks(by: .study))
print(manager.filterTasks(by: .work))
if let id = manager.getID(by: "Купить продукты") {
    manager.removeTask(by: id)
} else {
    print("Задача не найдена")
}
print(manager.filterTasks(by: .personal))
manager.toggleTaskCompletion(by: UUID())
print(manager.filterTasks(by: .study))
let mng: TaskManager = TaskManager()
print(mng.filterTasks(by: .work))
