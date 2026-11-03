import SwiftUI
@Observable
class TaskManager {
    private(set) var tasks:[Task] = []
    
    func AddTask(_ title: String, _ category: TaskCategory){
        let newTask = Task(title: title, category: category)
        tasks.append(newTask)
        
    }
    
    func removeTask(_ id: UUID){
        if tasks.contains(where: {task in task.id == id}){
            tasks.removeAll(where: {$0.id == id})
        }
        else{
            print("Can't find task with this id")
        }
    }
    
    func toggleTaskCompletion(_ id: UUID){
        if let index = tasks.firstIndex(where: {task in task.id == id}){
            tasks[index].isCompleted.toggle()
        }
        else{
            print("Can't find task with this id")
        }
    }
    
    func filterTasks(_ category: TaskCategory) -> [Task]{
        return tasks.filter{task in (task.category == category && !task.isCompleted)}
    }
    
    func removeAll(){
        tasks.removeAll()
    }
}
