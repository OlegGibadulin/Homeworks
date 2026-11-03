import SwiftUI

struct TaskListView: View {
    @Bindable var manager: TaskManager

    var body: some View {
        NavigationStack {
            List {
                ForEach(manager.getTasks()) { task in
                    TaskRowView(task: task)
                        .onTapGesture {
                            manager.toggleTaskCompletion(by: task.id)
                        }
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

    func addRandomTask() {
        let categories = [
            TaskCategory.work,
            TaskCategory.study,
            TaskCategory.personal,
            TaskCategory.other
        ]

        let category = categories.randomElement() ?? .other

        let id = manager.addTask(
            title: "Новая задача",
            category: category
        )
        print(id)
    }
}
