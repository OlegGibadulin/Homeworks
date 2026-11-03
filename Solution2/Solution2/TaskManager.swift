import Foundation
import SwiftUI

enum TaskCategory: String, CaseIterable{
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
@Observable
class TaskManager {
    private(set) var tasks: [Task] = []
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
    func printTasks(by category: TaskCategory) {
        var zadaniya: [Task] = []
        zadaniya = filterTasks(by: category)
        for task in zadaniya {
            print(task)
        }
    }
}
