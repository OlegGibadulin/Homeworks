import SwiftUI

struct TaskListView: View {
    @StateObject private var manager = TaskManager()

    var body: some View {
        NavigationStack {
            List(manager.tasks) { task in
                TaskRowView(task: task)
                    .onTapGesture {
                        manager.toggleTaskCompletion(by: task.id)
                    }
            }
            .navigationTitle("Мои задачи📝")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("+") {
                        let categories: [TaskCategory] = [.work, .study, .personal]
                        manager.addTask(
                            title: "Новая задача",
                            category: categories.randomElement()!
                        )
                    }
                }
            }
        }
    }
}
