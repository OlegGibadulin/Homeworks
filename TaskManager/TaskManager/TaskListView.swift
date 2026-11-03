//
//  TaskListView.swift
//  TaskManager
//
//  Created by Egor Geniberg on 01.11.2026.
//

import SwiftUI

struct TaskListView: View {
    @State private var taskManager = TaskManager(
        tasks: TaskSeeder.seedTasks()
    )
    
    var body: some View {
        NavigationStack {
            List(taskManager.allTasks) { task in
                TaskRowView(task: task)
                .contentShape(Rectangle())
                .onTapGesture {
                    taskManager.toggleTaskCompletion(
                        by: task.id
                    )
                }
            }
            .navigationTitle("Мои задачи")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addRandomTask()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    private func addRandomTask () {
        let categories = TaskCategory.allCases
        
        guard let randomCategory = categories.randomElement() else {
            return
        }
        
        taskManager.addTask(
            title: "Новая задача",
            category: randomCategory
        )
    }
}
