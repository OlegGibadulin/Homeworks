//
//  TaskListView.swift
//  UIVKSwiftHomeworks
//
//  Created by Daniil Sukhanov on 27.10.2026.
//

import SwiftUI

struct TaskListView: View {
    @State private var viewModel = TaskListViewModel()

    var body: some View {
        NavigationStack {
            List {
                content
            }
            .navigationTitle("Мои задачи")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        guard let randomCategory = TaskCategory.allCases.randomElement() else {
                            return
                        }
                        withAnimation {
                            viewModel.addTask(title: "Новая задача", category: randomCategory)
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    @ViewBuilder
    var content: some View {
        if !viewModel.hasTasks {
            ContentUnavailableView(
                "Список пуст",
                systemImage: "checklist",
                description: Text("Нажмите «+», чтобы добавить задачу")
            )
        } else {
            Section {
                Text("Всего: \(viewModel.totalCount) • Выполнено: \(viewModel.completedCount)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            ForEach(viewModel.tasks) { task in
                TaskRowView(task: task) {
                    viewModel.toggleTaskCompletion(by: task.id)
                }
            }
            .onDelete { indexSet in
                for index in indexSet {
                    let task = viewModel.tasks[index]
                    withAnimation(.default) {
                        viewModel.removeTask(by: task.id)
                    }
                }
            }
        }
    }

}

#Preview {
    TaskListView()
}
