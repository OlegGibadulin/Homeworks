//
//  TaskManager.swift
//  MyTool
//
//  Created by Egor Geniberg on 20.10.2026.
//

import Foundation

class TaskManager {
    private var tasks: [Task] = []
    
    init(tasks: [Task] = []) {
        self.tasks = tasks
    }
    
    var allTasks: [Task] {
        tasks
    }
    
    func addTask(title: String, category: TaskCategory, showMessage: Bool = true) {
        let task = Task(title: title, category: category)
        tasks.append(task)
        if showMessage {
            print("Задача успешно добавлена.")
        }
    }
    
    func removeTask(by id: UUID) {
        if let index = tasks.firstIndex(where: {$0.id == id}) {
            tasks.remove(at: index)
            print("Задача успешно удалена.")
        } else {
            print("Задача не найдена.")
        }
    }
    
    func toggleTaskCompletion(by id: UUID, showMessage: Bool = true) {
        if let index = tasks.firstIndex(where: {$0.id == id}) {
            tasks[index].isCompleted.toggle()
            if showMessage {
                print("Статус задачи изменен.")
            }
        } else {
            print("Задача не найдена.")
        }
    }
    
    func filterTasks(by category: TaskCategory) -> [Task] {
        tasks.filter {task in
            task.category == category && !task.isCompleted
        }
    }
}
