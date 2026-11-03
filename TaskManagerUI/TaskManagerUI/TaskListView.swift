import SwiftUI

// Экран списка задач

struct TaskListView: View {
    @State private var manager = TaskManager()

    var body: some View {
        NavigationStack {
            List(manager.allTasks) { task in
                TaskRowView(task: task) {
                    manager.toggleTaskCompletion(by: task.id)
                }
            }
            .navigationTitle("Мои задачи")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        manager.addTask(
                            title: "Новая задача",
                            category: TaskCategory.allCases.randomElement() ?? .work
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
