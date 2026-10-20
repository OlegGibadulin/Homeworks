import Foundation

enum TaskCategory: String{
    case work = "👩‍💻Work"
    case study = "📚Study"
    case personal = "🏂Chill"
}

struct Task: Identifiable{
    let id : UUID
    let title: String
    var isCompleted: Bool
    let category: TaskCategory
}

class TaskManager {
    fileprivate var Tasks:[Task] = []
     
    func AddTask(_ title: String, _ category: TaskCategory){
        let NewTask = Task(id: UUID(), title: title, isCompleted: false, category: category)
        Tasks.append(NewTask)
    }
    
    func RemoveTask(_ id: UUID){
        if Tasks.contains(where: {task in task.id == id}){
            Tasks.removeAll(where: {$0.id == id})
        }
        else{
            print("Can't find task with this id")
        }
    }

    func toggleTaskCompletion(_ id: UUID){
        if let index = Tasks.firstIndex(where: {task in task.id == id}){
            Tasks[index].isCompleted.toggle()
        }
        else{
            print("Can't find task with this id")
        }
    }
    
    func filterTasks(_ category: TaskCategory) -> [Task]{
        return Tasks.filter{task in (task.category == category && !task.isCompleted)}
    }
}

let Manager = TaskManager()
Manager.AddTask("начать читать рэп", .personal)
Manager.AddTask("начать делать курсач", .study)
Manager.AddTask("устроиться на завод", .work)
Manager.AddTask("стать сварщиком", .work)
        
if !Manager.Tasks.isEmpty{
    Manager.Tasks.forEach {print($0)}
    print()
}
else{
    print("Didnt find any tasks")
}
print()
let someTask = Manager.Tasks[0]
print("Статус до функции toggleTaskCompletion: \(someTask.isCompleted)")
Manager.toggleTaskCompletion(someTask.id)
let someTask1 = Manager.Tasks[0]
print("Статус после функции toggleTaskCompletion: \(someTask1.isCompleted)")

print()
print("Выведем задачи которые проходят через метод filterTasks по категории в переменной someCategory")
let someCategory: TaskCategory = .study
if Manager.Tasks.contains(where: {$0.category == someCategory}){
    print(Manager.filterTasks(someCategory))
}
else{
    print("Didnt find any tasks")
}


print("Вызовем удаление с несуществующим UUID:", terminator: " ")

let someUUID = UUID()
Manager.RemoveTask(someUUID)




