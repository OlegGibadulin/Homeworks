//
//  TaskListView.swift
//  hw2_task_manager_ui
//
//  Created by Федор Давыдов on 03.11.2026.
//

import SwiftUI

enum TaskCategory: String, CaseIterable {
    case work = "💼 Работа"
    case study = "📚 Учёба"
    case personal = "🏠 Личное"
}

struct Task: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool = false
    let category: TaskCategory
}

@Observable
class TaskManager {
    
    private(set) var tasks: [Task] = []
    
    func addTask(title: String, category: TaskCategory) {
        tasks.append(Task(title: title, category: category))
    }
    
    func removeTask(id: UUID) {
        tasks.removeAll(where: { $0.id == id })
    }
    
    func toggleTaskCompletion(id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    func filterTasks(category: TaskCategory) -> [Task] {
        return tasks.filter({ $0.category == category && !$0.isCompleted })
    }
}


struct TaskRowView: View {
    let task: Task
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .font(.title2)
                .foregroundColor(task.isCompleted ? .green : .gray)
            
            Text(task.title)
            
            Spacer()
            
            Text(task.category.rawValue)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .contentShape(Rectangle())
    }
}


struct TaskScrollView: View {
    @State private var taskManager: TaskManager = {
        let manager = TaskManager()
        manager.addTask(title: "Погулять", category: .personal)
        manager.addTask(title: "Поработать", category: .work)
        manager.addTask(title: "Поучиться", category: .study)
        return manager
    }()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(taskManager.tasks) { task in
                        TaskRowView(task: task)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .onTapGesture {
                                taskManager.toggleTaskCompletion(id: task.id)
                            }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Мои задачи")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        taskManager.addTask(
                            title: "Новая задача",
                            category: TaskCategory.allCases.randomElement() ?? .personal
                        )
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    TaskScrollView()
}
