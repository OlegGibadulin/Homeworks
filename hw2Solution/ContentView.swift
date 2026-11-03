// xcode: set sdk=iOS

//
//  ContentView.swift
//  hw2Solution
//
//  Created by marcel on 31.10.2026.
//

import SwiftUI

import Foundation

enum TaskCategory: String, CaseIterable {
    case work = "folder"
    case study = "lamp.desk"
    case personal = "person.fill"
    case family = "figure.2.and.child.holdinghands"
    
    var image: Image {
        Image(systemName: self.rawValue)
    }
    
}

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
    var category: TaskCategory
}

@Observable
class TaskManager {
    private var tasks: [Task]
    
    init (tasks: [Task]){
        self.tasks = tasks
    }
    
    var allTasks: [Task] {
        tasks
    }
    
    func newTask(title: String,  category: TaskCategory) {
        let newtask = Task(title: title, category: category)
        tasks.append(newtask)
    }
    
    func removeTask(by id: UUID) {
        tasks.removeAll { $0.id == id }
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

struct TaskRowView: View {
    
    var task: Task
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(task.isCompleted ? .green : .gray)
            Text(task.title)
            task.category.image
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}

struct TaskListView: View {
    @State private var manager = TaskManager(tasks: [
        Task(title: "Показать проект начальству", category: .work),
        Task(title: "Сделать домашку", category: .study),
        Task(title: "Вынести мусор", category: .personal),
        Task(title: "Подготовиться к контрольной", category: .study)
    ])
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(manager.allTasks) { task in
                    TaskRowView(task: task)
                        .onTapGesture {
                            manager.toggleTaskCompletion(by: task.id)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                manager.removeTask(by: task.id)
                            } label: {
                                Label("Удалить", systemImage: "trash")
                            }
                        }
                }
                
            }
            .navigationTitle("Мои Задачи")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        manager.newTask(title: "Придумать новые цели", category: TaskCategory.allCases.randomElement()!)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    TaskListView()
}
