import Foundation

enum TaskCategory: String{
    case work = "Work"
    case study = "Study"
    case personal = "Chill"
}

struct Task: Identifiable{
    let id : UUID
    var title: String
    var isCompleted: Bool
    let category: TaskCategory
}

class TaskManager {
    var Tasks:[Task] = []
    
    func AddTask(title: String, category: TaskCategory){
        let NewTask = Task(id: UUID(), title: title, isCompleted: false, category: category)
        Tasks.append(NewTask)
    }
    
    func RemoveTask(id: UUID){
        if Tasks.contains(where: {task in task.id == id}){
            Tasks.removeAll(where: {$0.id == id})
        }
        else{
            print("Can't find task with this id")
        }
    }
    
    func toggleTaskCompletion(by id: UUID){
        if let index = Tasks.firstIndex(where: {task in task.id == id}){
            Tasks[index].isCompleted.toggle()
        }
        else{
            print("Can't find task with this id")
        }
    }
    
    func filterTasks(by category: TaskCategory) -> [Task]{
        return Tasks.filter{task in (task.category == category && !task.isCompleted)}
    }
}

    
    var NewTask1 = Task(id: UUID(), title: "начать читать рэп", isCompleted: false, category: .personal)
    var NewTask2 = Task(id: UUID(), title: "начать делать курсач", isCompleted: false, category: .study)
    var NewTask3 = Task(id: UUID(), title: "скинуть отчет работодателю", isCompleted: false, category: .work)
    var NewTask4 = Task(id: UUID(), title: "стать сварщиком", isCompleted: false, category: .work)
    let Manager = TaskManager()
    Manager.Tasks.append(NewTask1)
    Manager.Tasks.append(NewTask2)
    Manager.Tasks.append(NewTask3)
    Manager.Tasks.append(NewTask4)
    
Manager.AddTask(title: "стать программистом", category: .study)
if let a = Manager.Tasks.last{
    print(a)
}
Manager.Tasks.forEach{print($0.title)}
print()
Manager.RemoveTask(id: NewTask1.id)
Manager.Tasks.forEach{print($0.title)}


