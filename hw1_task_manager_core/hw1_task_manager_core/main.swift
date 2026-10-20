//
//  main.swift
//  hw1_task_manager_core
//
//  Created by Федор Давыдов on 13.10.2026.
//

import Foundation

enum TaskCategory: String {
    case work = "Работа"
    case study = "Учёба"
    case personal = "Личное"
}

struct Task: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool
    let category: TaskCategory
}

class TaskManager {
    private var tasks: [Task] = []
    
    func addTask(title: String, category: TaskCategory) {
        tasks.append(Task(title: title, isCompleted: false, category: category))
    }
    
    func removeTask(id: UUID) {
        for i in 0...(tasks.count - 1) {
            guard tasks[i].id != id else {
                print("Задача \(tasks[i].title) удалена")
                tasks.remove(at: i)
                break
            }
        }
    }
    
    func toggleTaskCompletion(id: UUID) {
        if let index = tasks.firstIndex(where: {$0.id == id}) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    func filterTasks(category: TaskCategory) -> [Task] {
        return tasks.filter({$0.category == category && !$0.isCompleted})
    }
    
    func printTaskList() {
        print("Список задач:")
        for task in tasks {
            print(task)
        }
    }
}

let tm = TaskManager()

tm.addTask(title: "Погулять", category: TaskCategory.personal)
tm.addTask(title: "Поработать", category: TaskCategory.work)
tm.addTask(title: "Поработать", category: TaskCategory.work)
tm.addTask(title: "Поучиться", category: TaskCategory.study)


print(tm.printTaskList())

print("Введите id удаляемой задачи:")
let removeTaskIN = readLine()
if  let removeTask = removeTaskIN,
    let taskID = UUID(uuidString: removeTask){
    tm.removeTask(id: taskID)
} else {
    print("Задача не найдена")
}

print(tm.printTaskList())

print("Введите id изменяемой задачи:")
let changeTaskCompleteIN = readLine()
if  let changeTask = changeTaskCompleteIN,
    let taskID = UUID(uuidString: changeTask){
    tm.toggleTaskCompletion(id: taskID)
} else {
    print("Задача не найдена")
}

print(tm.printTaskList())

print("Введите category задач для вывода:")

let filterTaskIN = readLine()
if let category = filterTaskIN,
   let taskCategory = TaskCategory(rawValue: category) {
    print(tm.filterTasks(category: taskCategory))
} else {
    print("Категория не распознана. Возможные значения: Работа, Учёба, Личное")
}
