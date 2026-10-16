import Foundation

class TaskManager {
    private var tasks: [Task]
    
    init(tasks: [Task]) {
        self.tasks = tasks
    }
    
    func addTask(title: String, category: String) {
        tasks.append(
            Task(
                id: UUID.init(),
                title: title,
                category: TaskCategory(rawValue: category) ?? .other
            )
        )
    }
    
    func removeTask(by id: UUID) {
        tasks.removeAll(where: {$0.id == id})
    }
    
    func toggleTaskCompletion(by id: UUID) {
        guard let indexTask = tasks.firstIndex(where: {$0.id == id}) else {
            print("Данная задача отсутcтвует😔😔😔")
            return
        }
        tasks[indexTask].isCompleted.toggle()
    }
    
    func filterTasks(by category: TaskCategory) -> [Task] {
        return tasks.filter({$0.category == category && $0.isCompleted == false})
    }
    
    func printTasks() {
        for i in tasks {
            let compl = if i.isCompleted {"Выполнено"} else {"Невыполнено"}
            print("UUID: \(i.id)\nTitle: \(i.title)\nCategory: \(i.category.rawValue)\nCompleted: \(compl)\n\n")
        }
        print("_______________________________________________________\n\n")
    }
}
