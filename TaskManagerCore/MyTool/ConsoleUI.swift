//
//  ConsoleUI.swift
//  MyTool
//
//  Created by Egor Geniberg on 20.10.2026.
//

import Foundation

class ConsoleUI {
    func readInt(prompt: String) -> Int? {
        print(prompt, terminator: " ")
        guard let input = readLine(),
              let number = Int(input) else {
            print("Ошибка: введите целое число.")
            return nil
        }
        return number
    }

    func printTasks(_ tasks: [Task]) {
        if tasks.isEmpty {
            print("Список задач пуст.")
            return
        }
        
        for (index, task) in tasks.enumerated() {
            let status = task.isCompleted ? "Выполнена" : "Не выполнена"
            print("""
                \(index + 1). \(task.title)
                    Категория: \(task.category.rawValue)
                    Статус: \(status)
                """)
        }
    }

    func chooseCategory() -> TaskCategory? {
        print("""
            
            Выберите категорию:
            1. Работа
            2. Учеба
            3. Личное
            """)
        
        guard let choice = readInt(prompt: "Ваш выбор:") else {
            return nil
        }
        
        switch choice {
        case 1:
            return .work
        case 2:
            return .study
        case 3:
            return .personal
        default:
            print("Некорректный номер категории.")
            return nil
        }
    }

    func addTask(to manager: TaskManager) {
        print("Введите название задачи:", terminator: " ")
        guard let title = readLine(),
              !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            print("Название задачи не может быть пустым.")
            return
        }
        guard let category = chooseCategory() else {
            return
        }
        manager.addTask(title: title, category: category)
    }

    func removeTask(from manager: TaskManager) {
        let tasks = manager.allTasks
        guard !tasks.isEmpty else {
            print("Удалять нечего: список задач пуст.")
            return
        }
        printTasks(tasks)
        guard let number = readInt(prompt: "Введите номер задачи для удаления:"), tasks.indices.contains(number - 1) else {
            print("Некорректный номер задачи.")
            return
        }
        
        manager.removeTask(by: tasks[number - 1].id)
    }

    func toggleTask(in manager: TaskManager) {
        let tasks = manager.allTasks
        guard !tasks.isEmpty else {
            print("Список задач пуст.")
            return
        }
        printTasks(tasks)
        guard let number = readInt(prompt: "Введите номер задачи:"), tasks.indices.contains(number - 1) else {
            print("Некорректный номер задачи.")
            return
        }
        manager.toggleTaskCompletion(by: tasks[number - 1].id)
    }

    func filterTasks(in manager: TaskManager) {
        guard let category = chooseCategory() else {
            return
        }
        let filteredTasks = manager.filterTasks(by: category)
        print("\nНевыполненные задачи категории «\(category.rawValue)»:")
        printTasks(filteredTasks)
    }
}
