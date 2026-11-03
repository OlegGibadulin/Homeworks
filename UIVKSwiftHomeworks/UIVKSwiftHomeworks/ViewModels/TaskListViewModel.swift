//
//  TaskListViewModel.swift
//  UIVKSwiftHomeworks
//
//  Created by Daniil Sukhanov on 27.10.2026.
//

import Foundation
import Observation

@Observable
final class TaskListViewModel {
    private(set) var tasks: [Task] = []

    var totalCount: Int { tasks.count }

    var completedCount: Int {
        tasks.filter { $0.isCompleted }.count
    }

    var hasTasks: Bool { !tasks.isEmpty }

    func addTask(title: String, category: TaskCategory) {
        addTask(Task(title: title, category: category))
    }

    func addTask(_ task: Task) {
        tasks.append(task)
    }

    func removeTask(by id: UUID) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else { return }
        tasks.remove(at: index)
    }

    func toggleTaskCompletion(by id: UUID) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else { return }
        tasks[index].isCompleted.toggle()
    }

    func filterTasks(by category: TaskCategory) -> [Task] {
        tasks.filter { $0.category == category && !$0.isCompleted }
    }
}
