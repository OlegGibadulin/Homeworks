import SwiftUI

struct TaskListView: View {
    @State private var manager = TaskManager()

    var body: some View {
        NavigationStack {
            List {
                ForEach(manager.tasks) { task in
                    TaskRowView(task: task)
                        .onTapGesture {
                            manager.toggleTaskCompletion(by: task.id)
                        }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        manager.removeTask(by: manager.tasks[index].id)
                    }
                }
            }
            .navigationTitle("Мои задачи")
            .toolbar {
                Button {
                    let category = TaskCategory.allCases.randomElement() ?? .work
                    manager.addTask(title: "Новая задача", category: category)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    TaskListView()
}
