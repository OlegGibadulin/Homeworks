//
//  main.swift
//  hw_1_dubrov
//
//  Created by user on 19.10.2026.
//

import Foundation

enum TaskCategory: String{
    case study = "Учеба"
    case gym = "Спортзал"
    case home = "Дом"
}



struct Task : Identifiable{
    var id: UUID
    var title: String
    var isComlpeted: Bool = false
    var category: TaskCategory
}



class TaskManager{
    private var Tasks: [Task] = []
    
    func addTask(_ id: UUID, _ title: String, _ category: TaskCategory){
        let newTask = Task(id: id, title: title, isComlpeted: false, category: category)
        self.Tasks.append(newTask)
    }
    
    func removeTask(_ id: UUID){
        self.Tasks.removeAll(where: { $0.id == id})
    }
    
    func toggleTaskCompletion(_ id: UUID){
        if let id_tsk = Tasks.firstIndex(where: { $0.id == id}){
            self.Tasks[id_tsk].isComlpeted.toggle()
        }
    }
    
    func filterTasks (_ category: TaskCategory) -> [Task] {Tasks.filter({ $0.isComlpeted == false && $0.category == category})
    }
}



let test_task = TaskManager()

let id_1 = UUID()
let id_2 = UUID()
let id_3 = UUID()
let id_4 = UUID()

test_task.addTask(id_1, "Сделать ДЗ", TaskCategory.study)
test_task.addTask(id_2, "Постирать белье", TaskCategory.home)
test_task.addTask(id_3, "Оплатить абонемент", TaskCategory.gym)
test_task.addTask(id_4, "Помыть полы", TaskCategory.home)


print(test_task.filterTasks(TaskCategory.home))
test_task.toggleTaskCompletion(id_2)
print(test_task.filterTasks(TaskCategory.home))

