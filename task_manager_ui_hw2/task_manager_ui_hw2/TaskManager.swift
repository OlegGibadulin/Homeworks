import Foundation

class TaskManager: ObservableObject {
    @Published var tasks: [Task] = []

    func addTask(title: String, category: TaskCategory) {
        let newTask = Task(title: title, category: category)
        tasks.append(newTask)
    }

    func removeTask(by id: UUID) {
        guard let index = tasks.firstIndex(where: {$0.id == id}) else {
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
        return tasks.filter { $0.category == category && !$0.isCompleted }
    }
}
