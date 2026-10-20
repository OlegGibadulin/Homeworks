//
//  TaskSeeder.swift
//  MyTool
//
//  Created by Egor Geniberg on 20.10.2026.
//

import Foundation

class TaskSeeder {
    static func seedTasks() -> [Task] {
        [
            Task(title: "Подготовить отчёт", category: .work),
            Task(title: "Проверить рабочую почту", isCompleted: true, category: .work),
            Task(title: "Выполнить домашнее задание по физике", category: .study),
            Task(title: "Повторить уравнение Шредингера", category: .study),
            Task(title: "Купить продукты", category: .personal),
            Task(title: "Сходить на тренировку", category: .personal)
        ]
    }
}
