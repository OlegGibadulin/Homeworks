import SwiftUI

struct TaskListView: View {
    @State private var manager = TaskManager()

    var body: some View {
        NavigationStack {
            List {
                ForEach(manager.tasks) { task in
                    TaskRowView(task: task)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            manager.toggleTaskCompletion(by: task.id)
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                manager.removeTask(by: task.id)
                            } label: {
                                Label("Удалить", systemImage: "trash")
                            }
                        }
                }
            }
            .navigationTitle("Мои задачи")
            .toolbar {
                ToolbarItem {
                    Button {
                        manager.addTask(
                            title: "Новая задача",
                            category: TaskCategory.allCases.randomElement()!,
                            priority: .norm
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
    TaskListView()
}
