import Foundation

enum TaskCategory: String {
    case work = "работа"
    case study = "учеба"
    case personal = "личное"
}

struct Task: Identifiable {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
    var category: TaskCategory
}

class TaskManager {
    private var task: [Task] = []

    func addTask(title: String, category: TaskCategory) {
        let newTask = Task(title: title, category: category)
        task.append(newTask)
    }

    func removeTask(by id: UUID) {
        var updateTask: [Task] = []
        for currentTask in task {
            if currentTask.id != id {
                updateTask.append(currentTask)
            }
        }
        task = updateTask
    }
    
    func toggleTaskCompletion(by id: UUID) {
        if let index = task.firstIndex(where: { $0.id == id }) {
            task[index].isCompleted.toggle()
        }
    }

    func filterTasks(by category: TaskCategory) -> [Task] {
        return task.filter { $0.category == category && !$0.isCompleted }
    }
}

let manager = TaskManager()

manager.addTask(title: "подготовить презетнацию", category: .work)
manager.addTask(title: "выучить новые слова", category: .study)
manager.addTask(title: "купить соль", category: .personal)
manager.addTask(title: "купить гель для душа", category: .personal)

let personalTasksBefore = manager.filterTasks(by: .personal)
for task in personalTasksBefore {
    print(task.title)
}

if let firstPersonalTask = personalTasksBefore.first {
    manager.toggleTaskCompletion(by: firstPersonalTask.id)
    print("\n✅ Выполнили задачу: \(firstPersonalTask.title)")
}

let personalTasksAfter = manager.filterTasks(by: .personal)
for task in personalTasksAfter {
    print(task.title)
}
