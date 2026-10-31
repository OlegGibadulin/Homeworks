import Foundation

enum TaskCategory: String {
    case work = "Работа"
    case study = "Учеба"
    case personal = "Личная"
}

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
    var category: TaskCategory
}

class TaskManager {
    private var tasks: [Task]
    init (tasks: [Task]){
        self.tasks = tasks
    }
    func addTask(title: String,  category: TaskCategory) -> UUID {
        let newtask = Task(title: title, category: category)
        tasks.append(newtask)
        return newtask.id
    }
    func printAll(){
        for i in tasks {
            print("number id: \(i.id)")
            print("title of task: \(i.title)")
            print("is it completed: \(i.isCompleted)")
            print("category: \(i.category.rawValue)")
        }
    }
    func removeTask(by id: UUID){
        for i in 0..<tasks.count {
            if tasks[i].id == id {
                tasks.remove(at: i)
                break
            }
        }
    }
    func toggleTaskCompletion(by id: UUID){
        guard let index = tasks.firstIndex(where: { task in
            return task.id == id
        }) else { return }
        tasks[index].isCompleted.toggle()
    }
    func filterTasks(by category: TaskCategory) -> [Task] {
        return tasks.filter{
            element in
            !element.isCompleted && element.category == category
        }
    }
}

var answer = TaskManager(tasks: [])
let id1 = answer.addTask(title: "Почистить зубы", category: .personal)
let id2 = answer.addTask(title: "Выбросить мусор", category: .personal)
let id3 = answer.addTask(title: "Сделать чертеж", category: .study)
let id4 = answer.addTask(title: "Показать проект начальству", category: .work)

answer.toggleTaskCompletion(by: id2)
let personalTasks = answer.filterTasks(by: .personal)
print("невыполненные задачи категории Персональные: ")
if personalTasks.isEmpty {
    print("Нет невыполненных задач")
}
else{
    for task in personalTasks {
        print("- \(task.title) | выполнено: \(task.isCompleted) | категория: \(task.category.rawValue)")
    }
}
