//
//  main.swift
//  swift_hw_one
//
//  Created by Aleksandr Belofastov on 19.10.2026.
//

import Foundation

enum TaskCategory: String {
    case work = "💼 Работа"
    case study = "📚 Учеба"
    case personal = "🏠 Личное"
}

struct Task: Identifiable {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
    var category: TaskCategory
}

class TaskManager {
    private var tasks: [Task] = []

    func addTask(title: String, category: TaskCategory) {
        let task = Task(title: title, category: category)
        tasks.append(task)
    }

    func removeTask(by id: UUID) {
        tasks.removeAll { task in
            task.id == id
        }
    }
    func toggleTaskCompletion(by id: UUID) {
        if let index = tasks.firstIndex(where: { task in
            task.id == id
        }) {
            tasks[index].isCompleted.toggle()
        }
    }

    func filterTasks(by category: TaskCategory) -> [Task] {
        return tasks.filter { task in
            task.category == category && !task.isCompleted
        }
    }

    func getAllTasks() -> [Task] {
        return tasks
    }
}

let manager = TaskManager()

manager.addTask(title: "Сделать лабораторную", category: .study)
manager.addTask(title: "Подготовиться к экзамену", category: .study)
manager.addTask(title: "Закончить проект", category: .work)
manager.addTask(title: "Купить продукты", category: .personal)

print("Все задачи:")
for task in manager.getAllTasks() {
    print("\(task.title)  \(task.category.rawValue)  \(task.isCompleted)")
}

let allTasks = manager.getAllTasks()

manager.toggleTaskCompletion(by: allTasks[0].id)

print("Невыполненные учебные задачи:")
let studyTasks = manager.filterTasks(by: .study)

for task in studyTasks {
    print(task.title)
}

manager.removeTask(by: allTasks[3].id)

print("После удаления:")
for task in manager.getAllTasks() {
    print(task.title)
}

